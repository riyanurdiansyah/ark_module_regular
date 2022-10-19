import 'package:ark_module_regular/src/data/datasources/remote/ark_course_remote_datasource.dart';
import 'package:ark_module_setup/ark_module_setup.dart';
import 'package:dio/dio.dart';

class ArkCourseRemoteDataSourceImpl implements ArkCourseRemoteDataSource {
  late Dio dio;
  ArkCourseRemoteDataSourceImpl({Dio? dio}) {
    this.dio = dio ?? Dio();
  }

  @override
  Future<CourseJrcDTO> getDetailCourseJRC(String slug) async {
    final response = await dio.get("$courseUrl/$slug/jrc");
    int code = response.statusCode ?? 500;
    if (code == 200) {
      return CourseJrcDTO.fromJson(response.data);
    }
    return ExceptionHandleResponseAPI.execute(
      code,
      response,
      'Error Get Detail Course JRC... failed connect to server',
      'Failed Get Detail Course JRC... Please try again',
    );
  }
}
