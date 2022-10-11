import 'dart:developer';

import 'package:ark_module_regular/src/data/datasources/remote/ark_my_class_remote_datasource.dart';
import 'package:ark_module_regular/src/domain/entities/my_course_entity.dart';
import 'package:ark_module_regular/src/domain/repositories/ark_my_class_repository.dart';
import 'package:ark_module_setup/ark_module_setup.dart';
import 'package:dartz/dartz.dart';

class ArkMyClassRepositoryImpl implements ArkMyClassRepository {
  final ArkMyClassRemoteDataSource dataSource;

  ArkMyClassRepositoryImpl(this.dataSource);
  @override
  Future<Either<Failure, List<MyCourseEntity>>> getMyCourse(
      String token) async {
    try {
      final course = await dataSource.getMyCourse(token);
      return Right(course);
    } catch (e) {
      log("ERROR MY CLASS REPO : ${e.toString()}");
      return ExceptionHandleResponse.execute(e);
    }
  }
}
