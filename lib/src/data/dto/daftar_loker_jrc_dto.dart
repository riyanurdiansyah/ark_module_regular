import 'package:ark_module_regular/src/domain/entities/daftar_loker_jrc_entity.dart';

class DaftarLokerJrcDTO extends DaftarLokerJrcEntity {
  DaftarLokerJrcDTO({
    required super.urlCompany,
    required super.urlJobs,
    required super.companyName,
    required super.position,
    required super.maxGaji,
    required super.minGaji,
    required super.logoCompany,
  });

  factory DaftarLokerJrcDTO.fromJson(Map<String, dynamic> json) =>
      DaftarLokerJrcDTO(
        urlCompany: json["url_company"],
        urlJobs: json["url_jobs"],
        companyName: json["company_name"],
        position: json["position"],
        maxGaji: json["max_gaji"],
        minGaji: json["min_gaji"],
        logoCompany: json["logo_company"],
      );
}
