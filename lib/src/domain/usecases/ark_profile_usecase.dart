import 'package:ark_module_regular/src/domain/repositories/ark_profile_repository.dart';
import 'package:ark_module_setup/ark_module_setup.dart';
import 'package:dartz/dartz.dart';

class ArkProfileUseCase {
  final ArkProfileRepository repository;

  ArkProfileUseCase(this.repository);

  Stream<CoinEntity> getCoin(String userId) => repository.getCoin(userId);

  Future<Either<Failure, ProfileEntity>> getProfile(String token) async =>
      await repository.getProfile(token);

  Future<Either<Failure, FaceRecogEntity>> getFaceRecog(String token) async =>
      await repository.getFaceRecog(token);

  Future<Either<Failure, SertifikatEntity>> getAllCertificate(
          String userId) async =>
      await repository.getAllCertificate(userId);

  Future<Either<Failure, bool>> resetPassword(
          String email, String token) async =>
      await repository.resetPassword(email, token);

  Future<Either<Failure, ProvinsiEntity>> getProvinsi() async =>
      await repository.getProvinsi();

  Future<Either<Failure, CityEntity>> getCity(int id) async =>
      await repository.getCity(id);

  Future<Either<Failure, bool>> updateProfile(
          ProfileDataEntity profile, String token) async =>
      await repository.updateProfile(profile, token);

  Future<Either<Failure, bool>> updateCoin(
          String id, Map<String, dynamic> data) async =>
      await repository.updateCoin(id, data);

  Future<Either<Failure, bool>> updateProfilePrakerja(
          String id, Map<String, Map<String, Object>> data) async =>
      await repository.updateProfilePrakerja(id, data);
}
