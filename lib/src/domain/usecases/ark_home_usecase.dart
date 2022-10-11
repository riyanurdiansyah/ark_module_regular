import 'package:ark_module_regular/src/domain/entities/category_entity.dart';
import 'package:ark_module_regular/src/domain/repositories/ark_home_repository.dart';
import 'package:ark_module_setup/ark_module_setup.dart';
import 'package:dartz/dartz.dart';

class ArkHomeUseCase {
  final ArkHomeRepository repository;

  ArkHomeUseCase(this.repository);

  Future<Either<Failure, CategoryEntity>> getCategory() async =>
      await repository.getCategory();
}
