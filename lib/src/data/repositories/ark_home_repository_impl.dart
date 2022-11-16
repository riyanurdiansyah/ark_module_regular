import 'dart:developer';
import 'package:ark_module_regular/ark_module_regular.dart';
import 'package:ark_module_regular/src/domain/entities/course_entity.dart';
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

  @override
  Future<Either<Failure, List<String>>> getListIdTrendingCourse() async {
    try {
      final listId = await dataSource.getListIdTrendingCourse();
      return Right(listId);
    } catch (e) {
      log("ERROR HOME REPO GET LIST ID TRENDING COURSE: ${e.toString()}");
      return ExceptionHandleResponse.execute(e);
    }
  }

  @override
  Future<Either<Failure, List<CourseParseEntity>>> getCourseFromListId(
      List<String> listId) async {
    try {
      final course = await dataSource.getCourseFromListId(listId);
      return Right(course);
    } catch (e) {
      log("ERROR HOME REPO GET COURSE FROM LIST: ${e.toString()}");
      return ExceptionHandleResponse.execute(e);
    }
  }

  @override
  Future<Either<Failure, List<String>>> getListIdNewestCourse() async {
    try {
      final listId = await dataSource.getListIdNewestCourse();
      return Right(listId);
    } catch (e) {
      log("ERROR HOME REPO GET LIST ID NEWEST COURSE: ${e.toString()}");
      return ExceptionHandleResponse.execute(e);
    }
  }

  @override
  Future<Either<Failure, List<String>>> getListIdCourseByKategori(
      String urlKategori) async {
    try {
      final listId = await dataSource.getListIdCourseByKategori(urlKategori);
      return Right(listId);
    } catch (e) {
      log("ERROR HOME REPO GET LIST ID COURSE BY KATEGORI: ${e.toString()}");
      return ExceptionHandleResponse.execute(e);
    }
  }

  @override
  Future<Either<Failure, List<BlogEntity>>> getBlogs(int page) async {
    try {
      final blogs = await dataSource.getBlogs(page);
      return Right(blogs);
    } catch (e) {
      log("ERROR HOME REPO GET BLOGS: ${e.toString()}");
      return ExceptionHandleResponse.execute(e);
    }
  }

  @override
  Future<Either<Failure, bool>> postGameBase(
      String email, String cardbase) async {
    try {
      final gamee = await dataSource.postGameBase(email, cardbase);
      return Right(gamee);
    } catch (e) {
      log("ERROR HOME REPO POST GAMEE: ${e.toString()}");
      return ExceptionHandleResponse.execute(e);
    }
  }
}
