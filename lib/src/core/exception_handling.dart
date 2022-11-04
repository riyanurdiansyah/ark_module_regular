import 'dart:developer';
import 'package:ark_module_regular/src/core/exception.dart';
import 'package:ark_module_regular/src/core/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:fluttertoast/fluttertoast.dart';

/*
  Handle error 
  Bisa digunakan untuk memberi 
  pesan ke user jika request nya gagal
*/
class ExceptionHandle {
  static execute(Failure fail) {
    if (fail is HttpFailure) {
      log("Error ${fail.code}x :  ${fail.message}");
      if (kDebugMode) {
        Fluttertoast.showToast(msg: "Error ${fail.code}x : ${fail.message}");
      }
    } else {
      log("Error: Failed connect to server Please check your connection");
      if (kDebugMode) {
        Fluttertoast.showToast(
            msg: "Failed connect to server \n Please check your connection");
      }
    }
  }
}

/*
  Handle error 
  Digunakan pada repository
  jika terjadi error pada proses try catch
*/
class ExceptionHandleResponse {
  static execute(Object e) {
    if (e is CustomException) {
      return Left(HttpFailure(e.code, e.message));
    } else {
      return const Left(
        HttpFailure(
          500,
          'Error... failed connect to server \nPlease check your connection',
        ),
      );
    }
  }
}

/*
  Handle error 
  Digunakan pada file datasource
  jika terjadi error pada proses hit API
*/
class ExceptionHandleResponseAPI {
  static execute(int code, Response<dynamic> response, String? errorMsg) {
    if (code >= 500) {
      throw CustomException(
          code, errorMsg ?? 'Error... failed connect to server');
    } else if (code != 200) {
      throw CustomException(
        code,
        response.data['message'] ??
            errorMsg ??
            'Failed connect... Please try again',
      );
    }
  }
}
