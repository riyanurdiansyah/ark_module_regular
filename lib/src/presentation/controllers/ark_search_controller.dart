import 'dart:convert';
import 'package:ark_module_regular/ark_module_regular.dart';
import 'package:ark_module_regular/src/data/dto/course_dto.dart';
import 'package:ark_module_regular/src/domain/entities/course_entity.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ark_module_regular/utils/app_url.dart';

class ArkSearchController extends GetxController {
  late ArkHomeUseCase _useCase;
  late ArkHomeRepositoryImpl _repository;
  late ArkHomeRemoteDataSourceImpl _dataSource;

  final RxList<CategoryDataEntity> _categories = <CategoryDataEntity>[].obs;
  RxList<CategoryDataEntity> get categories => _categories;

  final RxList<CourseParseEntity> _recomendations = <CourseParseEntity>[].obs;
  RxList<CourseParseEntity> get recomendations => _recomendations;

  final RxList<CourseParseEntity> _listNameSearch = <CourseParseEntity>[].obs;
  RxList<CourseParseEntity> get listNameSearch => _listNameSearch;

  final RxList<CourseParseEntity> _listNameSearchResult =
      <CourseParseEntity>[].obs;
  RxList<CourseParseEntity> get listNameSearchResult => _listNameSearchResult;

  final RxList<String> _histories = <String>[].obs;
  RxList<String> get histories => _histories;

  final TextEditingController _tcSearch = TextEditingController();
  TextEditingController get txSearch => _tcSearch;

  final ScrollController _scrollController = ScrollController();
  ScrollController get scollController => _scrollController;

  late SharedPreferences _prefs;

  final Rx<bool> _isHaveQuery = false.obs;
  Rx<bool> get isHaveQuery => _isHaveQuery;

  final Rx<bool> _isSearched = false.obs;
  Rx<bool> get isSearched => _isSearched;

  @override
  void onInit() async {
    await _setup();
    super.onInit();
  }

  @override
  void onClose() {
    _tcSearch.dispose();
    _scrollController.dispose();
    super.onClose();
  }

  Future _setup() async {
    _dataSource = ArkHomeRemoteDataSourceImpl();
    _repository = ArkHomeRepositoryImpl(_dataSource);
    _useCase = ArkHomeUseCase(_repository);

    _scrollController.addListener(_scrollListener);
    _prefs = await SharedPreferences.getInstance();

    ///ADDED LIST FROM BEFORE PAGE
    ///IF BEFORE PAGE SEND DATA
    if (Get.arguments != null) {
      _categories.value = Get.arguments[0] ?? [];
      _recomendations.value = Get.arguments[1] ?? [];
      _listNameSearch.value = Get.arguments[1] ?? [];
    }

    ///ADDED LIST FROM BEFORE PAGE
    ///IF BEFORE PAGE NOT SEND DATA
    if (Get.arguments == null) {
      _getCategory();
      _getCourse();
    }

    ///ADDED LIST HISTORY
    _histories.value = _prefs.getStringList('history') ?? [];
  }

  void _getCourse() async {
    _setCourseFromCache();
    final response =
        await _useCase.getListIdCourseByKategori(listIdRecomendationCourseUrl);
    response.fold(
      ///IF RESPONSE IS ERROR
      (fail) => ExceptionHandle.execute(fail),

      ///IF RESPONSE SUCCESS
      (data) => _getRecomendationDataCourse(data),
    );
  }

  void _setCourseFromCache() {
    final dataJson = _prefs.getString("recomendation_classes");
    if (dataJson != null) {
      final dataDecode = json.decode(dataJson);
      for (var data in dataDecode) {
        _recomendations.add(CourseParseDTO.fromJson(data));
        _listNameSearch.add(CourseParseDTO.fromJson(data));
      }
    }
  }

  void _getRecomendationDataCourse(List<String> listId) async {
    final response = await _useCase.getCourseFromListId(listId);
    response.fold(

        ///IF RESPONSE IS ERROR
        (fail) => ExceptionHandle.execute(fail),

        ///IF RESPONSE SUCCESS
        (data) {
      _recomendations.value = data;
      _listNameSearch.value = data;
    });
  }

  void _getCategory() async {
    final response = await _useCase.getCategory();
    response.fold(

        ///IF RESPONSE IS ERROR
        (fail) => ExceptionHandle.execute(fail),

        ///IF RESPONSE SUCCESS
        (data) {
      _categories.value = data.data;
    });
  }

  void _scrollListener() {
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      // if (_dC.stopSearch.value == false) {
      //   //logic nambahin 8 kelas baru dari ListOfIds.
      //   if (_dC.listOfIds.length > _dC.endIntSearch.value + 8) {
      //     _dC.startIntSearch.value = _dC.endIntSearch.value;
      //     _dC.endIntSearch.value = _dC.endIntSearch.value + 8;
      //     _dC.search(_dC.savedStringForSearch.value, _dC.startIntSearch.value,
      //         _dC.endIntSearch.value);
      //   }
      //   //logic nambahin kelas mendekati abis.
      //   else {
      //     _dC.startIntSearch.value = _dC.endIntSearch.value;
      //     _dC.endIntSearch.value = _dC.listOfIds.length;
      //     _dC.search(_dC.savedStringForSearch.value, _dC.startIntSearch.value,
      //         _dC.endIntSearch.value);
      //     _dC.stopSearch.value = true;
      //   }
      // } else {
      //   AppPrint.debugPrint('gak search sama sekali');
      // }

      // AppPrint.debugPrint('reach end of page');
    }
  }

  void onChangeSeacrh(String query) {
    if (query.isNotEmpty) {
      _isHaveQuery.value = true;
    } else {
      _isHaveQuery.value = false;
    }

    for (var e in _listNameSearch) {
      if (e.course.name.toLowerCase().contains(txSearch.text.toLowerCase())) {
        _listNameSearchResult.add(e);
      }
    }
    _listNameSearch.value = _listNameSearchResult
        .where((e) =>
            e.course.name.toLowerCase().contains(txSearch.text.toLowerCase()))
        .toSet()
        .toList();
  }

  void clearSearchText() {
    _isHaveQuery.value = false;
    _isSearched.value = false;
    _tcSearch.clear();
  }

  void onTapNameSearch(CourseDataEntity course) async {
    _isSearched.value = true;
    _tcSearch.text = course.name;
    onChangeSeacrh(course.name);
    _histories.insert(0, _tcSearch.text);
    if (_histories.length > 4) {
      _histories.removeLast();
    }
    await _prefs.setStringList('history', _histories);
  }

  void onSearchComplete() async {
    _isSearched.value = true;
    _histories.insert(0, _tcSearch.text);
    if (_histories.length > 4) {
      _histories.removeLast();
    }
    await _prefs.setStringList('history', _histories);
  }

  void onRemoveLatestSearched(int i) async {
    _histories.removeAt(i);
    await _prefs.setStringList('history', _histories);
  }

  void onTapLatestSearched(String query) {
    _tcSearch.text = query;
    _isSearched.value = true;
    onChangeSeacrh(query);
  }
}
