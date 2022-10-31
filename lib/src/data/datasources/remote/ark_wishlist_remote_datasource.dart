abstract class ArkWishlistRemoteDataSource {
  Future<List<String>> getAllWishlist(String token);

  Future<bool> deleteWishlist(int courseId, String token);
}
