class ProfileEntity {
  ProfileEntity({
    this.status,
    this.tab,
    this.data,
  });

  bool? status;
  String? tab;
  ProfileDataEntity? data;
  bool error = false;
  String messageError = '';

  ProfileEntity.withError(
    String errorMessage,
  ) {
    status = false;
    error = true;
    messageError = errorMessage;
  }
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

  String fullname;
  String location;
  String bio;
  String facebook;
  String twitter;
  String profession;
  String tglLahir;
  String provinsi;
  String kota;
  String jenisKelamin;
  String noHp;
  String pendidikanTerakhir;

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
