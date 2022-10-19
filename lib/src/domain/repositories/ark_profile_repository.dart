import 'package:ark_module_setup/ark_module_setup.dart';
import 'package:dartz/dartz.dart';

abstract class ArkProfileRepository {
  Future<Either<Failure, ProfileEntity>> getProfile(String token);

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

  Future<Either<Failure, CourseJrcEntity>> getCoba(String id, String token);
}
