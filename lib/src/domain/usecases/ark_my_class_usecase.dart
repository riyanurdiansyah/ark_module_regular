import 'package:ark_module_regular/src/core/failures.dart';
import 'package:ark_module_regular/src/domain/entities/my_course_entity.dart';
import 'package:ark_module_regular/src/domain/repositories/ark_my_class_repository.dart';
import 'package:dartz/dartz.dart';

class ArkMyClassUseCase {
  final ArkMyClassRepository repository;

  ArkMyClassUseCase(this.repository);

  Future<Either<Failure, List<MyCourseEntity>>> getMyCourse(
          String token) async =>
      await repository.getMyCourse(token);
}
