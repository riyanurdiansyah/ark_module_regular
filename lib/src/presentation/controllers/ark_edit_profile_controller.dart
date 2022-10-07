import 'dart:developer';
import 'package:ark_module_regular/ark_module_regular.dart';
import 'package:ark_module_regular/src/data/datasources/remote/ark_profile_remote_datasource_impl.dart';
import 'package:ark_module_regular/src/data/dto/provinsi_dto.dart';
import 'package:ark_module_regular/src/data/repositories/ark_profile_repository_impl.dart';
import 'package:ark_module_regular/src/domain/entities/city_entity.dart';
import 'package:ark_module_regular/src/domain/entities/profile_entity.dart';
import 'package:ark_module_regular/src/domain/entities/provinsi_entity.dart';
import 'package:ark_module_regular/src/domain/usecases/profile_usecase.dart';
import 'package:ark_module_setup/ark_module_setup.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class ArkEditProfileController extends GetxController {
  final ProfileUseCase _useCase = ProfileUseCase(
      ArkProfileRepositoryImpl(ArkProfileRemoteDataSourceImpl()));

  final _pC = Get.find<ArkProfileController>();

  @override
  void onInit() async {
    await fnGetProfile();
    await _fnStoreDataToVar();
    await fnGetProvinsi();
    if (_userProvinsi.value.isNotEmpty) {
      await fnGetCity();
      _newProvinsi.value =
          _provinsi[_provinsi.indexWhere((e) => e.nama == _userProvinsi.value)];
    } else {
      newProvinsi.value = _provinsi[0];
    }
    await _fnChangeLoading(false);
    super.onInit();
  }

  final Rx<bool> _isLoading = true.obs;
  Rx<bool> get isLoading => _isLoading;

  final String _errorMessage = '';
  String get errorMessage => _errorMessage;

  final Rx<ProfileEntity> _profile = ProfileEntity().obs;
  Rx<ProfileEntity> get profile => _profile;

  final Rx<String> _userProvinsi = ''.obs;
  Rx<String> get userProvinsi => _userProvinsi;

  final RxList<ProvinsiDataEntity> _provinsi = <ProvinsiDataEntity>[].obs;
  RxList<ProvinsiDataEntity> get provinsi => _provinsi;

  final Rx<ProvinsiDataEntity> _newProvinsi =
      const ProvinsiDataEntity(id: -1, nama: '').obs;
  Rx<ProvinsiDataEntity> get newProvinsi => _newProvinsi;

  final Rx<CityEntity> _city = const CityEntity(kotaKabupaten: []).obs;
  Rx<CityEntity> get city => _city;

  final TextEditingController _tcName = TextEditingController();
  TextEditingController get tcName => _tcName;

  final TextEditingController _tcHp = TextEditingController();
  TextEditingController get tcHp => _tcHp;

  final TextEditingController _tcProfesiLainnya = TextEditingController();
  TextEditingController get tcProfesiLainnya => _tcProfesiLainnya;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  GlobalKey<FormState> get formKey => _formKey;

  final Rx<String> _txtTanggalLahir = ''.obs;
  Rx<String> get txtTanggalLahir => _txtTanggalLahir;

  final Rx<String> _txtProfesi = ''.obs;
  Rx<String> get txtProfesi => _txtProfesi;

  final Rx<String> _txtCity = ''.obs;
  Rx<String> get txtCity => _txtCity;

  final Rx<String> _txtPendidikan = ''.obs;
  Rx<String> get txtPendidikan => _txtPendidikan;

  final Rx<JenisKelamin> _selectedGender = JenisKelamin.defaultGender.obs;
  Rx<JenisKelamin> get selectedGender => _selectedGender;

  Future _fnStoreDataToVar() async {
    _userProvinsi.value = _profile.value.data!.provinsi;
    _tcHp.text = _profile.value.data!.noHp;
    _tcName.text = _profile.value.data!.fullname;
    _txtProfesi.value = listProfesi.contains(_profile.value.data!.profession)
        ? _profile.value.data!.profession
        : listProfesi.last;

    _tcProfesiLainnya.text =
        listProfesi.contains(_profile.value.data!.profession)
            ? ''
            : _profile.value.data!.profession;
    _txtCity.value = _profile.value.data!.kota;
    _txtTanggalLahir.value = _profile.value.data!.tglLahir;
    _txtPendidikan.value = _profile.value.data!.pendidikanTerakhir;
    if (_profile.value.data!.jenisKelamin == 'L') {
      _selectedGender.value = JenisKelamin.pria;
    } else if (_profile.value.data!.jenisKelamin == 'P') {
      _selectedGender.value = JenisKelamin.wanita;
    } else {
      _selectedGender.value = JenisKelamin.defaultGender;
    }
  }

  Future _fnChangeLoading(bool val) async {
    _isLoading.value = val;
  }

  Future fnGetProfile() async {
    final response = await _useCase.getProfile(_pC.token.value);
    response.fold(
      ///IF RESPONSE IS ERROR
      (fail) {
        ExceptionHandle.execute(fail);
        _profile.value = ProfileEntity.withError(_errorMessage);
      },

      ///IF RESPONSE SUCCESS
      (data) {
        _profile.value = data;
      },
    );
  }

  Future fnGetProvinsi() async {
    final response = await _useCase.getProvinsi();
    response.fold(
      ///IF RESPONSE IS ERROR
      (fail) => ExceptionHandle.execute(fail),

      ///IF RESPONSE SUCCESS
      (data) {
        _provinsi.value = data.provinsi;
        _provinsi.insert(
            0, const ProvinsiDataDTO(id: -1, nama: 'Silahkan Pilih Provinsi'));
      },
    );
  }

  Future fnGetCity() async {
    final id = _provinsi[_provinsi.indexWhere((e) =>
            e.nama.toLowerCase().contains(_userProvinsi.value.toLowerCase()))]
        .id;
    final response = await _useCase.getCity(id);
    response.fold(
      ///IF RESPONSE IS ERROR
      (fail) => ExceptionHandle.execute(fail),

      ///IF RESPONSE SUCCESS
      (data) {
        _city.value = data;
      },
    );
  }

  void fnGetNewCity() async {
    final response = await _useCase.getCity(_newProvinsi.value.id);
    response.fold(
      ///IF RESPONSE IS ERROR
      (fail) => ExceptionHandle.execute(fail),

      ///IF RESPONSE SUCCESS
      (data) {
        _city.value = data;
        _txtCity.value = _city.value.kotaKabupaten[0].nama;
      },
    );
  }

  void fnOnChangedProvinsi(ProvinsiDataEntity? value) {
    _newProvinsi.value = value!;
    _txtCity.value = '';
    if (value.nama != 'Silahkan Pilih Provinsi') {
      fnGetNewCity();
    }
  }

  void fnOnChangedGender(JenisKelamin? val) {
    _selectedGender.value = val!;
  }

  void fnCheckStateUpdateProfile() async {
    if (_formKey.currentState!.validate()) {
      if (_txtProfesi.value == 'Lainnya' &&
          _tcProfesiLainnya.value.text.isEmpty) {
        AppDialog.dialogStateWithLottie(
          'fail-animation.json',
          'Profesi lainnya tidak boleh kosong',
        );
      } else {
        AppDialog.dialogLoading();
        final data = ProfileDataEntity(
          fullname: tcName.text,
          location: '',
          bio: '',
          facebook: '',
          twitter: '',
          profession: _txtProfesi.value == 'Lainnya'
              ? _tcProfesiLainnya.text
              : _txtProfesi.value,
          tglLahir: _txtTanggalLahir.value,
          provinsi: _newProvinsi.value.nama == 'Silahkan Pilih Provinsi'
              ? ''
              : _newProvinsi.value.nama,
          kota: _txtCity.value,
          jenisKelamin: _selectedGender.value == JenisKelamin.pria
              ? 'L'
              : _selectedGender.value == JenisKelamin.wanita
                  ? 'P'
                  : '',
          noHp: _tcHp.text,
          pendidikanTerakhir: _txtPendidikan.value,
        );
        await fnUpdateProfile(data);
        fnUpdateProfilePrakerja();
      }
    }
  }

  Future fnUpdateProfile(ProfileDataEntity data) async {
    final response = await _useCase.updateProfile(data, _pC.token.value);
    response.fold(
      ///IF RESPONSE IS ERROR
      (fail) {
        ExceptionHandle.execute(fail);
        Get.back();
      },

      ///IF RESPONSE SUCCESS
      (data) async {
        await _pC.fnGetProfile();
        if (isCompletedForm) {
          log('FORM UPDATE PROFILE LENGKAP');
          await fnUpdateCoin();
        } else {
          Get.back();
          Get.back();
          AppDialog.dialogStateWithLottie(
              'success-animation.json', 'Profile berhasil diperbarui');
          Future.delayed(
            const Duration(seconds: 3),
            () {
              Get.back();
            },
          );
        }
      },
    );
  }

  void fnUpdateProfilePrakerja() async {
    final nameJson = {
      "field": {
        "id": 1,
        "type": "textbox",
        "name": "Nama Lengkap",
        "value": _tcName.text,
      }
    };

    final hpJson = {
      "field": {
        "id": 86,
        "value": _tcHp.text,
      }
    };

    final birthDateJson = {
      "field": {
        "id": 88,
        "value": _txtTanggalLahir.value,
      }
    };

    final genderPrakerjaJson = {
      "field": {
        "id": 95,
        "value": _selectedGender.value == JenisKelamin.pria
            ? "L"
            : _selectedGender.value == JenisKelamin.wanita
                ? "P"
                : "",
      }
    };

    final provinceJson = {
      "field": {
        "id": 87,
        "value": _newProvinsi.value.nama == 'Silahkan Pilih Provinsi'
            ? ''
            : _newProvinsi.value.nama,
      }
    };
    final cityJson = {
      "field": {
        "id": 89,
        "value": _txtCity.value,
      }
    };

    final degreeJson = {
      "field": {
        "id": 90,
        "value": _txtPendidikan.value,
      }
    };

    final profesiJson = {
      "field": {
        "id": 73,
        "value": _txtProfesi.value == 'Lainnya'
            ? _tcProfesiLainnya.text
            : _txtProfesi.value,
      }
    };

    List<Map<String, Map<String, Object>>> listJson = [
      nameJson,
      hpJson,
      birthDateJson,
      genderPrakerjaJson,
      provinceJson,
      cityJson,
      degreeJson,
      profesiJson,
    ];

    if (_tcName.text != _profile.value.data!.fullname) {
      await _useCase.updateProfilePrakerja(_pC.tokenPrakerja.value, nameJson);
    }

    if (_tcHp.text != _profile.value.data!.noHp) {
      final response =
          await _useCase.updateProfilePrakerja(_pC.tokenPrakerja.value, hpJson);
    }
  }

  bool get isCompletedForm =>
      _tcName.text.isNotEmpty &&
      _tcHp.text.isNotEmpty &&
      _txtTanggalLahir.value.isNotEmpty &&
      _selectedGender.value != JenisKelamin.defaultGender &&
      _txtPendidikan.value.isNotEmpty &&
      _txtProfesi.value.isNotEmpty;

  Future fnUpdateCoin() async {
    if (_pC.coin.value.isCompleted == false) {
      int coinNow = _pC.coin.value.coins ?? 0;
      int coinUpdate = 0;
      if (_pC.coin.value.isOldUser == null ||
          _pC.coin.value.isOldUser == true) {
        coinUpdate = coinNow + 10000;
      } else {
        coinUpdate = coinNow + 5000;
      }
      final data = {
        "coins": coinUpdate,
        "isCompleted": true,
        "updatedAt": Timestamp.fromDate(DateTime.now()),
      };

      final response = await _useCase.updateCoin(_pC.userId.value, data);
      response.fold(
          (fail) => Fluttertoast.showToast(
              msg: "Error 500x : Failed update coin.. try again"), (r) {
        Get.back();
        Get.back();
        AppDialog.dialogStateWithLottie(
            'success-animation.json', 'Profile berhasil diperbarui');
        Future.delayed(
          const Duration(seconds: 3),
          () {
            Get.back();
          },
        );
      });
    } else {
      Get.back();
      Get.back();
      AppDialog.dialogStateWithLottie(
          'success-animation.json', 'Profile berhasil diperbarui');
      Future.delayed(
        const Duration(seconds: 3),
        () {
          Get.back();
        },
      );
    }
  }
}
