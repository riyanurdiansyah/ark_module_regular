import 'dart:developer';

import 'package:ark_module_regular/src/core/exception_handling.dart';
import 'package:ark_module_regular/src/core/failures.dart';
import 'package:ark_module_regular/src/data/datasources/remote/ark_category_remote_datasource.dart';
import 'package:ark_module_regular/src/domain/repositories/ark_category_repository.dart';
import 'package:dartz/dartz.dart';

class ArkCategoryRepositoryImpl implements ArkCategoryRepository {
  final ArkCategoryRemoteDataSource dataSource;

  ArkCategoryRepositoryImpl(this.dataSource);

  @override
  Future<Either<Failure, List<String>>> getListIdCourse(int categoryId) async {
    try {
      final course = await dataSource.getListIdCourse(categoryId);
      return Right(course);
    } catch (e) {
      log("ERROR CATEGORY REPO GET LIST ID COURSE: ${e.toString()}");
      return ExceptionHandleResponse.execute(e);
    }
  }

  @override
  Future<Either<Failure, List<String>>> getListIdCourseNewest() async {
    try {
      final course = await dataSource.getListIdCourseNewest();
      return Right(course);
    } catch (e) {
      log("ERROR CATEGORY REPO GET LIST ID COURSE: ${e.toString()}");
      return ExceptionHandleResponse.execute(e);
    }
  }
}
