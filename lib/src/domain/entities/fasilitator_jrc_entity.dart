class FasilitatorJrcEntity {
  FasilitatorJrcEntity({
    required this.userId,
    required this.name,
    required this.avatar,
    required this.namaPerusahaan,
    required this.deskripsi,
    required this.instagram,
    required this.linkedin,
  });

  String userId;
  String name;
  String avatar;
  String namaPerusahaan;
  String deskripsi;
  String instagram;
  String linkedin;

  FasilitatorJrcEntity copyWith({
    String? userId,
    String? name,
    String? avatar,
    String? namaPerusahaan,
    String? deskripsi,
    String? instagram,
    String? linkedin,
  }) =>
      FasilitatorJrcEntity(
        userId: userId ?? this.userId,
        name: name ?? this.name,
        avatar: avatar ?? this.avatar,
        namaPerusahaan: namaPerusahaan ?? this.namaPerusahaan,
        deskripsi: deskripsi ?? this.deskripsi,
        instagram: instagram ?? this.instagram,
        linkedin: linkedin ?? this.linkedin,
      );

  Map<String, dynamic> toJson() => {
        "user_id": userId,
        "name": name,
        "avatar": avatar,
        "nama_perusahaan": namaPerusahaan,
        "deskripsi": deskripsi,
        "instagram": instagram,
        "linkedin": linkedin,
      };
}
