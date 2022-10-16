class InstrukturJrcEntity {
  InstrukturJrcEntity({
    required this.courseId,
    required this.fasilitator,
    required this.namaInstruktur,
    required this.positionInstruktur,
    required this.descriptionInstruktur,
    required this.avatarInstruktur,
    required this.instagramInstruktur,
    required this.linkedinInstruktur,
  });

  int courseId;
  String fasilitator;
  String namaInstruktur;
  String positionInstruktur;
  String descriptionInstruktur;
  String avatarInstruktur;
  String instagramInstruktur;
  String linkedinInstruktur;

  InstrukturJrcEntity copyWith({
    int? courseId,
    String? fasilitator,
    String? namaInstruktur,
    String? positionInstruktur,
    String? descriptionInstruktur,
    String? avatarInstruktur,
    String? instagramInstruktur,
    String? linkedinInstruktur,
  }) =>
      InstrukturJrcEntity(
        courseId: courseId ?? this.courseId,
        fasilitator: fasilitator ?? this.fasilitator,
        namaInstruktur: namaInstruktur ?? this.namaInstruktur,
        positionInstruktur: positionInstruktur ?? this.positionInstruktur,
        descriptionInstruktur:
            descriptionInstruktur ?? this.descriptionInstruktur,
        avatarInstruktur: avatarInstruktur ?? this.avatarInstruktur,
        instagramInstruktur: instagramInstruktur ?? this.instagramInstruktur,
        linkedinInstruktur: linkedinInstruktur ?? this.linkedinInstruktur,
      );

  Map<String, dynamic> toJson() => {
        "course_id": courseId,
        "fasilitator": fasilitator,
        "nama_instruktur": namaInstruktur,
        "position_instruktur": positionInstruktur,
        "description_instruktur": descriptionInstruktur,
        "avatar_instruktur": avatarInstruktur,
        "instagram_instruktur": instagramInstruktur,
        "linkedin_instruktur": linkedinInstruktur,
      };
}
