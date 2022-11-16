import 'dart:developer';
import 'package:ark_module_regular/src/core/exception_handling.dart';
import 'package:ark_module_regular/src/core/failures.dart';
import 'package:ark_module_regular/src/data/datasources/remote/ark_wishlist_remote_datasource.dart';
import 'package:ark_module_regular/src/domain/repositories/ark_wishlist_repository.dart';
import 'package:dartz/dartz.dart';

class ArkWishlistRepositoryImpl implements ArkWishlistRepository {
  final ArkWishlistRemoteDataSource dataSource;

  ArkWishlistRepositoryImpl(this.dataSource);
  @override
  Future<Either<Failure, List<String>>> getAllWishlist(String token) async {
    try {
      final wishlist = await dataSource.getAllWishlist(token);
      return Right(wishlist);
    } catch (e) {
      log("ERROR WISHLIST REPO GET WISHLIST: ${e.toString()}");
      return ExceptionHandleResponse.execute(e);
    }
  }

  @override
  Future<Either<Failure, bool>> deleteWishlist(
      int courseId, String token) async {
    try {
      final wishlist = await dataSource.deleteWishlist(courseId, token);
      return Right(wishlist);
    } catch (e) {
      log("ERROR WISHLIST REPO DELETE WISHLIST : ${e.toString()}");
      return ExceptionHandleResponse.execute(e);
    }
  }
}
