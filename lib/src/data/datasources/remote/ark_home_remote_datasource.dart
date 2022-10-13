import 'package:ark_module_regular/src/data/dto/category_dto.dart';
import 'package:ark_module_regular/src/data/dto/course_dto.dart';
import 'package:ark_module_regular/src/data/dto/slider_dto.dart';

abstract class ArkHomeRemoteDataSource {
  Future<CategoryDTO> getCategory();

  Future<SliderDTO> getImageSlider();

  Future<CourseDTO> getCourseJRC();
}
