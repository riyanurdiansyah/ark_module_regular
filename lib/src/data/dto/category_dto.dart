import 'dart:convert';
import 'package:ark_module_regular/src/domain/entities/category_entity.dart';

CategoryDTO categoryEntityFromJson(String str) =>
    CategoryDTO.fromJson(json.decode(str));

class CategoryDTO extends CategoryEntity {
  const CategoryDTO({
    required super.status,
    required super.data,
  });
  factory CategoryDTO.fromJson(Map<String, dynamic> json) => CategoryDTO(
        status: json["status"],
        data: List<DataCategoryDTO>.from(
            json["data"].map((x) => DataCategoryDTO.fromJson(x))),
      );
}

class DataCategoryDTO extends DataCategoryEntity {
  const DataCategoryDTO({
    required super.id,
    required super.name,
    required super.slugName,
    required super.parent,
    required super.img,
    required super.count,
  });

  factory DataCategoryDTO.fromJson(Map<String, dynamic> json) =>
      DataCategoryDTO(
        id: json["id"],
        name: json["name"],
        slugName: json["slug_name"],
        parent: json["parent"],
        img: json["img"],
        count: json["count"] ?? 0,
      );
}
