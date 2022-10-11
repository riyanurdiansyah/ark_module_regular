import 'dart:developer';
import 'package:ark_module_regular/src/data/dto/city_dto.dart';
import 'package:ark_module_regular/src/data/dto/coin_dto.dart';
import 'package:ark_module_regular/src/data/dto/course_dto.dart';
import 'package:ark_module_regular/src/data/dto/face_recog_dto.dart';
import 'package:ark_module_regular/src/data/dto/profile_dto.dart';
import 'package:ark_module_regular/src/data/dto/provinsi_dto.dart';
import 'package:ark_module_regular/src/data/dto/sertifikat_dto.dart';
import 'package:ark_module_regular/src/domain/entities/profile_entity.dart';
import 'package:ark_module_setup/ark_module_setup.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';

import 'ark_profile_remote_datasource.dart';

class ArkProfileRemoteDataSourceImpl implements ArkProfileRemoteDataSource {
  late Dio dio;
  ArkProfileRemoteDataSourceImpl({Dio? dio}) {
    this.dio = dio ?? Dio();
  }
  @override
  Future<ProfileDTO> getProfile(String token) async {
    final response = await dio.get(
      profileUrl,
      options: Options(
        headers: {
          "Authorization": token,
        },
      ),
    );
    log("RESPONSE GET PROFILE : ${response.data}");
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
  Future<List<CourseDTO>> getCourse(String token) async {
    final response = await dio.get(
      myCourseUrl,
      options: Options(
        headers: {
          "Authorization": token,
        },
      ),
    );
    int code = response.statusCode ?? 500;
    if (code >= 500) {
      throw CustomException(code, 'Error... failed connect to server');
    } else if (code != 200) {
      throw CustomException(
          code, response.data['message'] ?? 'Failed... Please try again');
    } else {
      List<CourseDTO> listCourse = [];
      for (var data in response.data) {
        listCourse.add(CourseDTO.fromJson(data));
      }
      return listCourse;
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

  @override
  Future<FaceRecogDTO> getFaceRecog(String token) async {
    final response = await dio.get(
      faceRecogUrl,
      options: Options(
        headers: {
          "Authorization": token,
        },
      ),
    );
    int code = response.statusCode ?? 500;
    if (code == 200) {
      return FaceRecogDTO.fromJson(response.data);
    }
    return ExceptionHandleResponseAPI.execute(
      code,
      response,
      'Error Get Face Recog... failed connect to server',
      'Failed Get Face Recog... Please try again',
    );
  }

  @override
  Future<SertifikatDTO> getAllCertificate(String userId) async {
    // final response = await dio.get("$sertifUrl/$userId");
    final response = await dio.get(
        "http://apimember.arkademi.com/api/arkademi/get_user_certificate/291976");
    log("RESPONSE GET ALL CERTIFICATE : ${response.data}");
    int code = response.statusCode ?? 500;
    if (code == 200) {
      return SertifikatDTO.fromJson(response.data);
    }

    return ExceptionHandleResponseAPI.execute(
      code,
      response,
      'Error Get All Certificate... failed connect to server',
      'Failed Get All Certificate... Please try again',
    );
  }

  @override
  Future<bool> resetPassword(String email, String token) async {
    final response = await dio.post(
      resetPasswordUrl,
      data: {
        "email": email,
      },
      options: Options(headers: {
        'Authorization': token,
      }),
    );
    log("RESPONSE RESET PASSWORD : ${response.data}");
    int code = response.statusCode ?? 500;
    if (code == 200) {
      return response.data['success'];
    }
    return ExceptionHandleResponseAPI.execute(
      code,
      response,
      'Error Reset Password... failed connect to server',
      'Failed Reset Password... Please try again',
    );
  }

  @override
  Future<ProvinsiDTO> getProvinsi() async {
    final response = await dio.get(provinsiUrl);
    log("RESPONSE GET PROVINSI : ${response.data}");
    int code = response.statusCode ?? 500;
    if (code == 200) {
      return ProvinsiDTO.fromJson(response.data);
    }
    return ExceptionHandleResponseAPI.execute(
      code,
      response,
      'Error Get Provinsi... failed connect to server',
      'Failed Get Provinsi... Please try again',
    );
  }

  @override
  Future<CityDTO> getCity(int id) async {
    final response = await dio.get("$cityUrl=$id");
    log("RESPONSE GET CITY : ${response.data}");
    int code = response.statusCode ?? 500;
    if (code == 200) {
      return CityDTO.fromJson(response.data);
    }
    return ExceptionHandleResponseAPI.execute(
      code,
      response,
      'Error Get Provinsi... failed connect to server',
      'Failed Get Provinsi... Please try again',
    );
  }

  @override
  Future<bool> updateCoin(String id, Map<String, dynamic> data) async {
    return await FirebaseFirestore.instance
        .collection("coins")
        .doc(id)
        .update(data)
        .whenComplete(() => true)
        .then((value) => true)
        .catchError((error) => throw CustomException(500, error.toString()));
  }

  @override
  Future<bool> updateProfile(ProfileDataEntity profile, String token) async {
    final response = await dio.put(
      updateProfileUrl,
      data: profile.toJson(),
      options: Options(headers: {
        'Authorization': token,
      }),
    );
    log("RESPONSE UPDATE PROFILE : ${response.data}");
    int code = response.statusCode ?? 500;
    if (code == 200) {
      return response.data['success'];
    }
    return ExceptionHandleResponseAPI.execute(
      code,
      response,
      'Error Update Profile... failed connect to server',
      'Failed Update Profile... Please try again',
    );
  }

  @override
  Future<bool> updateProfilePrakerja(
      String token, Map<String, Map<String, Object>> data) async {
    final response = await dio.post(
      updateProfileUrl,
      data: data,
      options: Options(headers: {
        'Authorization': token,
      }),
    );
    log("RESPONSE UPDATE PROFILE PRAKERJA: ${response.data}");
    int code = response.statusCode ?? 500;
    if (code == 200) {
      return true;
    }
    return ExceptionHandleResponseAPI.execute(
      code,
      response,
      'Error Update Profile Prakerja... failed connect to server',
      'Failed Update Profile Prakerja... Please try again',
    );
  }
}
