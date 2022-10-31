import 'package:ark_module_setup/ark_module_setup.dart';
import 'package:dartz/dartz.dart';

abstract class ArkMyClassRepository {
  Future<Either<Failure, List<MyCourseEntity>>> getMyCourse(String token);
}
