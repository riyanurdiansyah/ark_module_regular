import 'dart:developer';

import 'package:ark_module_regular/src/data/dto/category_dto.dart';
import 'package:ark_module_regular/src/data/dto/course_dto.dart';
import 'package:ark_module_regular/src/data/dto/slider_dto.dart';
import 'package:ark_module_regular/src/domain/entities/course_entity.dart';
import 'package:ark_module_setup/ark_module_setup.dart';
import 'package:dio/dio.dart';

import 'ark_home_remote_datasource.dart';

class ArkHomeRemoteDataSourceImpl implements ArkHomeRemoteDataSource {
  late Dio dio;
  ArkHomeRemoteDataSourceImpl({Dio? dio}) {
    this.dio = dio ?? Dio();
  }

  @override
  Future<CategoryDTO> getCategory() async {
    final response = await dio.get(categoryUrl);
    log("RESPONSE GET CATEGORY : ${response.data}");
    int code = response.statusCode ?? 500;
    if (code == 200) {
      return CategoryDTO.fromJson(response.data);
    }
    return ExceptionHandleResponseAPI.execute(
      code,
      response,
      'Error Get Category... failed connect to server',
      'Failed Get Category... Please try again',
    );
  }

  @override
  Future<SliderDTO> getImageSlider() async {
    final response = await dio.get(imageSliderUrl);
    log("RESPONSE GET IMAGE SLIDER : ${response.data}");
    int code = response.statusCode ?? 500;
    if (code == 200) {
      return SliderDTO.fromJson(response.data);
    }
    return ExceptionHandleResponseAPI.execute(
      code,
      response,
      'Error Get Image Slider... failed connect to server',
      'Failed Get Image Slider... Please try again',
    );
  }

  @override
  Future<CourseDTO> getCourseJRC() async {
    final response = await dio.get(listCourseJRC);
    log("RESPONSE GET COURSE JRC : ${response.data}");
    int code = response.statusCode ?? 500;
    if (code == 200) {
      return CourseDTO.fromJson(response.data);
    }
    return ExceptionHandleResponseAPI.execute(
      code,
      response,
      'Error Get Course JRC... failed connect to server',
      'Failed Get Course JRC... Please try again',
    );
  }

  @override
  Future<List<String>> getListIdTrendingCourse() async {
    final response = await dio.get(listIdTrendingCourseUrl);
    log("RESPONSE GET LIST ID TRENDING COURSE : ${response.data}");
    int code = response.statusCode ?? 500;
    if (code == 200) {
      List<String> listId = [];
      for (var data in response.data["data"]) {
        listId.add(data);
      }

      return listId;
    }
    return ExceptionHandleResponseAPI.execute(
      code,
      response,
      'Error Get List Id Trending Course... failed connect to server',
      'Failed Get List Id Trending Course... Please try again',
    );
  }

  @override
  Future<List<CourseParseEntity>> getTrendingCourse(List<String> listId) async {
    final List<CourseParseEntity> listCourse = [];
    for (int i = 0; i < listId.length; i++) {
      log("ITUNG $i");
      final response = await dio.get("$trendingCourseUrl/${listId[i]}");
      log("RESPONSE GET TRENDING COURSE : ${response.data}");
      int code = response.statusCode ?? 500;
      if (code == 200) {
        for (var data in response.data['data']) {
          listCourse.add(CourseParseDTO.fromJson(data));
        }

        log("RESPONSE TRENDING $i: ${response.data}");
        log("RESPONSE TRENDING COURSE $i: ${response.data['data'][0]['course']}");
      }
    }
    log("RESPONSE CHECK COURSE : $listCourse");
    return listCourse;
  }
}
