import 'package:ark_module_setup/ark_module_setup.dart';
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
