import 'dart:convert';
import 'dart:developer';

import 'package:ark_module_regular/src/data/datasources/remote/ark_home_remote_datasource_impl.dart';
import 'package:ark_module_regular/src/data/dto/blog_dto.dart';
import 'package:ark_module_regular/src/data/dto/course_dto.dart';
import 'package:ark_module_regular/src/data/repositories/ark_home_repository_impl.dart';
import 'package:ark_module_regular/src/domain/entities/blog_entity.dart';
import 'package:ark_module_regular/src/domain/entities/category_entity.dart';
import 'package:ark_module_regular/src/domain/entities/course_entity.dart';
import 'package:ark_module_regular/src/domain/entities/slider_entity.dart';
import 'package:ark_module_regular/src/domain/usecases/ark_home_usecase.dart';
import 'package:ark_module_setup/ark_module_setup.dart';
import 'package:carousel_slider/carousel_options.dart';
import 'package:get/get.dart';
import 'package:package_info/package_info.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ArkHomeController extends GetxController {
  final ArkHomeUseCase _useCase =
      ArkHomeUseCase(ArkHomeRepositoryImpl(ArkHomeRemoteDataSourceImpl()));

  final Rx<int> _indexSlider = 0.obs;
  Rx<int> get indexSlider => _indexSlider;

  final Rx<String> _version = "".obs;
  Rx<String> get version => _version;

  final Rx<CategoryEntity> _category = const CategoryEntity(
    status: false,
    data: [],
  ).obs;
  Rx<CategoryEntity> get category => _category;

  final Rx<SliderEntity> _sliderImage =
      SliderEntity(success: false, data: []).obs;
  Rx<SliderEntity> get sliderImage => _sliderImage;

  final Rx<CourseEntity> _courseJRC =
      const CourseEntity(success: false, data: []).obs;
  Rx<CourseEntity> get courseJRC => _courseJRC;

  final RxList<CourseParseEntity> _trendingCourse = <CourseParseEntity>[].obs;
  RxList<CourseParseEntity> get trendingCourse => _trendingCourse;

  final RxList<CourseParseEntity> _newestCourse = <CourseParseEntity>[].obs;
  RxList<CourseParseEntity> get newestCourse => _newestCourse;

  final RxList<CourseParseEntity> _businessCourse = <CourseParseEntity>[].obs;
  RxList<CourseParseEntity> get businessCourse => _businessCourse;

  final RxList<CourseParseEntity> _recomendationCourse =
      <CourseParseEntity>[].obs;
  RxList<CourseParseEntity> get recomendationCourse => _recomendationCourse;

  final RxList<CourseParseEntity> _pengembanganKarirCourse =
      <CourseParseEntity>[].obs;
  RxList<CourseParseEntity> get pengembanganKarirCourse =>
      _pengembanganKarirCourse;

  final RxList<BlogEntity> _blogs = <BlogEntity>[].obs;
  RxList<BlogEntity> get blogs => _blogs;

  final Rx<int> _selectedCategoryIndex = 0.obs;
  Rx<int> get selectedCategoryIndex => _selectedCategoryIndex;

  final Rx<bool> _isLoading = true.obs;
  Rx<bool> get isLoading => _isLoading;

  final Rx<bool> _isLoadingCategory = true.obs;
  Rx<bool> get isLoadingCategory => _isLoadingCategory;

  final Rx<bool> _isLoadingImageSlider = true.obs;
  Rx<bool> get isLoadingImageSlider => _isLoadingImageSlider;

  final Rx<bool> _isLoadingCourseJRC = true.obs;
  Rx<bool> get isLoadingCourseJRC => _isLoadingCourseJRC;

  final Rx<bool> _isLoadingTrendingCourse = true.obs;
  Rx<bool> get isLoadingTrendingCourse => _isLoadingTrendingCourse;

  final Rx<bool> _isLoadingNewestCourse = true.obs;
  Rx<bool> get isLoadingNewestCourse => _isLoadingNewestCourse;

  final Rx<bool> _isLoadingBusinessCourse = true.obs;
  Rx<bool> get isLoadingBusinessCourse => _isLoadingBusinessCourse;

  final Rx<bool> _isLoadingPengembanganKarirCourse = true.obs;
  Rx<bool> get isLoadingPengembanganKarirCourse =>
      _isLoadingPengembanganKarirCourse;

  final Rx<bool> _isLoadingRecomendationCourse = true.obs;
  Rx<bool> get isLoadingRecomendationCourse => _isLoadingRecomendationCourse;

  final Rx<bool> _isLoadingBlog = true.obs;
  Rx<bool> get isLoadingBlog => _isLoadingBlog;

  late SharedPreferences _prefs;

  @override
  void onInit() async {
    _prefs = await SharedPreferences.getInstance();
    _getVersion();
    _getCategory();
    _getImageSlider();
    _getCourseJRC();
    _getTrendingCourse();
    _getNewestCourse();
    _getBusinessCourse();
    _getPengembanganKarirCourse();
    _getRecomendationCourse();
    _getBlogs();
    await _changeLoading(false);
    super.onInit();
  }

  Future _changeLoading(bool val) async {
    _isLoading.value = val;
  }

  Future _changeLoadingCategory(bool val) async {
    _isLoadingCategory.value = val;
  }

  Future _changeLoadingImageSlider(bool val) async {
    _isLoadingImageSlider.value = val;
  }

  Future _changeLoadingCourseJRC(bool val) async {
    _isLoadingCourseJRC.value = val;
  }

  Future _changeLoadingTrendingCourse(bool val) async {
    _isLoadingTrendingCourse.value = val;
  }

  Future _changeLoadingNewestCourse(bool val) async {
    _isLoadingNewestCourse.value = val;
  }

  Future _changeLoadingPengembanganKarirCourse(bool val) async {
    log("CHECK WUY");
    _isLoadingPengembanganKarirCourse.value = val;
  }

  Future _changeLoadingRecomendationCourse(bool val) async {
    _isLoadingRecomendationCourse.value = val;
  }

  Future _changeLoadingBusinessCourse(bool val) async {
    _isLoadingBusinessCourse.value = val;
  }

  Future _changeLoadingBLog(bool val) async {
    _isLoadingBlog.value = val;
  }

  void _getVersion() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    _version.value = packageInfo.version;
  }

  void _getBlogs() async {
    _changeLoadingBLog(true);
    _setBlogsFromCache();
    final response = await _useCase.getBlogs(100);
    response.fold(
      ///IF RESPONSE IS ERROR
      (fail) => ExceptionHandle.execute(fail),

      ///IF RESPONSE SUCCESS
      (data) {
        _blogs.value = data;
        _setBlogsToCache("cache_home_blog", data);
      },
    );
    await _changeLoadingBLog(false);
  }

  void _setBlogsFromCache() async {
    final dataJson = _prefs.getString("cache_home_blog");
    if (dataJson != null) {
      final dataDecode = json.decode(dataJson);
      for (var data in dataDecode) {
        _blogs.add(BlogDTO.fromJson(data));
        await _changeLoadingBLog(false);
      }
    }
  }

  void _setCourseFromCache(List<CourseParseEntity> course, String dataCache,
      Future<void> changeLoading) async {
    final dataJson = _prefs.getString(dataCache);
    if (dataJson != null) {
      final dataDecode = json.decode(dataJson);
      for (var data in dataDecode) {
        course.add(CourseParseDTO.fromJson(data));
        await changeLoading;
      }
    }
  }

  void _setBlogsToCache(String cacheName, List<BlogEntity> blogs) async {
    await _prefs.setString(cacheName, blogEntityToJson(blogs));
  }

  void _setCourseToCache(
      String cacheName, List<CourseParseEntity> cacheCourse) async {
    await _prefs.setString(cacheName, courseParseEntityToJson(cacheCourse));
  }

  void _getRecomendationCourse() async {
    _changeLoadingRecomendationCourse(true);
    _setCourseFromCache(_recomendationCourse, "recomendation_classes",
        _changeLoadingRecomendationCourse(false));
    final response =
        await _useCase.getListIdCourseByKategori(listIdRecomendationCourseUrl);
    response.fold(
      ///IF RESPONSE IS ERROR
      (fail) => ExceptionHandle.execute(fail),

      ///IF RESPONSE SUCCESS
      (data) => _getRecomendationDataCourse(data),
    );
  }

  void _getPengembanganKarirCourse() async {
    _changeLoadingPengembanganKarirCourse(true);
    _setCourseFromCache(_pengembanganKarirCourse, "pengembangan_classes",
        _changeLoadingPengembanganKarirCourse(false));
    final response = await _useCase
        .getListIdCourseByKategori(listIdPengembanganKarirCourseUrl);
    response.fold(
      ///IF RESPONSE IS ERROR
      (fail) => ExceptionHandle.execute(fail),

      ///IF RESPONSE SUCCESS
      (data) => _getPengembanganKarirDataCourse(data),
    );
  }

  void _getBusinessCourse() async {
    _changeLoadingBusinessCourse(true);
    _setCourseFromCache(_businessCourse, "business_classes",
        _changeLoadingBusinessCourse(false));
    final response =
        await _useCase.getListIdCourseByKategori(listIdBusinessCourseUrl);
    response.fold(
      ///IF RESPONSE IS ERROR
      (fail) => ExceptionHandle.execute(fail),

      ///IF RESPONSE SUCCESS
      (data) => _getBusinessDataCourse(data),
    );
  }

  void _getNewestCourse() async {
    _changeLoadingNewestCourse(true);
    _setCourseFromCache(
        _newestCourse, "newest_classes", _changeLoadingNewestCourse(false));
    final response = await _useCase.getListIdNewestCourse();
    response.fold(
      ///IF RESPONSE IS ERROR
      (fail) => ExceptionHandle.execute(fail),

      ///IF RESPONSE SUCCESS
      (data) => _getNewestDataCourse(data),
    );
  }

  void _getTrendingCourse() async {
    _changeLoadingTrendingCourse(true);
    _setCourseFromCache(_trendingCourse, "trending_classes",
        _changeLoadingTrendingCourse(false));
    final response = await _useCase.getListIdTrendingCourse();
    response.fold(
      ///IF RESPONSE IS ERROR
      (fail) => ExceptionHandle.execute(fail),

      ///IF RESPONSE SUCCESS
      (data) => _getTrendingDataCourse(data),
    );
  }

  void _getRecomendationDataCourse(List<String> listId) async {
    final response = await _useCase.getCourseFromListId(listId);
    response.fold(

        ///IF RESPONSE IS ERROR
        (fail) => ExceptionHandle.execute(fail),

        ///IF RESPONSE SUCCESS
        (data) async {
      _recomendationCourse.value = data;
      _setCourseToCache("recomendation_classes", data);
    });
    await _changeLoadingRecomendationCourse(false);
  }

  void _getPengembanganKarirDataCourse(List<String> listId) async {
    final response = await _useCase.getCourseFromListId(listId);
    response.fold(

        ///IF RESPONSE IS ERROR
        (fail) => ExceptionHandle.execute(fail),

        ///IF RESPONSE SUCCESS
        (data) {
      _pengembanganKarirCourse.value = data;
      _setCourseToCache("pengembangan_classes", data);
    });
    await _changeLoadingPengembanganKarirCourse(false);
  }

  void _getBusinessDataCourse(List<String> listId) async {
    final response = await _useCase.getCourseFromListId(listId);
    response.fold(

        ///IF RESPONSE IS ERROR
        (fail) => ExceptionHandle.execute(fail),

        ///IF RESPONSE SUCCESS
        (data) {
      _businessCourse.value = data;
      _setCourseToCache("business_classes", data);
    });
    await _changeLoadingBusinessCourse(false);
  }

  void _getNewestDataCourse(List<String> listId) async {
    final response = await _useCase.getCourseFromListId(listId);
    response.fold(

        ///IF RESPONSE IS ERROR
        (fail) => ExceptionHandle.execute(fail),

        ///IF RESPONSE SUCCESS
        (data) {
      _newestCourse.value = data;
      _setCourseToCache("newest_classes", data);
    });
    await _changeLoadingNewestCourse(false);
  }

  void _getTrendingDataCourse(List<String> listId) async {
    final response = await _useCase.getCourseFromListId(listId);
    response.fold(

        ///IF RESPONSE IS ERROR
        (fail) => ExceptionHandle.execute(fail),

        ///IF RESPONSE SUCCESS
        (data) {
      _trendingCourse.value = data;
      _setCourseToCache("trending_classes", data);
    });
    await _changeLoadingTrendingCourse(false);
  }

  void onSliderChange(int i, CarouselPageChangedReason r) {
    _indexSlider.value = i;
  }

  void _getCourseJRC() async {
    _changeLoadingCourseJRC(true);

    final response = await _useCase.getCourseJRC();
    response.fold(

        ///IF RESPONSE IS ERROR
        (fail) => ExceptionHandle.execute(fail),

        ///IF RESPONSE SUCCESS
        (data) {
      _courseJRC.value = data;
    });
    await _changeLoadingCourseJRC(false);
  }

  void _getCategory() async {
    _changeLoadingCategory(true);
    final response = await _useCase.getCategory();
    response.fold(

        ///IF RESPONSE IS ERROR
        (fail) => ExceptionHandle.execute(fail),

        ///IF RESPONSE SUCCESS
        (data) {
      _category.value = data;
    });
    await _changeLoadingCategory(false);
  }

  void _getImageSlider() async {
    _changeLoadingImageSlider(true);
    final response = await _useCase.getImageSlider();
    response.fold(
      ///IF RESPONSE IS ERROR
      (fail) => ExceptionHandle.execute(fail),

      ///IF RESPONSE SUCCESS
      (data) {
        _sliderImage.value = data;
      },
    );
    await _changeLoadingImageSlider(false);
  }

  void onRefresh() {
    _getCategory();
    _getImageSlider();
    _getCourseJRC();
    _getTrendingCourse();
    _getNewestCourse();
    _getBusinessCourse();
    _getPengembanganKarirCourse();
    _getRecomendationCourse();
    _getBlogs();
  }
}
