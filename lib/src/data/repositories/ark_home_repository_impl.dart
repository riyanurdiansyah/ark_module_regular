import 'dart:developer';

import 'package:ark_module_regular/src/data/datasources/remote/ark_home_remote_datasource.dart';
import 'package:ark_module_regular/src/domain/entities/category_entity.dart';
import 'package:ark_module_regular/src/domain/repositories/ark_home_repository.dart';
import 'package:ark_module_setup/ark_module_setup.dart';
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
      log("ERROR HOME REPO : ${e.toString()}");
      return ExceptionHandleResponse.execute(e);
    }
  }
}
