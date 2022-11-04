import 'dart:convert';

String sliderEntityToJson(SliderEntity data) => json.encode(data.toJson());

class SliderEntity {
  SliderEntity({
    required this.success,
    required this.data,
  });

  final bool success;
  final List<SliderDataEntity> data;

  SliderEntity copyWith({
    bool? success,
    List<SliderDataEntity>? data,
  }) =>
      SliderEntity(
        success: success ?? this.success,
        data: data ?? this.data,
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class SliderDataEntity {
  SliderDataEntity({
    required this.id,
    required this.index,
    required this.newTab,
    required this.link,
    required this.img,
    required this.imgMobile,
  });

  final int id;
  final int index;
  final bool newTab;
  final String link;
  final String img;
  final String imgMobile;

  SliderDataEntity copyWith({
    int? id,
    int? index,
    bool? newTab,
    String? link,
    String? img,
    String? imgMobile,
  }) =>
      SliderDataEntity(
        id: id ?? this.id,
        index: index ?? this.index,
        newTab: newTab ?? this.newTab,
        link: link ?? this.link,
        img: img ?? this.img,
        imgMobile: imgMobile ?? this.imgMobile,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "index": index,
        "newTab": newTab,
        "link": link,
        "img": img,
        "imgMobile": imgMobile,
      };
}
