import 'package:ark_module_regular/src/domain/entities/instruktur_jrc_entity.dart';

class InstrukturJrcDTO extends InstrukturJrcEntity {
  InstrukturJrcDTO({
    required super.courseId,
    required super.fasilitator,
    required super.namaInstruktur,
    required super.positionInstruktur,
    required super.descriptionInstruktur,
    required super.avatarInstruktur,
    required super.instagramInstruktur,
    required super.linkedinInstruktur,
  });

  factory InstrukturJrcDTO.fromJson(Map<String, dynamic> json) =>
      InstrukturJrcDTO(
        courseId: json["course_id"],
        fasilitator: json["fasilitator"],
        namaInstruktur: json["nama_instruktur"],
        positionInstruktur: json["position_instruktur"],
        descriptionInstruktur: json["description_instruktur"],
        avatarInstruktur: json["avatar_instruktur"],
        instagramInstruktur: json["instagram_instruktur"],
        linkedinInstruktur: json["linkedin_instruktur"],
      );
}
