import 'package:ark_module_regular/ark_module_regular.dart';
import 'package:dartz/dartz.dart';

abstract class ArkProfileRepository {
  Future<Either<Failure, ProfileEntity>> getProfile(String token);

  Stream<CoinEntity> getCoin(String userId);

  // Future<Either<Failure, FaceRecogEntity>> getFaceRecog(String token);

  Future<Either<Failure, bool>> resetPassword(String email, String token);

  Future<Either<Failure, List<MyCourseEntity>>> getMyCourse(String token);
}
