import 'package:equatable/equatable.dart';

class LowonganEntity extends Equatable {
  const LowonganEntity({
    this.id,
    this.courseId,
    this.jumlahLowongan,
    this.startDateLowongan,
    this.endDateLowongan,
    this.categoryJob,
    this.gajiMin,
    this.gajiMax,
    this.reference,
  });

  final int? id;
  final String? courseId;
  final String? jumlahLowongan;
  final DateTime? startDateLowongan;
  final DateTime? endDateLowongan;
  final String? categoryJob;
  final String? gajiMin;
  final String? gajiMax;
  final String? reference;

  Map<String, dynamic> toJson() => {
        "id": id ?? 0,
        "course_id": courseId ?? "",
        "jumlah_lowongan": jumlahLowongan ?? "0",
        "startdate_lowongan": startDateLowongan == null
            ? DateTime.now().toIso8601String()
            : startDateLowongan!.toIso8601String(),
        "enddate_lowongan": endDateLowongan == null
            ? DateTime.now().toIso8601String()
            : endDateLowongan!.toIso8601String(),
        "category_job": categoryJob ?? "",
        "gaji_min": gajiMin ?? "",
        "gaji_max": gajiMax ?? "",
        "reference": reference ?? "",
      };

  @override
  List<Object?> get props => [
        id,
        courseId,
        jumlahLowongan,
        startDateLowongan,
        endDateLowongan,
        categoryJob,
        gajiMin,
        gajiMax,
        reference
      ];
}
