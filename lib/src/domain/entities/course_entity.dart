class CourseEntity {
  CourseEntity({
    this.id,
    this.name,
    this.courseSlug,
    this.dateCreated,
    this.userProgress,
    this.userStatus,
    this.userExpiry,
    this.startDate,
    this.featuredImage,
    this.instructor,
    this.menuOrder,
    this.sesiKonsultasi,
    this.error,
    this.errorMsg,
  });

  int? id;
  String? name;
  String? courseSlug;
  int? dateCreated;
  String? userProgress;
  String? userStatus;
  String? userExpiry;
  bool? startDate;
  String? featuredImage;
  InstructorEntity? instructor;
  int? menuOrder;
  String? sesiKonsultasi;
  bool? error;
  String? errorMsg;

  CourseEntity errorWith({
    bool? error,
    String? errorMessage,
  }) =>
      CourseEntity(
        error: error,
        errorMsg: errorMessage,
      );

  static fromJson(x) {}
}

class InstructorEntity {
  InstructorEntity({
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
}
