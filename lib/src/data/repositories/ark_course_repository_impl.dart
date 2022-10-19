import 'dart:developer';
import 'package:ark_module_regular/src/data/datasources/remote/ark_course_remote_datasource.dart';
import 'package:ark_module_regular/src/domain/repositories/ark_course_repository.dart';
import 'package:ark_module_setup/ark_module_setup.dart';
import 'package:dartz/dartz.dart';

class ArkCourseRepositoryImpl implements ArkCourseRepository {
  final ArkCourseRemoteDataSource dataSource;

  ArkCourseRepositoryImpl(this.dataSource);

  @override
  Future<Either<Failure, CourseJrcEntity>> getDetailCourseJRC(
      String slug) async {
    try {
      final course = await dataSource.getDetailCourseJRC(slug);
      return Right(course);
    } catch (e) {
      log("ERROR HOME REPO GET CATEGORY: ${e.toString()}");
      return ExceptionHandleResponse.execute(e);
    }
  }
}
