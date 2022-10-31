import 'package:ark_module_regular/src/domain/repositories/ark_home_repository.dart';
import 'package:ark_module_setup/ark_module_setup.dart';
import 'package:dartz/dartz.dart';

class ArkHomeUseCase {
  final ArkHomeRepository repository;

  ArkHomeUseCase(this.repository);

  Future<Either<Failure, CategoryEntity>> getCategory() async =>
      await repository.getCategory();

  Future<Either<Failure, SliderEntity>> getImageSlider() async =>
      await repository.getImageSlider();

  Future<Either<Failure, CourseEntity>> getCourseJRC() async =>
      await repository.getCourseJRC();

  Future<Either<Failure, List<String>>> getListIdTrendingCourse() async =>
      await repository.getListIdTrendingCourse();

  Future<Either<Failure, List<CourseParseEntity>>> getCourseFromListId(
          List<String> listId) async =>
      await repository.getCourseFromListId(listId);

  Future<Either<Failure, List<String>>> getListIdNewestCourse() async =>
      await repository.getListIdNewestCourse();

  Future<Either<Failure, List<String>>> getListIdCourseByKategori(
          String urlKategori) async =>
      await repository.getListIdCourseByKategori(urlKategori);

  Future<Either<Failure, List<BlogEntity>>> getBlogs(int page) async =>
      await repository.getBlogs(page);

  Future<Either<Failure, bool>> postGameBase(
          String email, String cardbase) async =>
      await repository.postGameBase(email, cardbase);
}
