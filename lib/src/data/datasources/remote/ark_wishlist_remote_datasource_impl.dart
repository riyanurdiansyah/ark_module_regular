import 'package:ark_module_regular/src/data/datasources/remote/ark_wishlist_remote_datasource.dart';
import 'package:ark_module_setup/ark_module_setup.dart';
import 'package:dio/dio.dart';

class ArkWishlistRemoteDataSourceImpl implements ArkWishlistRemoteDataSource {
  late Dio dio;
  ArkWishlistRemoteDataSourceImpl({Dio? dio}) {
    this.dio = dio ?? Dio();
  }

  @override
  Future<List<String>> getAllWishlist(String token) async {
    await dioInterceptor(dio, token);
    final response = await dio.get(wishlistUrl);
    int code = response.statusCode ?? 500;
    if (code >= 500) {
      throw CustomException(code, 'Error... failed connect to server');
    } else if (code != 200) {
      throw CustomException(
          code, response.data['message'] ?? 'Failed... Please try again');
    } else {
      List<String> listId = [];
      for (var data in response.data["data"]) {
        listId.add(data["course_id"]);
      }
      return listId;
    }
  }

  @override
  Future<bool> deleteWishlist(int courseId, String token) async {
    await dioInterceptor(dio, token);
    final response = await dio.delete("$courseUrl/$courseId/removeFavorites");
    int code = response.statusCode ?? 500;
    if (code >= 500) {
      throw CustomException(code, 'Error... failed connect to server');
    } else if (code != 200) {
      throw CustomException(
          code, response.data['message'] ?? 'Failed... Please try again');
    } else {
      return response.data['success'];
    }
  }
}
