import 'package:ark_module_regular/src/domain/entities/sertifikat_entitiy.dart';

class SertifikatDTO extends SertifikatEntity {
  SertifikatDTO({
    required super.success,
    required super.certificates,
  });

  factory SertifikatDTO.fromJson(Map<String, dynamic> json) => SertifikatDTO(
        success: json['success'],
        certificates: List<SertifikatDataDTO>.from(
          json["certificates"].map(
            (e) => SertifikatDataDTO.fromJson(e),
          ),
        ),
      );
}

class SertifikatDataDTO extends SertifikatDataEntity {
  SertifikatDataDTO({
    required super.id,
    required super.courseName,
    required super.certificateDate,
    required super.certificateUrl,
    required super.certificateId,
    required super.remainingGen,
    required super.tipe,
    required super.issuingOrganization,
    required super.issueDate,
    required super.credentialId,
    required super.credentialUrl,
  });

  factory SertifikatDataDTO.fromJson(Map<String, dynamic> json) =>
      SertifikatDataDTO(
        id: json['id'],
        courseName: json['course_name'] ?? '',
        certificateDate: json['cert_date'] ?? '',
        certificateUrl: json['cert_url'] ?? '',
        certificateId: json['cert_id'] ?? '',
        remainingGen: json['remaining_gen'] ?? '',
        tipe: json['tipe'] ?? 'penyelesaian',
        issuingOrganization: json['issuing_Organization'] ?? '',
        issueDate: json['issue_date'] ?? '',
        credentialId: json['credential_id'] ?? '',
        credentialUrl: json['credential_url'] ?? '',
      );
}
