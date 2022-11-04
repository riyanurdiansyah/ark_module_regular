import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'app_color.dart';

class AppStyleTextfield {
  static customOutlined(
    String hint,
    Widget? prefixIcon,
    Widget? suffixIcon,
  ) {
    return InputDecoration(
      hintText: hint,
      border: OutlineInputBorder(
        borderSide: const BorderSide(width: 0.6, color: Color(0xFFC0C2C6)),
        borderRadius: BorderRadius.circular(6),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(width: 0.6, color: Color(0xFFC0C2C6)),
        borderRadius: BorderRadius.circular(6),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(width: 0.6, color: Color(0xFFC0C2C6)),
        borderRadius: BorderRadius.circular(6),
      ),
      contentPadding: const EdgeInsets.only(top: 6, left: 14),
      hintStyle: const TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 11,
        color: Color(0xFFACAEB2),
      ),
      prefixIcon: prefixIcon,
      suffixIcon: suffixIcon,
    );
  }

  static authForm(String labelText, String hintText, double fontSize) {
    return InputDecoration(
      hintText: hintText,
      contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 12),
      labelText: labelText,
      labelStyle: TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: fontSize,
      ),
      focusedErrorBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.red,
          ),
          borderRadius: BorderRadius.circular(5)),
      errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.red,
          ),
          borderRadius: BorderRadius.circular(5)),
      focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: kPrimaryColor),
          borderRadius: BorderRadius.circular(5)),
      enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.black38,
          ),
          borderRadius: BorderRadius.circular(5)),
    );
  }

  static authTextfieldDecoration({
    String? labelText,
    String? hintText,
    double? fontSize,
  }) {
    return InputDecoration(
      hintText: hintText,
      contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 12),
      labelText: labelText,
      labelStyle: TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: fontSize,
      ),
      focusedErrorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.red),
          borderRadius: BorderRadius.circular(5)),
      errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.red),
          borderRadius: BorderRadius.circular(5)),
      focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            width: 2,
            color: kPrimaryColor,
          ),
          borderRadius: BorderRadius.circular(5)),
      enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(
          color: Colors.black38,
        ),
        borderRadius: BorderRadius.circular(5),
      ),
    );
  }

  static searchBarDecoration() {
    return InputDecoration(
      filled: true,
      fillColor: const Color.fromRGBO(241, 242, 244, 1),
      border: OutlineInputBorder(
        borderSide: const BorderSide(width: 0.2, color: kNewBlack5a),
        borderRadius: BorderRadius.circular(5),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(width: 0.2, color: kNewBlack5a),
        borderRadius: BorderRadius.circular(5),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(width: 0.2, color: kNewBlack5a),
        borderRadius: BorderRadius.circular(5),
      ),
      contentPadding: EdgeInsets.only(
          top: Get.size.shortestSide < 600 ? 5 : 20,
          bottom: Get.size.shortestSide < 600 ? 5 : 20,
          left: 20,
          right: 10),
      hintText: "Cari kelas",
      hintStyle: TextStyle(
          color: kNewBlack2b, fontSize: Get.size.shortestSide < 600 ? 14 : 25),
      prefixIcon: IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: () => Get.back(),
        color: kPrimaryColor,
        iconSize: Get.size.shortestSide < 600 ? 24 : 30,
      ),
    );
  }
}
