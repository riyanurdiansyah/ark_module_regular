import 'dart:developer';
import 'dart:io';
import 'dart:isolate';
import 'dart:ui';
import 'package:ark_module_regular/src/data/datasources/remote/ark_profile_remote_datasource_impl.dart';
import 'package:ark_module_regular/src/data/repositories/ark_profile_repository_impl.dart';
import 'package:ark_module_regular/src/domain/entities/sertifikat_entitiy.dart';
import 'package:ark_module_regular/src/domain/usecases/ark_profile_usecase.dart';
import 'package:ark_module_setup/ark_module_setup.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:share/share.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

class ArkSertifikatController extends GetxController {
  final ArkProfileUseCase _useCase = ArkProfileUseCase(
      ArkProfileRepositoryImpl(ArkProfileRemoteDataSourceImpl()));

  late SharedPreferences prefs;

  RxList<bool> listExpanded = <bool>[].obs;

  late ExpandableController expandableController;

  @override
  void onInit() async {
    await _fnSetup();
    await fnGetAllCertificate();
    await _fnDownloadListener();
    await _fnChangeLoading(false);
    super.onInit();
  }

  @override
  void onClose() {
    IsolateNameServer.removePortNameMapping('downloader_cert');
    _port.close();
    _txSearch.dispose();
    super.onClose();
  }

  final GlobalKey<ScaffoldState> _scaffoldkey = GlobalKey<ScaffoldState>();
  GlobalKey<ScaffoldState> get scaffoldkey => _scaffoldkey;

  final Rx<SertifikatEntity> _sertifikat = SertifikatEntity().obs;
  Rx<SertifikatEntity> get sertifikat => _sertifikat;

  final RxList<SertifikatDataEntity> _sertifikatKelulusan =
      <SertifikatDataEntity>[].obs;
  RxList<SertifikatDataEntity> get sertifikatKelulusan => _sertifikatKelulusan;

  final RxList<SertifikatDataEntity> _sertifikatPenyelesaian =
      <SertifikatDataEntity>[].obs;
  RxList<SertifikatDataEntity> get sertifikatPenyelesaian =>
      _sertifikatPenyelesaian;

  final RxList<SertifikatDataEntity> _listSertifikatResult =
      <SertifikatDataEntity>[].obs;
  RxList<SertifikatDataEntity> get listSertifikatResult =>
      _listSertifikatResult;

  final ReceivePort _port = ReceivePort();

  final Rx<int> _indexSertif = 00.obs;
  Rx<int> get indexSertif => _indexSertif;

  final RxList<int> _progresDownload = <int>[].obs;
  RxList<int> get progresDownload => _progresDownload;

  final Rx<int> _indexTabSertif = 0.obs;
  Rx<int> get indexTabSertif => _indexTabSertif;

  final Rx<bool> _isLoading = true.obs;
  Rx<bool> get isLoading => _isLoading;

  final Rx<bool> _isHaveQuerySearch = false.obs;
  Rx<bool> get isHaveQuerySearch => _isHaveQuerySearch;

  final Rx<String> _txtUrutkan = 'Urutkan'.obs;
  Rx<String> get txtUrutkan => _txtUrutkan;

  final TextEditingController _txSearch = TextEditingController();
  TextEditingController get txSearch => _txSearch;

  final String _errorMessage = '';
  String get errorMessage => _errorMessage;

  String _userId = '';
  String get userId => _userId;

  Future _fnSetup() async {
    expandableController = ExpandableController();
    prefs = await SharedPreferences.getInstance();
    _userId = prefs.getString('user_id')!;
    expandableController.addListener(() {
      log("CEK EXPANDED");
    });
  }

