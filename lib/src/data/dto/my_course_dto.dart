import 'dart:convert';

import 'package:ark_module_regular/src/data/dto/instructor_my_course_dto.dart';
import 'package:ark_module_regular/src/domain/entities/my_course_entity.dart';

List<MyCourseDTO> myCourseEntityFromJson(String str) => List<MyCourseDTO>.from(
    json.decode(str).map((x) => MyCourseDTO.fromJson(x)));

class MyCourseDTO extends MyCourseEntity {
  const MyCourseDTO({
    required super.id,
    required super.name,
    required super.courseSlug,
    required super.dateCreated,
    required super.userProgress,
    required super.userStatus,
    required super.userExpiry,
    required super.startDate,
    required super.featuredImage,
    required super.instructor,
    required super.menuOrder,
    required super.sesiKonsultasi,
  });

  factory MyCourseDTO.fromJson(Map<String, dynamic> json) => MyCourseDTO(
        id: json["id"],
        name: json["name"],
        courseSlug: json["course_slug"] ?? "",
        dateCreated: json["date_created"] ?? 0,
        userProgress: json["user_progress"] ?? "0",
        userStatus: json["user_status"],
        userExpiry: json["user_expiry"] == null || json["user_expiry"] == ""
            ? "0"
            : json["user_expiry"],
        startDate: json["start_date"],
        featuredImage: json["featured_image"],
        instructor: InstructorMyCourseDTO.fromJson(json["instructor"]),
        menuOrder: json["menu_order"],
        sesiKonsultasi: json["sesi_konsultasi"],
      );
}
