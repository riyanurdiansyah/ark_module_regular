class ProfileEntity {
  ProfileEntity({
    required this.status,
    required this.tab,
    required this.data,
  });

  final bool status;
  final String tab;
  final ProfileDataEntity data;
}

class ProfileDataEntity {
  ProfileDataEntity({
    required this.fullname,
    required this.location,
    required this.bio,
    required this.facebook,
    required this.twitter,
    required this.profession,
    required this.tglLahir,
    required this.provinsi,
    required this.kota,
    required this.jenisKelamin,
    required this.noHp,
    required this.pendidikanTerakhir,
  });

  final String fullname;
  final String location;
  final String bio;
  final String facebook;
  final String twitter;
  final String profession;
  final String tglLahir;
  final String provinsi;
  final String kota;
  final String jenisKelamin;
  final String noHp;
  final String pendidikanTerakhir;

  Map<String, dynamic> toJson() => {
        "nama_lengkap": fullname,
        "biodata": bio,
        "profesi": profession,
        "no_hp": noHp,
        "jenis_kelamin": jenisKelamin,
        "tgl_lahir": tglLahir,
        "kota": kota,
        "provinsi": provinsi,
        "pendidikan_terakhir": pendidikanTerakhir,
      };
}
