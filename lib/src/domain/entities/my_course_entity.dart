import 'dart:convert';
import 'package:equatable/equatable.dart';
import 'instructor_entity.dart';

String myCourseEntityToJson(List<MyCourseEntity> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class MyCourseEntity extends Equatable {
  const MyCourseEntity({
    required this.id,
    required this.name,
    required this.courseSlug,
    required this.dateCreated,
    required this.userProgress,
    required this.userStatus,
    required this.userExpiry,
    required this.startDate,
    required this.featuredImage,
    required this.instructor,
    required this.menuOrder,
    required this.sesiKonsultasi,
  });

  final int id;
  final String name;
  final String courseSlug;
  final int dateCreated;
  final String userProgress;
  final String userStatus;
  final String userExpiry;
  final bool startDate;
  final String featuredImage;
  final InstructorEntity instructor;
  final int menuOrder;
  final String sesiKonsultasi;

  MyCourseEntity copyWith({
    int? id,
    String? name,
    String? courseSlug,
    int? dateCreated,
    String? userProgress,
    String? userStatus,
    String? userExpiry,
    bool? startDate,
    String? featuredImage,
    InstructorEntity? instructor,
    int? menuOrder,
    String? sesiKonsultasi,
  }) =>
      MyCourseEntity(
        id: id ?? this.id,
        name: name ?? this.name,
        courseSlug: courseSlug ?? this.courseSlug,
        dateCreated: dateCreated ?? this.dateCreated,
        userProgress: userProgress ?? this.userProgress,
        userStatus: userStatus ?? this.userStatus,
        userExpiry: userExpiry ?? this.userExpiry,
        startDate: startDate ?? this.startDate,
        featuredImage: featuredImage ?? this.featuredImage,
        instructor: instructor ?? this.instructor,
        menuOrder: menuOrder ?? this.menuOrder,
        sesiKonsultasi: sesiKonsultasi ?? this.sesiKonsultasi,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "course_slug": courseSlug,
        "date_created": dateCreated,
        "user_progress": userProgress,
        "user_status": userStatus,
        "user_expiry": userExpiry,
        "start_date": startDate,
        "featured_image": featuredImage,
        "instructor": instructor.toJson(),
        "menu_order": menuOrder,
        "sesi_konsultasi": sesiKonsultasi,
      };
  @override
  List<Object?> get props => [
        id,
        name,
        courseSlug,
        dateCreated,
        userProgress,
        userStatus,
        userExpiry,
        startDate,
        featuredImage,
        instructor,
        menuOrder,
        sesiKonsultasi,
      ];
}
