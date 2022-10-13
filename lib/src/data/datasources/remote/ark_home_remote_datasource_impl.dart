import 'dart:developer';

import 'package:ark_module_regular/src/data/dto/category_dto.dart';
import 'package:ark_module_regular/src/data/dto/slider_dto.dart';
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
}
