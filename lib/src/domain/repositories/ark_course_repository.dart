import 'package:ark_module_regular/src/domain/entities/course_jrc_entity.dart';
import 'package:ark_module_setup/ark_module_setup.dart';
import 'package:dartz/dartz.dart';

abstract class ArkCourseRepository {
  Future<Either<Failure, CourseJrcEntity>> getDetailCourseJRC(String slug);
}
