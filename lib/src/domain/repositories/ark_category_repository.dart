import 'package:ark_module_regular/src/core/failures.dart';
import 'package:dartz/dartz.dart';

abstract class ArkCategoryRepository {
  Future<Either<Failure, List<String>>> getListIdCourse(int categoryId);

  Future<Either<Failure, List<String>>> getListIdCourseNewest();
}
