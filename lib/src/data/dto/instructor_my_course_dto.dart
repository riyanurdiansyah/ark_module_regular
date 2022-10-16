import 'package:ark_module_regular/src/domain/entities/instructor_my_course_entity.dart';

class InstructorMyCourseDTO extends InstructorMyCourseEntity {
  const InstructorMyCourseDTO({
    required super.id,
    required super.name,
    required super.avatar,
    required super.sub,
  });

  factory InstructorMyCourseDTO.fromJson(Map<String, dynamic> json) =>
      InstructorMyCourseDTO(
        id: json["id"] ?? "",
        name: json["name"] ?? "",
        avatar: "",
        sub: json["sub"] ?? "",
      );
}
