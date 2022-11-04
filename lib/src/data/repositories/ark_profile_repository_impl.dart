import 'dart:developer';
import 'package:ark_module_regular/ark_module_regular.dart';
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
      return ExceptionHandleResponse.execute(e);
    }
  }

  @override
  Stream<CoinEntity> getCoin(String userId) {
    return dataSource.getCoin(userId).map((event) => event);
  }

  // @override
  // Future<Either<Failure, FaceRecogEntity>> getFaceRecog(String token) async {
  //   try {
  //     final facerecog = await dataSource.getFaceRecog(token);
  //     return Right(facerecog);
  //   } catch (e) {
  //     log("ERROR FACE RECOG : ${e.toString()}");
  //     if (e is CustomException) {
  //       return Left(HttpFailure(e.code, e.message));
  //     } else {
  //       return const Left(
  //         HttpFailure(
  //           500,
  //           'Get Face Recog \nFailed connect to server \nPlease check your connection',
  //         ),
  //       );
  //     }
  //   }
  // }

  @override
  Future<Either<Failure, bool>> resetPassword(
      String email, String token) async {
    try {
      final reset = await dataSource.resetPassword(email, token);
      return Right(reset);
    } catch (e) {
      return ExceptionHandleResponse.execute(e);
    }
  }

  @override
  Future<Either<Failure, List<MyCourseEntity>>> getMyCourse(
      String token) async {
    try {
      final course = await dataSource.getMyCourse(token);
      return Right(course);
    } catch (e) {
      log("ERROR MY CLASS REPO : ${e.toString()}");
      return ExceptionHandleResponse.execute(e);
    }
  }
}
