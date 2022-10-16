import 'package:ark_module_regular/src/domain/entities/fasilitator_jrc_entity.dart';

class FasilitatorJrcDTO extends FasilitatorJrcEntity {
  FasilitatorJrcDTO({
    required super.userId,
    required super.name,
    required super.avatar,
    required super.namaPerusahaan,
    required super.deskripsi,
    required super.instagram,
    required super.linkedin,
  });

  factory FasilitatorJrcDTO.fromJson(Map<String, dynamic> json) =>
      FasilitatorJrcDTO(
        userId: json["user_id"],
        name: json["name"],
        avatar: json["avatar"],
        namaPerusahaan: json["nama_perusahaan"],
        deskripsi: json["deskripsi"],
        instagram: json["instagram"],
        linkedin: json["linkedin"],
      );
}
