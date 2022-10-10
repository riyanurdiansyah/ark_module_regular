import 'dart:developer';

import 'package:ark_module_regular/src/data/datasources/remote/ark_my_class_remote_datasource.dart';
import 'package:ark_module_regular/src/domain/entities/my_course_entity.dart';
import 'package:ark_module_regular/src/domain/repositories/ark_my_class_repository.dart';
import 'package:ark_module_setup/ark_module_setup.dart';
import 'package:dartz/dartz.dart';

class ArkMyClassRepositoryImpl implements ArkMyClassRepository {
  final ArkMyClassRemoteDataSource dataSource;

  ArkMyClassRepositoryImpl(this.dataSource);
  @override
  Future<Either<Failure, List<MyCourseEntity>>> getMyCourse(
      String token) async {
    try {
      final profile = await dataSource.getMyCourse(token);
      return Right(profile);
    } catch (e) {
      log("ERROR MY CLASS REPO : ${e.toString()}");
      if (e is CustomException) {
        return Left(HttpFailure(e.code, e.message));
      } else {
        return const Left(
          HttpFailure(
            500,
            'Error... failed connect to server \nPlease check your connection',
          ),
        );
      }
    }
  }
}
