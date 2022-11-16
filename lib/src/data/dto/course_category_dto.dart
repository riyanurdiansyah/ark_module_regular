import 'package:ark_module_regular/src/domain/entities/course_category_entity.dart';

class CourseCategoryDTO extends CourseCategoryEntity {
  const CourseCategoryDTO({
    required super.id,
    required super.name,
    required super.slugs,
    required super.image,
  });

  factory CourseCategoryDTO.fromJson(Map<String, dynamic> json) =>
      CourseCategoryDTO(
        id: json["id"],
        name: json["name"],
        slugs: json["slugs"],
        image: json["image"],
      );
}
