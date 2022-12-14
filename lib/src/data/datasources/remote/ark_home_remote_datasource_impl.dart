import 'package:ark_module_regular/ark_module_regular.dart';
import 'package:ark_module_regular/src/data/dto/course_dto.dart';
import 'package:ark_module_regular/utils/app_url.dart';
import 'package:dio/dio.dart';

class ArkHomeRemoteDataSourceImpl implements ArkHomeRemoteDataSource {
  late Dio dio;
  ArkHomeRemoteDataSourceImpl({Dio? dio}) {
    this.dio = dio ?? Dio();
  }

  @override
  Future<CategoryDTO> getCategory() async {
    final response = await dio.get(categoryUrl);
    int code = response.statusCode ?? 500;
    if (code == 200) {
      return CategoryDTO.fromJson(response.data);
    }
    return ExceptionHandleResponseAPI.execute(
      code,
      response,
      'Error Get Category... failed connect to server',
    );
  }

  @override
  Future<SliderDTO> getImageSlider() async {
    final response = await dio.get(imageSliderUrl);
    int code = response.statusCode ?? 500;
    if (code == 200) {
      return SliderDTO.fromJson(response.data);
    }
    return ExceptionHandleResponseAPI.execute(
      code,
      response,
      'Error Get Image Slider... failed connect to server',
    );
  }

  @override
  Future<CourseDTO> getCourseJRC() async {
    final response = await dio.get(listCourseJRC);
    int code = response.statusCode ?? 500;
    if (code == 200) {
      return CourseDTO.fromJson(response.data);
    }
    return ExceptionHandleResponseAPI.execute(
      code,
      response,
      'Error Get Course JRC... failed connect to server',
    );
  }

  @override
  Future<List<String>> getListIdTrendingCourse() async {
    final response = await dio.get(listIdTrendingCourseUrl);
    int code = response.statusCode ?? 500;
    if (code == 200) {
      List<String> listId = [];
      for (var data in response.data["data"]) {
        listId.add(data);
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
  Future<List<CourseParseDTO>> getCourseFromListId(List<String> listId) async {
    final List<CourseParseDTO> listCourse = [];
    for (int i = 0; i < listId.length; i++) {
      final response = await dio.get("$courseUrl/${listId[i]}");
      int code = response.statusCode ?? 500;
      if (code == 200) {
        for (var data in response.data['data']) {
          listCourse.add(CourseParseDTO.fromJson(data));
        }
      }
    }
    return listCourse;
  }

  @override
  Future<List<String>> getListIdNewestCourse() async {
    final response = await dio.get(listIdNewestCourseUrl);
    int code = response.statusCode ?? 500;
    if (code == 200) {
      List<String> listId = [];
      for (var data in response.data["data"]) {
        listId.add(data.toString());
      }

      return listId;
    }
    return ExceptionHandleResponseAPI.execute(
      code,
      response,
      'Error Get List Id Newest Course... failed connect to server',
    );
  }

  @override
  Future<List<String>> getListIdCourseByKategori(String urlKategori) async {
    final response = await dio.get(urlKategori);
    int code = response.statusCode ?? 500;
    if (code == 200) {
      List<String> listId = [];
      for (var data in response.data["data"]) {
        ///response data id yg lowercase
        if (data["ID"] == null) {
          listId.add(data["id"].toString());
        }

        ///response data id yg uppercase
        if (data["id"] == null) {
          listId.add(data["ID"].toString());
        }
      }

      return listId;
    }
    return ExceptionHandleResponseAPI.execute(
      code,
      response,
      'Error Get List Id Newest Course... failed connect to server',
    );
  }

  @override
  Future<List<BlogDTO>> getBlogs(int page) async {
    final List<BlogDTO> blogs = [];
    final response = await dio.get("$blogUrl=$page");
    int code = response.statusCode ?? 500;
    if (code == 200) {
      for (var data in response.data) {
        blogs.add(BlogDTO.fromJson(data));
      }
    }

    return blogs;
  }

  @override
  Future<bool> postGameBase(String email, String cardbase) async {
    final response = await dio.post(
      gamebaseUrl,
      queryParameters: {
        "cardbase": "gamee",
        "email": email,
      },
    );
    if (response.data['status'] == "success") {
      return true;
    }
    return false;
  }
}
