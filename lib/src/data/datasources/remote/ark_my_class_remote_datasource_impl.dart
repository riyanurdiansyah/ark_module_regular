import 'package:ark_module_regular/src/data/datasources/remote/ark_my_class_remote_datasource.dart';
import 'package:ark_module_regular/src/data/dto/my_course_dto.dart';
import 'package:ark_module_setup/ark_module_setup.dart';
import 'package:dio/dio.dart';

class ArkMyClassRemoteDataSourceImpl implements ArkMyClassRemoteDataSource {
  late Dio dio;
  ArkMyClassRemoteDataSourceImpl({Dio? dio}) {
    this.dio = dio ?? Dio();
  }

  @override
  Future<List<MyCourseDTO>> getMyCourse(String token) async {
    final response = await dio.get(
      myCourseUrl,
      options: Options(
        headers: {
          "Authorization": token,
        },
      ),
    );
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
      'Failed Get My Course... Please try again',
    );
  }
}
