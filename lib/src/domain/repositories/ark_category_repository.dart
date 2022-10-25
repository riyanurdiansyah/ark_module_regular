import 'package:ark_module_setup/ark_module_setup.dart';
import 'package:dartz/dartz.dart';

abstract class ArkCategoryRepository {
  Future<Either<Failure, List<String>>> getListIdCourse(int categoryId);

  Future<Either<Failure, List<String>>> getListIdCourseNewest();
}
