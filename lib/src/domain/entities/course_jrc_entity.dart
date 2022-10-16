import 'dart:convert';

import 'package:ark_module_regular/src/domain/entities/daftar_loker_jrc_entity.dart';

import 'fasilitator_jrc_entity.dart';
import 'instruktur_jrc_entity.dart';

String courseJrcEntityToJson(CourseJrcEntity data) =>
    json.encode(data.toJson());

class CourseJrcEntity {
  CourseJrcEntity({
    required this.success,
    required this.data,
  });

  bool success;
  CourseJrcDataEntity data;

  CourseJrcEntity copyWith({
    bool? success,
    CourseJrcDataEntity? data,
  }) =>
      CourseJrcEntity(
        success: success ?? this.success,
        data: data ?? this.data,
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "data": data.toJson(),
      };
}

class CourseJrcDataEntity {
  CourseJrcDataEntity({
    required this.courseId,
    required this.subCategory,
    required this.subjudul,
    required this.sasaran,
    required this.hardSkill,
    required this.softSkill,
    required this.sertiPenyelesaian,
    required this.sertiKelulusan,
    required this.totalLowongan,
    required this.maxGaji,
    required this.minGaji,
    required this.fasilitator,
    required this.instruktur,
    required this.daftarLoker,
  });

  String courseId;
  String subCategory;
  String subjudul;
  List<String> sasaran;
  List<String> hardSkill;
  List<String> softSkill;
  String sertiPenyelesaian;
  String sertiKelulusan;
  int totalLowongan;
  String maxGaji;
  String minGaji;
  FasilitatorJrcEntity fasilitator;
  List<InstrukturJrcEntity> instruktur;
  List<DaftarLokerJrcEntity> daftarLoker;

  CourseJrcDataEntity copyWith({
    String? courseId,
    String? subCategory,
    String? subjudul,
    List<String>? sasaran,
    List<String>? hardSkill,
    List<String>? softSkill,
    String? sertiPenyelesaian,
    String? sertiKelulusan,
    int? totalLowongan,
    String? maxGaji,
    String? minGaji,
    FasilitatorJrcEntity? fasilitator,
    List<InstrukturJrcEntity>? instruktur,
    List<DaftarLokerJrcEntity>? daftarLoker,
  }) =>
      CourseJrcDataEntity(
        courseId: courseId ?? this.courseId,
        subCategory: subCategory ?? this.subCategory,
        subjudul: subjudul ?? this.subjudul,
        sasaran: sasaran ?? this.sasaran,
        hardSkill: hardSkill ?? this.hardSkill,
        softSkill: softSkill ?? this.softSkill,
        sertiPenyelesaian: sertiPenyelesaian ?? this.sertiPenyelesaian,
        sertiKelulusan: sertiKelulusan ?? this.sertiKelulusan,
        totalLowongan: totalLowongan ?? this.totalLowongan,
        maxGaji: maxGaji ?? this.maxGaji,
        minGaji: minGaji ?? this.minGaji,
        fasilitator: fasilitator ?? this.fasilitator,
        instruktur: instruktur ?? this.instruktur,
        daftarLoker: daftarLoker ?? this.daftarLoker,
      );

  Map<String, dynamic> toJson() => {
        "course_id": courseId,
        "sub_category": subCategory,
        "subjudul": subjudul,
        "sasaran": List<dynamic>.from(sasaran.map((x) => x)),
        "hard_skill": List<dynamic>.from(hardSkill.map((x) => x)),
        "soft_skill": List<dynamic>.from(softSkill.map((x) => x)),
        "serti_penyelesaian": sertiPenyelesaian,
        "serti_kelulusan": sertiKelulusan,
        "total_lowongan": totalLowongan,
        "max_gaji": maxGaji,
        "min_gaji": minGaji,
        "fasilitator": fasilitator.toJson(),
        "instruktur": List<dynamic>.from(instruktur.map((x) => x.toJson())),
        "daftar_loker": List<dynamic>.from(daftarLoker.map((x) => x.toJson())),
      };
}
