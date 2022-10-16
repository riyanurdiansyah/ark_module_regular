import 'package:ark_module_regular/src/domain/entities/instructor_entity.dart';

class InstructorDTO extends InstructorEntity {
  const InstructorDTO({
    required super.id,
    required super.name,
    required super.avatar,
    required super.sub,
  });

  factory InstructorDTO.fromJson(Map<String, dynamic> json) => InstructorDTO(
        id: json["id"] ?? "",
        name: json["name"] ?? "",
        avatar: AvatarDTO.fromJson(json["avatar"]),
        sub: json["sub"] ?? "",
      );
}

class AvatarDTO extends AvatarEntity {
  const AvatarDTO({
    required super.url,
  });

  factory AvatarDTO.fromJson(Map<String, dynamic> json) => AvatarDTO(
        url: json["url"],
      );
}
