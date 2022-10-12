import 'package:ark_module_regular/src/domain/entities/course_entity.dart';

class CourseDTO extends CourseEntity {
  const CourseDTO({
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

  factory CourseDTO.fromJson(Map<String, dynamic> json) => CourseDTO(
        id: json["id"],
        name: json["name"],
        courseSlug: json["course_slug"] ?? "",
        dateCreated: json["date_created"] ?? 0,
        userProgress: json["user_progress"] ?? '0',
        userStatus: json["user_status"],
        userExpiry: json["user_expiry"],
        startDate: json["start_date"],
        featuredImage: json["featured_image"],
        instructor: InstructorDTO.fromJson(json["instructor"]),
        menuOrder: json["menu_order"],
        sesiKonsultasi: json["sesi_konsultasi"],
      );
}

class InstructorDTO extends InstructorEntity {
  const InstructorDTO({
    required super.id,
    required super.name,
    required super.avatar,
    required super.sub,
  });

  factory InstructorDTO.fromJson(Map<String, dynamic> json) => InstructorDTO(
        id: json["id"],
        name: json["name"],
        avatar: json["avatar"],
        sub: json["sub"],
      );
}
