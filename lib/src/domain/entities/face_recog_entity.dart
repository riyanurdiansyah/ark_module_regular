import 'package:equatable/equatable.dart';

class FaceRecogEntity extends Equatable {
  final String base64image;
  final String subjectId;

  const FaceRecogEntity({
    required this.base64image,
    required this.subjectId,
  });

  @override
  List<Object?> get props => [base64image, subjectId];
}