  ///LISTEN PORT IF HAVE A DOWNLOAD ACTION
  Future _fnDownloadListener() async {
    IsolateNameServer.registerPortWithName(_port.sendPort, 'downloader_cert');
    _port.listen((dynamic data) {
      _progresDownload[_indexSertif.value] = data[2];
      DownloadTaskStatus status = data[1];
      log("PROGRESS DOWNLOAD : $_progresDownload");
      if (status == DownloadTaskStatus.complete &&
          _progresDownload[_indexSertif.value] == 100) {
        log("DOWNLOAD RAMPUNG");
        AppSnackbar.defaultSnack(
            _scaffoldkey.currentContext!, 'Sertifikat berhasil di unduh');
      }
    });

    FlutterDownloader.registerCallback(downloadCallback);
  }

  ///CALLBACK IF BUTTON IS PRESSED
  static void downloadCallback(
      String id, DownloadTaskStatus status, int progress) {
    final SendPort? send =
        IsolateNameServer.lookupPortByName('downloader_cert');
    send!.send([id, status, progress]);
  }

  ///CHANGE TAB INDEX
  void fnOnChangeSertif(int val) {
    ///RESET SEARCH WITH EMPTY STRING
    fnOnSearchCertificate('');
    _listSertifikatResult.clear();
    _txtUrutkan.value = 'Urutkan';
    _indexTabSertif.value = val;
  }

  ///FETCH ALL CATEGORY
  Future fnGetAllCertificate() async {
    ///CHANGE STATE LOADING
    _fnChangeLoading(true);

    ///GET VALUE FROM USECASE
    final response = await _useCase.getAllCertificate(_userId);

    ///CHECK RESPONSE IS A SUCCES OR ERROR
    response.fold(
      ///IF RESPONSE IS ERROR
      (fail) {
        ExceptionHandle.execute(fail);
        _sertifikat.value = SertifikatEntity.withError(errorMessage);
      },

      ///IF RESPONSE SUCCESS
      (data) {
        for (int i = 0; i < data.certificates!.length; i++) {
          _progresDownload.add(0);
        }
        log("DOWNLOAD PROGRESS : $_progresDownload");
        _sertifikat.value = data;
        _sertifikatKelulusan.value =
            data.certificates?.where((e) => e.tipe == 'kelulusan').toList() ??
                [];
        _sertifikatPenyelesaian.value = data.certificates
                ?.where((e) => e.tipe == 'penyelesaian')
                .toList() ??
            [];
      },
    );
    await _fnChangeLoading(false);
  }

  void fnCheckPermission(int indexVal) async {
    final status = await Permission.storage.request();
    if (status.isGranted) {
      if (_progresDownload[indexVal] == 0 ||
          _progresDownload[indexVal] == 100) {
        fnDownloadCertificate(indexVal);
      } else {
        AppSnackbar.defaultSnack(_scaffoldkey.currentContext!,
            'Anda sedang mendownload sertifikat ini..');
      }
    } else {
      await Permission.storage.request();
    }
  }

  void fnDownloadCertificate(int indexVal) async {
    log("START DOWNLOAD CERTIFICATE");
    _indexSertif.value = indexVal;
    final storageDir = (await _fnFindLocalPath());
    final savedDir = Directory(storageDir!);
    bool hasExisted = await savedDir.exists();
    if (!hasExisted) {
      savedDir.create();
    }
    await FlutterDownloader.enqueue(
      url: _sertifikat.value.certificates![indexVal].certificateUrl,
      savedDir: storageDir,
      showNotification: true,
      openFileFromNotification: true,
      saveInPublicStorage: true,
    );
  }

  Future _fnChangeLoading(bool val) async {
    _isLoading.value = val;
  }

  Future<String?> _fnFindLocalPath() async {
    String? externalStorageDirPath;
    if (GetPlatform.isAndroid) {
      final directory = await getExternalStorageDirectory();
      externalStorageDirPath = directory?.path;
    } else if (GetPlatform.isIOS) {
      externalStorageDirPath = (await getApplicationDocumentsDirectory()).path;
    }
    return externalStorageDirPath;
  }

