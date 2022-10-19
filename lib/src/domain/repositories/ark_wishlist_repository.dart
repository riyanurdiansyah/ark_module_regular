import 'package:ark_module_setup/ark_module_setup.dart';
import 'package:dartz/dartz.dart';

abstract class ArkWishlistRepository {
  Future<Either<Failure, List<String>>> getAllWishlist(String token);

  Future<Either<Failure, bool>> deleteWishlist(int courseId, String token);
}
