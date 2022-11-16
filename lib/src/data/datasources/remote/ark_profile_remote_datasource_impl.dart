import 'package:ark_module_regular/ark_module_regular.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:ark_module_regular/utils/app_url.dart';

class ArkProfileRemoteDataSourceImpl implements ArkProfileRemoteDataSource {
  late Dio dio;
  ArkProfileRemoteDataSourceImpl({Dio? dio}) {
    this.dio = dio ?? Dio();
  }

  @override
  Future<ProfileDTO> getProfile(String token) async {
    await dioInterceptor(dio, token);
    final response = await dio.get(profileUrl);
    int code = response.statusCode ?? 500;
    if (code >= 500) {
      throw CustomException(code, 'Error... failed connect to server');
    } else if (code != 200) {
      throw CustomException(
          code, response.data['message'] ?? 'Failed... Please try again');
    } else {
      return ProfileDTO.fromJson(response.data);
    }
  }

  @override
  Stream<CoinDTO> getCoin(String userId) {
    Stream<DocumentSnapshot<Map<String, dynamic>>> stream =
        FirebaseFirestore.instance.collection("coins").doc(userId).snapshots();
    return stream.map(
      (event) {
        if (event.data() != null) {
          if (event.exists) {
            return CoinDTO.fromJson(event.data()!);
          } else {
            return CoinDTO(
              coins: 0,
              isCompleted: false,
              createdAt: Timestamp.now(),
              updatedAt: Timestamp.now(),
              isOldUser: false,
            );
          }
        } else {
          return CoinDTO(
            coins: 0,
            isCompleted: false,
            createdAt: Timestamp.now(),
            updatedAt: Timestamp.now(),
            isOldUser: false,
          );
        }
      },
    );
  }

  // @override
  // Future<FaceRecogDTO> getFaceRecog(String token) async {
  //   await dioInterceptor(dio, token);
  //   final response = await dio.get(faceRecogUrl);
  //   int code = response.statusCode ?? 500;
  //   if (code == 200) {
  //     return FaceRecogDTO.fromJson(response.data);
  //   }
  //   return ExceptionHandleResponseAPI.execute(
  //     code,
  //     response,
  //     'Error Get Face Recog... failed connect to server',
  //   );
  // }

  @override
  Future<bool> resetPassword(String email, String token) async {
    await dioInterceptor(dio, token);
    final response = await dio.post(resetPasswordUrl, data: {
      "email": email,
    });
    int code = response.statusCode ?? 500;
    if (code == 200) {
      return response.data['success'];
    }
    return ExceptionHandleResponseAPI.execute(
      code,
      response,
      'Error Reset Password... failed connect to server',
    );
  }

  @override
  Future<List<MyCourseDTO>> getMyCourse(String token) async {
    List<MyCourseDTO> listCourse = [];
    await dioInterceptor(dio, token);
    final response = await dio.get(myCourseUrl);
    int code = response.statusCode ?? 500;
    if (code == 200) {
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
