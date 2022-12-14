import 'package:ark_module_regular/ark_module_regular.dart';
import 'package:dio/dio.dart';
import 'package:ark_module_regular/utils/app_url.dart';

class ArkMyClassRemoteDataSourceImpl implements ArkMyClassRemoteDataSource {
  late Dio dio;
  ArkMyClassRemoteDataSourceImpl({Dio? dio}) {
    this.dio = dio ?? Dio();
  }

  @override
  Future<List<MyCourseDTO>> getMyCourse(String token) async {
    await dioInterceptor(dio, token);
    final response = await dio.get(myCourseUrl);
    int code = response.statusCode ?? 500;
    if (code == 200) {
      List<MyCourseDTO> listCourse = [];
      for (var data in response.data) {
        listCourse.add(MyCourseDTO.fromJson(data));
      }
      return listCourse;
    }
    return ExceptionHandleResponseAPI.execute(
      code,
      response,
      'Error Get My Course... failed connect to server',
    );
  }
}
