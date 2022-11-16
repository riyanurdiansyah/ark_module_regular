import 'package:ark_module_regular/ark_module_regular.dart';
import 'package:ark_module_regular/src/domain/entities/course_entity.dart';
import 'package:dartz/dartz.dart';

abstract class ArkHomeRepository {
  Future<Either<Failure, CategoryEntity>> getCategory();

  Future<Either<Failure, SliderEntity>> getImageSlider();

  Future<Either<Failure, CourseEntity>> getCourseJRC();

  Future<Either<Failure, List<String>>> getListIdTrendingCourse();

  Future<Either<Failure, List<CourseParseEntity>>> getCourseFromListId(
      List<String> listId);

  Future<Either<Failure, List<String>>> getListIdNewestCourse();

  Future<Either<Failure, List<String>>> getListIdCourseByKategori(
      String urlKategori);

  Future<Either<Failure, List<BlogEntity>>> getBlogs(int page);

  Future<Either<Failure, bool>> postGameBase(String email, String cardbase);
}
