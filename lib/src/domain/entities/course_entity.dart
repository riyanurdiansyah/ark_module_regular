import 'dart:convert';

import 'package:ark_module_regular/src/domain/entities/course_flag_entity.dart';
import 'package:ark_module_regular/src/domain/entities/instructor_entity.dart';
import 'package:equatable/equatable.dart';

String courseParseEntityToJson(List<CourseParseEntity> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CourseEntity extends Equatable {
  const CourseEntity({
    required this.success,
    required this.data,
  });

  final bool success;
  final List<CourseParseEntity> data;

  Map<String, dynamic> toJson() => {
        "success": success,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };

  @override
  List<Object?> get props => [success, data];
}

class CourseParseEntity extends Equatable {
  const CourseParseEntity({
    required this.course,
  });

  final CourseDataEntity course;

  Map<String, dynamic> toJson() => {
        "course": course.toJson(),
      };

  @override
  List<Object?> get props => [course];
}

class CourseDataEntity extends Equatable {
  const CourseDataEntity({
    required this.averageRating,
    required this.courseSlug,
    required this.description,
    required this.descriptionInstruktur,
    required this.enableFaceRecog,
    required this.featuredImage,
    required this.id,
    required this.iosPrice,
    required this.name,
    required this.price,
    required this.regularPrice,
    required this.salePrice,
    required this.totalStudents,
    required this.instructor,
    required this.coinCashback,
    required this.discount,
    required this.courseFlag,
  });

  final String averageRating;
  final String courseSlug;
  final String description;
  final String descriptionInstruktur;
  final int enableFaceRecog;
  final String featuredImage;
  final int id;
  final String iosPrice;
  final String name;
  final String price;
  final String regularPrice;
  final String salePrice;
  final int totalStudents;
  final InstructorEntity instructor;
  final String coinCashback;
  final double discount;
  final CourseFlagEntity courseFlag;

  CourseDataEntity copyWith({
    String? averageRating,
    String? courseSlug,
    String? description,
    String? descriptionInstruktur,
    int? enableFaceRecog,
    int? id,
    String? featuredImage,
    String? iosPrice,
    String? name,
    String? price,
    String? regularPrice,
    String? salePrice,
    int? totalStudents,
    InstructorEntity? instructor,
    String? coinCashback,
    double? discount,
    CourseFlagEntity? courseFlag,
  }) =>
      CourseDataEntity(
        averageRating: averageRating ?? this.averageRating,
        courseSlug: courseSlug ?? this.courseSlug,
        description: description ?? this.description,
        descriptionInstruktur:
            descriptionInstruktur ?? this.descriptionInstruktur,
        enableFaceRecog: enableFaceRecog ?? this.enableFaceRecog,
        featuredImage: featuredImage ?? this.featuredImage,
        id: id ?? this.id,
        iosPrice: iosPrice ?? this.iosPrice,
        name: name ?? this.name,
        price: price ?? this.price,
        regularPrice: regularPrice ?? this.regularPrice,
        salePrice: salePrice ?? this.salePrice,
        totalStudents: totalStudents ?? this.totalStudents,
        instructor: instructor ?? this.instructor,
        coinCashback: coinCashback ?? this.coinCashback,
        discount: discount ?? this.discount,
        courseFlag: courseFlag ?? this.courseFlag,
      );

  Map<String, dynamic> toJson() => {
        "average_rating": averageRating,
        "course_slug": courseSlug,
        "description": description,
        "description_instruktur": descriptionInstruktur,
        "enable_face_recog": enableFaceRecog,
        "featured_image": featuredImage,
        "id": id,
        "ios_price": iosPrice,
        "name": name,
        "price": price,
        "regular_price": regularPrice,
        "sale_price": salePrice,
        "total_students": totalStudents,
        "instructor": instructor.toJson(),
      };
  @override
  List<Object?> get props => [
        averageRating,
        courseSlug,
        description,
        descriptionInstruktur,
        enableFaceRecog,
        featuredImage,
        id,
        iosPrice,
        name,
        price,
        regularPrice,
        salePrice,
        totalStudents,
        courseFlag,
      ];
}
