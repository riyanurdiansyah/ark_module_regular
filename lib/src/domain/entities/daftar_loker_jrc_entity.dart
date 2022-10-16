class DaftarLokerJrcEntity {
  DaftarLokerJrcEntity({
    required this.urlCompany,
    required this.urlJobs,
    required this.companyName,
    required this.position,
    required this.maxGaji,
    required this.minGaji,
    required this.logoCompany,
  });

  String urlCompany;
  String urlJobs;
  String companyName;
  String position;
  String maxGaji;
  String minGaji;
  String logoCompany;

  DaftarLokerJrcEntity copyWith({
    String? urlCompany,
    String? urlJobs,
    String? companyName,
    String? position,
    String? maxGaji,
    String? minGaji,
    String? logoCompany,
  }) =>
      DaftarLokerJrcEntity(
        urlCompany: urlCompany ?? this.urlCompany,
        urlJobs: urlJobs ?? this.urlJobs,
        companyName: companyName ?? this.companyName,
        position: position ?? this.position,
        maxGaji: maxGaji ?? this.maxGaji,
        minGaji: minGaji ?? this.minGaji,
        logoCompany: logoCompany ?? this.logoCompany,
      );

  Map<String, dynamic> toJson() => {
        "url_company": urlCompany,
        "url_jobs": urlJobs,
        "company_name": companyName,
        "position": position,
        "max_gaji": maxGaji,
        "min_gaji": minGaji,
        "logo_company": logoCompany,
      };
}
