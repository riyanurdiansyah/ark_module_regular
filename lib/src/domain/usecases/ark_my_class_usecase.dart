import 'package:ark_module_regular/src/domain/repositories/ark_my_class_repository.dart';
import 'package:ark_module_setup/ark_module_setup.dart';
import 'package:dartz/dartz.dart';

class ArkMyClassUseCase {
  final ArkMyClassRepository repository;

  ArkMyClassUseCase(this.repository);

  Future<Either<Failure, List<MyCourseEntity>>> getMyCourse(
          String token) async =>
      await repository.getMyCourse(token);
}
