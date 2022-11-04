import 'package:ark_module_regular/ark_module_regular.dart';
import 'package:ark_module_regular/src/domain/entities/course_entity.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ArkCategoryController extends GetxController {
  final ArkCategoryUseCase _useCase = ArkCategoryUseCase(
      ArkCategoryRepositoryImpl(ArkCategoryRemoteDataSourceImpl()));

  final ArkHomeUseCase _useCaseHome =
      ArkHomeUseCase(ArkHomeRepositoryImpl(ArkHomeRemoteDataSourceImpl()));

  final RxList<CategoryDataEntity> _categories = <CategoryDataEntity>[].obs;
  RxList<CategoryDataEntity> get categories => _categories;

  final Rx<int> _selectedCategory = 0.obs;
  Rx<int> get selectedCategory => _selectedCategory;

  final Rx<int> _startIndexList = 0.obs;
  Rx<int> get startIndexList => _startIndexList;

  final Rx<int> _endIndexList = 8.obs;
  Rx<int> get endIndexList => _endIndexList;

  final Rx<bool> _isLoading = true.obs;
  Rx<bool> get isLoading => _isLoading;

  final Rx<bool> _isLoadingCourses = true.obs;
  Rx<bool> get isLoadingCourses => _isLoadingCourses;

  final Rx<bool> _isLoadingCategory = true.obs;
  Rx<bool> get isLoadingCategory => _isLoadingCategory;

  final RxList<CourseParseEntity> _courses = <CourseParseEntity>[].obs;
  RxList<CourseParseEntity> get courses => _courses;

  final RxList<String> _listIdCourse = <String>[].obs;
  RxList<String> get listIdCourse => _listIdCourse;

  final ScrollController _controllerList = ScrollController();
  ScrollController get controllerList => _controllerList;

  @override
  void onInit() async {
    await _setup();
    await _changeLoading(false);
    super.onInit();
  }

  Future _changeLoading(bool val) async {
    _isLoading.value = val;
  }

  Future _changeLoadingCourses(bool val) async {
    _isLoadingCourses.value = val;
  }

  Future _changeLoadingCategory(bool val) async {
    _isLoadingCategory.value = val;
  }

  Future _setup() async {
    ///ADD DATA FROM BEFORE PAGE
    if (Get.arguments != null) {
      if (Get.arguments is List) {
        _categories.value = Get.arguments[0];
        _selectedCategory.value = Get.arguments[1];
        _changeLoadingCategory(false);
      }

      if (Get.arguments is int) {
        await _getCategory();
        _getListIdCourse(Get.arguments);
        _selectedCategory.value =
            _categories.indexWhere((e) => e.id == Get.arguments);
      }
    }

    if (Get.arguments == null) {
      await _getCategory();
      _getListIdCourseNewest();
    }
    _controllerList.addListener(_scrollListener);
    _getListIdCourse(_categories[_selectedCategory.value].id);
  }

  Future _getCategory() async {
    _changeLoadingCategory(true);
    final response = await _useCaseHome.getCategory();
    response.fold(

        ///IF RESPONSE IS ERROR
        (fail) => ExceptionHandle.execute(fail),

        ///IF RESPONSE SUCCESS
        (data) {
      _categories.value = data.data;
    });
    await _changeLoadingCategory(false);
  }

  void _scrollListener() {
    if (_controllerList.position.pixels ==
        _controllerList.position.maxScrollExtent) {}
  }

  void changeSelectedCategory(int i, int categoryId) {
    _selectedCategory.value = i;
    _getListIdCourse(categoryId);
  }

  Future _getListIdCourse(int categoryId) async {
    _changeLoadingCourses(true);
    final response = await _useCase.getListIdCourse(categoryId);

    response.fold(
      ///IF RESPONSE IS ERROR
      (fail) => ExceptionHandle.execute(fail),

      ///IF RESPONSE SUCCESS
      (data) => _getCoursesByListId(data),
    );
  }

  Future _getListIdCourseNewest() async {
    _changeLoadingCourses(true);
    final response = await _useCase.getListIdCourseNewest();

    response.fold(
      ///IF RESPONSE IS ERROR
      (fail) => ExceptionHandle.execute(fail),

      ///IF RESPONSE SUCCESS
      (data) => _getCoursesByListId(data),
    );
  }

  void _getCoursesByListId(List<String> listId) async {
    final response = await _useCaseHome.getCourseFromListId(listId);
    response.fold(

        ///IF RESPONSE IS ERROR
        (fail) => ExceptionHandle.execute(fail),

        ///IF RESPONSE SUCCESS
        (data) async {
      _courses.value = data;

      await _changeLoadingCourses(false);
    });
  }
}
