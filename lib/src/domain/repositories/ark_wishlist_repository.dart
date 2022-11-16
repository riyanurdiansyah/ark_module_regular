import 'package:ark_module_regular/src/core/failures.dart';
import 'package:dartz/dartz.dart';

abstract class ArkWishlistRepository {
  Future<Either<Failure, List<String>>> getAllWishlist(String token);

  Future<Either<Failure, bool>> deleteWishlist(int courseId, String token);
}
