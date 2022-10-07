import 'package:ark_module_regular/src/domain/entities/profile_entity.dart';

class ProfileDTO extends ProfileEntity {
  ProfileDTO({
    required super.status,
    required super.data,
    required super.tab,
  });

  factory ProfileDTO.fromJson(Map<String, dynamic> json) => ProfileDTO(
        status: json["status"],
        tab: json["tab"],
        data: ProfileDataDTO.fromJson(json["data"]),
      );
}

class ProfileDataDTO extends ProfileDataEntity {
  ProfileDataDTO({
    required super.fullname,
    required super.location,
    required super.bio,
    required super.facebook,
    required super.twitter,
    required super.profession,
    required super.tglLahir,
    required super.provinsi,
    required super.kota,
    required super.jenisKelamin,
    required super.noHp,
    required super.pendidikanTerakhir,
  });

  factory ProfileDataDTO.fromJson(Map<String, dynamic> json) => ProfileDataDTO(
        bio: json["bio"] ?? "",
        facebook: json["facebook"] ?? "",
        fullname: json["fullname"] ?? "",
        jenisKelamin: json["jenis_kelamin"] ?? "",
        kota: json["kota"] ?? "",
        location: json["location"] ?? "",
        noHp: json["no_hp"] ?? "",
        pendidikanTerakhir: json["pendidikan_terakhir"] ?? "",
        profession: json["profession"] ?? "",
        provinsi: json["provinsi"] ?? "",
        tglLahir: json["tgl_lahir"] ?? "",
        twitter: json["twitter"] ?? "",
      );

  @override
  Map<String, dynamic> toJson() => {
        "fullname": fullname,
        "location": location,
        "bio": bio,
        "facebook": facebook,
        "twitter": twitter,
        "profession": profession,
        "tgl_lahir": tglLahir,
        "provinsi": provinsi,
        "kota": kota,
        "jenis_kelamin": jenisKelamin,
        "no_hp": noHp,
        "pendidikan_terakhir": pendidikanTerakhir,
      };
}
