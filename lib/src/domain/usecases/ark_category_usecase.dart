import 'package:ark_module_regular/src/domain/repositories/ark_category_repository.dart';
import 'package:ark_module_setup/ark_module_setup.dart';
import 'package:dartz/dartz.dart';

class ArkCategoryUseCase {
  final ArkCategoryRepository repository;

  ArkCategoryUseCase(this.repository);

  Future<Either<Failure, List<String>>> getListIdCourse(int categoryId) async =>
      await repository.getListIdCourse(categoryId);

  Future<Either<Failure, List<String>>> getListIdCourseNewest() async =>
      await repository.getListIdCourseNewest();
}
