import 'dart:convert';

import 'package:ark_module_regular/src/domain/entities/slider_entity.dart';

SliderDataDTO sliderEntityFromJson(String str) =>
    SliderDataDTO.fromJson(json.decode(str));

class SliderDTO extends SliderEntity {
  SliderDTO({
    required super.success,
    required super.data,
  });

  factory SliderDTO.fromJson(Map<String, dynamic> json) => SliderDTO(
        success: json["success"],
        data: List<SliderDataEntity>.from(
            json["data"].map((x) => SliderDataDTO.fromJson(x))),
      );
}

class SliderDataDTO extends SliderDataEntity {
  SliderDataDTO({
    required super.id,
    required super.index,
    required super.newTab,
    required super.link,
    required super.img,
    required super.imgMobile,
  });

  factory SliderDataDTO.fromJson(Map<String, dynamic> json) => SliderDataDTO(
        id: json["id"],
        index: json["index"],
        newTab: json["newTab"],
        link: json["link"],
        img: json["img"],
        imgMobile: json["imgMobile"],
      );
}
