import 'package:ark_module_setup/ark_module_setup.dart';

abstract class ArkMyClassRemoteDataSource {
  Future<List<MyCourseDTO>> getMyCourse(String token);
}
