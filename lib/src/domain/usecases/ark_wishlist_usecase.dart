import 'package:ark_module_regular/src/core/failures.dart';
import 'package:ark_module_regular/src/domain/repositories/ark_wishlist_repository.dart';
import 'package:dartz/dartz.dart';

class ArkWishlistUseCase {
  final ArkWishlistRepository repository;

  ArkWishlistUseCase(this.repository);

  Future<Either<Failure, List<String>>> getAllWishlist(String token) async =>
      await repository.getAllWishlist(token);

  Future<Either<Failure, bool>> deleteWishlist(
          int courseId, String token) async =>
      await repository.deleteWishlist(courseId, token);
}
