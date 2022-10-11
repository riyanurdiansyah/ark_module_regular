import 'dart:convert';

import 'package:ark_module_regular/src/data/datasources/remote/ark_my_class_remote_datasource_impl.dart';
import 'package:ark_module_regular/src/data/repositories/ark_my_class_repository_impl.dart';
import 'package:ark_module_regular/src/domain/entities/my_course_entity.dart';
import 'package:ark_module_regular/src/domain/usecases/ark_my_class_usecase.dart';
import 'package:ark_module_setup/ark_module_setup.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ArkMyClassController extends GetxController {
  final ArkMyClassUseCase _useCase = ArkMyClassUseCase(
      ArkMyClassRepositoryImpl(ArkMyClassRemoteDataSourceImpl()));

  final Rx<bool> _isLoading = true.obs;
  Rx<bool> get isLoading => _isLoading;

  final Rx<bool> _isLoadingCourse = true.obs;
  Rx<bool> get isLoadingCourse => _isLoadingCourse;

  late SharedPreferences prefs;

  final Rx<String> _token = ''.obs;
  Rx<String> get token => _token;

  final RxList<MyCourseEntity> _listCourse = <MyCourseEntity>[].obs;
  RxList<MyCourseEntity> get listCourse => _listCourse;

  final RxList<MyCourseEntity> _listCourseFinished = <MyCourseEntity>[].obs;
  RxList<MyCourseEntity> get listCourseFinished => _listCourseFinished;

  final RxList<MyCourseEntity> _listCourseActive = <MyCourseEntity>[].obs;
  RxList<MyCourseEntity> get listCourseActive => _listCourseActive;

  final RxList<MyCourseEntity> _listCourseExpired = <MyCourseEntity>[].obs;
  RxList<MyCourseEntity> get listCourseExpired => _listCourseExpired;

  @override
  void onInit() async {
    await _setup();
    await getMyCourse();
    await _fnChangeLoading(false);
    super.onInit();
  }

  Future _fnChangeLoading(bool val) async {
    _isLoading.value = val;
  }

  Future _fnChangeLoadingCourse(bool val) async {
    _isLoadingCourse.value = val;
  }

  Future _setup() async {
    prefs = await SharedPreferences.getInstance();
    _token.value = prefs.getString('token_access') ?? '';
  }

  Future getMyCourse() async {
    _fnChangeLoadingCourse(true);

    final response = await _useCase.getMyCourse(_token.value);
    response.fold(
      ///IF RESPONSE IS ERROR
      (fail) => ExceptionHandle.execute(fail),

      ///IF RESPONSE SUCCESS
      (data) async {
        _listCourseActive.clear();
        _listCourseFinished.clear();
        _listCourseExpired.clear();
        _listCourse.value = data;
        _saveMyCourseToCache(json.encode(_listCourse.toJson()));
        for (int i = 0; i < data.length; i++) {
          final date = DateTime.fromMicrosecondsSinceEpoch(
              int.parse(data[i].userExpiry) * 1000000);
          final expired = date.difference(DateTime.now()).inMicroseconds;
          if ((data[i].userStatus == "3" || data[i].userStatus == "4") &&
              expired >= 0) {
            _listCourseFinished.add(data[i]);
          } else {
            if (expired <= 0) {
              _listCourseExpired.add(data[i]);
            } else {
              _listCourseActive.add(data[i]);
            }
          }
        }
      },
    );
    await _fnChangeLoadingCourse(false);
  }

  void _saveMyCourseToCache(String data) async {
    await prefs.setString('cache_kelas_saya', data);
  }

  void _loadMyCourseFromCache() {}
}
