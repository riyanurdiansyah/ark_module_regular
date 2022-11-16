// import 'package:ark_module_regular/ark_module_regular.dart';
// import 'package:dartz/dartz.dart';

// class ArkProfileUseCase {
//   final ArkProfileRepository repository;

//   ArkProfileUseCase(this.repository);

//   Stream<CoinEntity> getCoin(String userId) => repository.getCoin(userId);

//   Future<Either<Failure, ProfileEntity>> getProfile(String token) async =>
//       await repository.getProfile(token);

//   // Future<Either<Failure, FaceRecogEntity>> getFaceRecog(String token) async =>
//   //     await repository.getFaceRecog(token);

//   Future<Either<Failure, bool>> resetPassword(
//           String email, String token) async =>
//       await repository.resetPassword(email, token);

//   Future<Either<Failure, List<MyCourseEntity>>> getMyCourse(
//           String token) async =>
//       await repository.getMyCourse(token);
// }
