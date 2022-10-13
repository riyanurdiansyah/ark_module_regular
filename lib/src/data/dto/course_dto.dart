import 'package:ark_module_regular/src/data/dto/instructor_dto.dart';
import 'package:ark_module_regular/src/domain/entities/course_entity.dart';

class CourseDTO extends CourseEntity {
  const CourseDTO({
    required super.status,
    required super.data,
  });

  factory CourseDTO.fromJson(Map<String, dynamic> json) => CourseDTO(
        status: json["success"],
        data: List<CourseParseDTO>.from(
          json["data"].map(
            (e) => CourseParseDTO.fromJson(e),
          ),
        ),
      );
}

class CourseParseDTO extends CourseParseEntity {
  const CourseParseDTO({
    required super.course,
  });

  factory CourseParseDTO.fromJson(Map<String, dynamic> json) => CourseParseDTO(
        course: CourseDataDTO.fromJson(json["course"]),
      );
}

class CourseDataDTO extends CourseDataEntity {
  const CourseDataDTO({
    required super.averageRating,
    required super.courseSlug,
    required super.description,
    required super.descriptionInstruktur,
    required super.enableFaceRecog,
    required super.featuredImage,
    required super.id,
    required super.iosPrice,
    required super.name,
    required super.price,
    required super.regularPrice,
    required super.salePrice,
    required super.totalStudents,
    required super.instructor,
    required super.coinCashback,
    required super.discount,
  });

  factory CourseDataDTO.fromJson(Map<String, dynamic> json) => CourseDataDTO(
        averageRating:
            json["average_rating"] == 0 || json["average_rating"] == null
                ? "0"
                : json["average_rating"],
        courseSlug: json["course_slug"] ?? "",
        description: json["description"] ?? "",
        descriptionInstruktur: json["description_instruktur"] ?? "",
        enableFaceRecog: json["enable_faceRecog"] ?? 0,
        featuredImage: json["featured_image"] ?? "",
        id: json["id"] ?? 0,
        iosPrice: json["ios_price"] ?? "0",
        name: json["name"] ?? "",
        price: json["price"] ?? "0",
        regularPrice: json["regular_price"] ?? "0",
        salePrice: json["sale_price"] ?? "",
        totalStudents: json["total_students"] ?? 0,
        instructor: json["instructor"] == null
            ? const InstructorDTO(id: "", name: "name", avatar: "", sub: "")
            : InstructorDTO.fromJson(
                json["instructor"],
              ),
        coinCashback: json["sale_price"] == null ||
                json["sale_price"] == false ||
                json['sale_price'] == "0"
            ? (int.parse(json['regular_price'] == null ||
                            json['regular_price'] == false
                        ? "0"
                        : json['regular_price']) *
                    0.05)
                .floor()
                .toString()
            : (int.parse(json['sale_price']) * 0.05).floor().toString(),
        discount: json["sale_price"] == null ||
                json["sale_price"] == false ||
                json['sale_price'] == "0"
            ? 0.0
            : ((double.parse(json['regular_price']) -
                    double.parse(json['sale_price'])) /
                double.parse(
                  json['regular_price'],
                ) *
                100.0),
      );
}
