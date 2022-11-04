import 'package:equatable/equatable.dart';

class InstructorMyCourseEntity extends Equatable {
  const InstructorMyCourseEntity({
    required this.id,
    required this.name,
    required this.avatar,
    required this.sub,
  });

  final String id;
  final String name;
  final String avatar;
  final String sub;

  InstructorMyCourseEntity copyWith({
    String? id,
    String? name,
    String? avatar,
    String? sub,
  }) =>
      InstructorMyCourseEntity(
        id: id ?? this.id,
        name: name ?? this.name,
        avatar: avatar ?? this.avatar,
        sub: sub ?? this.sub,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "avatar": avatar,
        "sub": sub,
      };

  @override
  List<Object?> get props => [id, name, avatar, sub];
}
