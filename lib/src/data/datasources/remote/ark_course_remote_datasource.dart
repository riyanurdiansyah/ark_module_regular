import 'package:ark_module_setup/ark_module_setup.dart';

abstract class ArkCourseRemoteDataSource {
  Future<CourseJrcDTO> getDetailCourseJRC(String slug);
}
