import 'package:ark_module_regular/src/data/dto/course_jrc_dto.dart';

abstract class ArkCourseRemoteDataSource {
  Future<CourseJrcDTO> getDetailCourseJRC(String slug);
}
