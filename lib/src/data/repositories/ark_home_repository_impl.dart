import 'dart:developer';

import 'package:ark_module_regular/src/data/datasources/remote/ark_home_remote_datasource.dart';
import 'package:ark_module_regular/src/domain/entities/category_entity.dart';
import 'package:ark_module_regular/src/domain/entities/course_entity.dart';
import 'package:ark_module_regular/src/domain/entities/slider_entity.dart';
import 'package:ark_module_regular/src/domain/repositories/ark_home_repository.dart';
import 'package:ark_module_setup/ark_module_setup.dart';
import 'package:dartz/dartz.dart';

class ArkHomeRepositoryImpl implements ArkHomeRepository {
  final ArkHomeRemoteDataSource dataSource;

  ArkHomeRepositoryImpl(this.dataSource);
  @override
  Future<Either<Failure, CategoryEntity>> getCategory() async {
    try {
      final category = await dataSource.getCategory();
      return Right(category);
    } catch (e) {
      log("ERROR HOME REPO GET CATEGORY: ${e.toString()}");
      return ExceptionHandleResponse.execute(e);
    }
  }

  @override
  Future<Either<Failure, SliderEntity>> getImageSlider() async {
    try {
      final slider = await dataSource.getImageSlider();
      return Right(slider);
    } catch (e) {
      log("ERROR HOME REPO GET IMAGE SLIDER: ${e.toString()}");
      return ExceptionHandleResponse.execute(e);
    }
  }

  @override
  Future<Either<Failure, CourseEntity>> getCourseJRC() async {
    try {
      final courseJRC = await dataSource.getCourseJRC();
      return Right(courseJRC);
    } catch (e) {
      log("ERROR HOME REPO GET COURSE JRC: ${e.toString()}");
      return ExceptionHandleResponse.execute(e);
    }
  }
}
