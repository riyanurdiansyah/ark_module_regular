import 'package:ark_module_regular/src/data/datasources/remote/ark_category_remote_datasource.dart';
import 'package:ark_module_setup/ark_module_setup.dart';
import 'package:dio/dio.dart';

class ArkCategoryRemoteDataSourceImpl implements ArkCategoryRemoteDataSource {
  late Dio dio;
  ArkCategoryRemoteDataSourceImpl({Dio? dio}) {
    this.dio = dio ?? Dio();
  }

  @override
  Future<List<String>> getListIdCourse(int categoryId) async {
    List<String> listId = [];
    final response = await dio.get(
        "$lisIdCategoryCourseUrl/$categoryId/coursesids?urutan=siswa-terbanyak");
    int code = response.statusCode ?? 500;
    if (code == 200) {
      for (var data in response.data["data"]) {
        listId.add(data["ID"].toString());
      }

      return listId;
    }
    return ExceptionHandleResponseAPI.execute(
      code,
      response,
      'Error Get List Id Trending Course... failed connect to server',
    );
  }

  @override
  Future<List<String>> getListIdCourseNewest() async {
    List<String> listId = [];
    final response = await dio.get(listIdNewestCourseUrl);
    int code = response.statusCode ?? 500;
    if (code == 200) {
      for (var data in response.data["data"]) {
        listId.add(data.toString());
      }
      return listId;
    }
    return ExceptionHandleResponseAPI.execute(
      code,
      response,
      'Error Get List Id Trending Course... failed connect to server',
    );
  }
}
