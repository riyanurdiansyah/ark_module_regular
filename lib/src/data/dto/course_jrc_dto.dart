import 'dart:convert';

import 'package:ark_module_regular/src/data/dto/instruktur_jrc_dto.dart';
import 'package:ark_module_regular/src/domain/entities/course_jrc_entity.dart';

import 'daftar_loker_jrc_dto.dart';
import 'fasilitator_jrc_dto.dart';

CourseJrcDTO courseJrcEntityFromJson(String str) =>
    CourseJrcDTO.fromJson(json.decode(str));

class CourseJrcDTO extends CourseJrcEntity {
  CourseJrcDTO({
    required super.success,
    required super.data,
  });

  factory CourseJrcDTO.fromJson(Map<String, dynamic> json) => CourseJrcDTO(
        success: json["success"],
        data: CourseJrcDataDTO.fromJson(json["data"]),
      );
}

class CourseJrcDataDTO extends CourseJrcDataEntity {
  CourseJrcDataDTO({
    required super.courseId,
    required super.subCategory,
    required super.subjudul,
    required super.sasaran,
    required super.hardSkill,
    required super.softSkill,
    required super.sertiPenyelesaian,
    required super.sertiKelulusan,
    required super.totalLowongan,
    required super.maxGaji,
    required super.minGaji,
    required super.fasilitator,
    required super.instruktur,
    required super.daftarLoker,
  });

  factory CourseJrcDataDTO.fromJson(Map<String, dynamic> json) {
    return CourseJrcDataDTO(
      courseId: json["course_id"],
      subCategory: json["sub_category"],
      subjudul: json["subjudul"],
      sasaran: List<String>.from(json["sasaran"].map((x) => x)),
      hardSkill: List<String>.from(json["hard_skill"].map((x) => x)),
      softSkill: List<String>.from(json["soft_skill"].map((x) => x)),
      sertiPenyelesaian: json["serti_penyelesaian"],
      sertiKelulusan: json["serti_kelulusan"],
      totalLowongan: json["total_lowongan"],
      maxGaji: json["max_gaji"],
      minGaji: json["min_gaji"],
      fasilitator: FasilitatorJrcDTO.fromJson(json["fasilitator"]),
      instruktur: List<InstrukturJrcDTO>.from(
          json["instruktur"].map((x) => InstrukturJrcDTO.fromJson(x))),
      daftarLoker: List<DaftarLokerJrcDTO>.from(
          json["daftar_loker"].map((x) => DaftarLokerJrcDTO.fromJson(x))),
    );
  }
}
