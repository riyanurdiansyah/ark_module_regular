import 'package:ark_module_regular/src/domain/entities/city_entity.dart';
import 'package:ark_module_regular/src/domain/entities/coin_entity.dart';
import 'package:ark_module_regular/src/domain/entities/course_entity.dart';
import 'package:ark_module_regular/src/domain/entities/face_recog_entity.dart';
import 'package:ark_module_regular/src/domain/entities/profile_entity.dart';
import 'package:ark_module_regular/src/domain/entities/provinsi_entity.dart';
import 'package:ark_module_regular/src/domain/entities/sertifikat_entitiy.dart';
import 'package:ark_module_setup/ark_module_setup.dart';
import 'package:dartz/dartz.dart';

abstract class ArkProfileRepository {
  Future<Either<Failure, ProfileEntity>> getProfile(String token);

  Future<Either<Failure, List<CourseEntity>>> getCourse(String token);

  Stream<CoinEntity> getCoin(String userId);

  Future<Either<Failure, FaceRecogEntity>> getFaceRecog(String token);

  Future<Either<Failure, SertifikatEntity>> getAllCertificate(String userId);

  Future<Either<Failure, bool>> resetPassword(String email, String token);

  Future<Either<Failure, ProvinsiEntity>> getProvinsi();

  Future<Either<Failure, CityEntity>> getCity(int id);

  Future<Either<Failure, bool>> updateProfile(
      ProfileDataEntity profile, String token);

  Future<Either<Failure, bool>> updateCoin(
      String id, Map<String, dynamic> data);

  Future<Either<Failure, bool>> updateProfilePrakerja(
      String token, Map<String, Map<String, Object>> data);
}
