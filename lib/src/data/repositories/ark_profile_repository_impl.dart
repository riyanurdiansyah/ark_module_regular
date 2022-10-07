import 'dart:developer';
import 'package:ark_module_regular/src/data/datasources/remote/ark_profile_remote_datasource.dart';
import 'package:ark_module_regular/src/domain/entities/city_entity.dart';
import 'package:ark_module_regular/src/domain/entities/coin_entity.dart';
import 'package:ark_module_regular/src/domain/entities/course_entity.dart';
import 'package:ark_module_regular/src/domain/entities/face_recog_entity.dart';
import 'package:ark_module_regular/src/domain/entities/profile_entity.dart';
import 'package:ark_module_regular/src/domain/entities/provinsi_entity.dart';
import 'package:ark_module_regular/src/domain/entities/sertifikat_entitiy.dart';
import 'package:ark_module_regular/src/domain/repositories/ark_profile_repository.dart';
import 'package:ark_module_setup/ark_module_setup.dart';
import 'package:dartz/dartz.dart';

class ArkProfileRepositoryImpl implements ArkProfileRepository {
  final ArkProfileRemoteDataSource dataSource;

  ArkProfileRepositoryImpl(this.dataSource);
  @override
  Future<Either<Failure, ProfileEntity>> getProfile(String token) async {
    try {
      final profile = await dataSource.getProfile(token);
      return Right(profile);
    } catch (e) {
      log("ERROR PROFILE REPO : ${e.toString()}");
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

  @override
  Future<Either<Failure, List<CourseEntity>>> getCourse(String token) async {
    try {
      final course = await dataSource.getCourse(token);
      return Right(course);
    } catch (e) {
      log("ERROR PROFILE REPO : ${e.toString()}");
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

  @override
  Stream<CoinEntity> getCoin(String userId) {
    return dataSource.getCoin(userId).map((event) => event);
  }

  @override
  Future<Either<Failure, FaceRecogEntity>> getFaceRecog(String token) async {
    try {
      final facerecog = await dataSource.getFaceRecog(token);
      return Right(facerecog);
    } catch (e) {
      log("ERROR FACE RECOG : ${e.toString()}");
      if (e is CustomException) {
        return Left(HttpFailure(e.code, e.message));
      } else {
        return const Left(
          HttpFailure(
            500,
            'Get Face Recog \nFailed connect to server \nPlease check your connection',
          ),
        );
      }
    }
  }

  @override
  Future<Either<Failure, SertifikatEntity>> getAllCertificate(
      String userId) async {
    try {
      final promo = await dataSource.getAllCertificate(userId);
      return Right(promo);
    } catch (e) {
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

  @override
  Future<Either<Failure, bool>> resetPassword(
      String email, String token) async {
    try {
      final reset = await dataSource.resetPassword(email, token);
      return Right(reset);
    } catch (e) {
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

  @override
  Future<Either<Failure, ProvinsiEntity>> getProvinsi() async {
    try {
      final provinsi = await dataSource.getProvinsi();
      return Right(provinsi);
    } catch (e) {
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

  @override
  Future<Either<Failure, CityEntity>> getCity(int id) async {
    try {
      final city = await dataSource.getCity(id);
      return Right(city);
    } catch (e) {
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

  @override
  Future<Either<Failure, bool>> updateProfile(
      ProfileDataEntity profile, String token) async {
    try {
      final update = await dataSource.updateProfile(profile, token);
      return Right(update);
    } catch (e) {
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

  @override
  Future<Either<Failure, bool>> updateCoin(
      String id, Map<String, dynamic> data) async {
    try {
      final update = await dataSource.updateCoin(id, data);
      return Right(update);
    } catch (e) {
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

  @override
  Future<Either<Failure, bool>> updateProfilePrakerja(
      String token, Map<String, Map<String, Object>> data) async {
    try {
      final update = await dataSource.updateProfilePrakerja(token, data);
      return Right(update);
    } catch (e) {
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
