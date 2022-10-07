class SertifikatEntity {
  bool? success;
  List<SertifikatDataEntity>? certificates;
  bool error = false;
  String messageError = '';

  SertifikatEntity({
    this.success,
    this.certificates,
  });

  SertifikatEntity.withError(
    String errorMessage,
  ) {
    success = false;
    error = true;
    messageError = errorMessage;
  }
}

class SertifikatDataEntity {
  final int id;
  final String courseName;
  final String certificateDate;
  final String certificateUrl;
  final String certificateId;
  final int remainingGen;
  final String tipe;
  final String issuingOrganization;
  final String issueDate;
  final String credentialId;
  final String credentialUrl;

  SertifikatDataEntity({
    required this.id,
    required this.courseName,
    required this.certificateDate,
    required this.certificateUrl,
    required this.certificateId,
    required this.remainingGen,
    required this.tipe,
    required this.issuingOrganization,
    required this.issueDate,
    required this.credentialId,
    required this.credentialUrl,
  });
}
