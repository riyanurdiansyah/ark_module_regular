import 'package:ark_module_regular/src/domain/repositories/ark_course_repository.dart';
import 'package:ark_module_setup/ark_module_setup.dart';
import 'package:dartz/dartz.dart';

class ArkCourseUseCase {
  final ArkCourseRepository repository;

  ArkCourseUseCase(this.repository);

  ///GET DETAIL COURSE JRC BY SLUG
  Future<Either<Failure, CourseJrcEntity>> getDetailCourseJRC(
          String slug) async =>
      await repository.getDetailCourseJRC(slug);
}
