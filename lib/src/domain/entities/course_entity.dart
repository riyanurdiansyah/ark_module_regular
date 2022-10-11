import 'package:equatable/equatable.dart';

class CourseEntity extends Equatable {
  const CourseEntity({
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

  CourseEntity copyWith({
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
      CourseEntity(
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

class InstructorEntity extends Equatable {
  const InstructorEntity({
    required this.id,
    required this.name,
    required this.avatar,
    required this.sub,
  });

  final String id;
  final String name;
  final String avatar;
  final String sub;

  InstructorEntity errorWith({
    required String id,
    required String name,
    required String avatar,
    required String sub,
  }) =>
      InstructorEntity(
        id: id,
        name: name,
        avatar: avatar,
        sub: sub,
      );

  @override
  List<Object?> get props => [id, name, avatar, sub];
}
