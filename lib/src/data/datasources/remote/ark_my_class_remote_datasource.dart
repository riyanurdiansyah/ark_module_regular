import 'package:ark_module_regular/src/data/dto/my_course_dto.dart';

abstract class ArkMyClassRemoteDataSource {
  Future<List<MyCourseDTO>> getMyCourse(String token);
}