  void fnOnSearchCertificate(String query) async {
    if (query.isNotEmpty) {
      _isHaveQuerySearch.value = true;
    } else {
      log('KOSONG QUERY');
      _txSearch.clear();
      _listSertifikatResult.clear();
      _isHaveQuerySearch.value = false;
    }
    if (_indexTabSertif.value == 0) {
      if (_sertifikatPenyelesaian.isNotEmpty) {
        _fnChangeLoading(true);
      }
      for (var e in _sertifikat.value.certificates!
          .where((e) => e.tipe == 'penyelesaian')
          .toList()) {
        log("SEARCH SERTIF PENYELESAIAN");
        if (e.courseName.contains(query)) {
          _listSertifikatResult.add(e);
        }
      }
      _sertifikatPenyelesaian.value = _listSertifikatResult
          .where(
            (e) => e.courseName.toLowerCase().contains(
                  txSearch.text,
                ),
          )
          .toSet()
          .toList();
    } else {
      if (_sertifikatKelulusan.isNotEmpty) {
        _fnChangeLoading(true);
      }
      log("SEARCH SERTIF KELULUSAN");
      for (var e in _sertifikat.value.certificates!
          .where((e) => e.tipe == 'kelulusan')
          .toList()) {
        if (e.courseName.contains(query)) {
          _listSertifikatResult.add(e);
        }
      }
      _sertifikatKelulusan.value = _listSertifikatResult
          .where(
            (e) => e.courseName.toLowerCase().contains(
                  txSearch.text,
                ),
          )
          .toSet()
          .toList();
    }
    Future.delayed(const Duration(milliseconds: 300), () {
      _fnChangeLoading(false);
    });
  }

  void fnSortCertificate(String sortBy) async {
    _fnChangeLoading(true);
    _txtUrutkan.value = sortBy;
    if (_indexTabSertif.value == 0) {
      if (sortBy == 'A - Z') {
        _sertifikatPenyelesaian
            .sort(((a, b) => a.courseName.compareTo(b.courseName)));
      }

      if (sortBy == 'Z - A') {
        _sertifikatPenyelesaian
            .sort(((a, b) => b.courseName.compareTo(a.courseName)));
      }

      if (sortBy == 'Terbaru') {
        _sertifikatPenyelesaian
            .sort(((a, b) => a.certificateDate.compareTo(b.certificateDate)));
      }
    }

    if (_indexTabSertif.value == 1) {
      if (sortBy == 'A - Z') {
        _sertifikatKelulusan
            .sort(((a, b) => a.courseName.compareTo(b.courseName)));
      }

      if (sortBy == 'Z - A') {
        _sertifikatKelulusan
            .sort(((a, b) => b.courseName.compareTo(a.courseName)));
      }

      if (sortBy == 'Terbaru') {
        _sertifikatKelulusan
            .sort(((a, b) => a.certificateDate.compareTo(b.certificateDate)));
      }
    }
    Future.delayed(const Duration(milliseconds: 300), () {
      _fnChangeLoading(false);
    });
  }

  void fnSharedCertificate(String caption) {
    Share.share(caption);
  }

  void fnShareToLinkedin(SertifikatDataEntity sertif) async {
    final date = DateFormat.yMMM().parse(sertif.issueDate);
    if (await canLaunchUrl(Uri.parse(
        '$linkedinUrl&name=${sertif.courseName}&organizationId=26580730&issueYear=${date.year}&issueMonth=${date.month}&expirationYear=${date.year + 3}&expirationMonth=${date.month}&certUrl=${sertif.certificateUrl}&certId=${sertif.certificateId}'))) {
      launchUrl(
        Uri.parse(
          '$linkedinUrl&name=${sertif.courseName}&organizationId=26580730&issueYear=${date.year}&issueMonth=${date.month}&expirationYear=${date.year + 3}&expirationMonth=${date.month}&certUrl=${sertif.certificateUrl}&certId=${sertif.certificateId}',
        ),
        mode: LaunchMode.externalApplication,
      );
    }
  }
}
