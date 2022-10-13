import 'dart:convert';

import 'package:equatable/equatable.dart';

String categoryEntityToJson(CategoryEntity data) => json.encode(data.toJson());

class CategoryEntity extends Equatable {
  const CategoryEntity({
    required this.status,
    required this.data,
  });

  final bool status;
  final List<CategoryDataEntity> data;

  CategoryEntity copyWith({
    bool? status,
    List<CategoryDataEntity>? data,
  }) =>
      CategoryEntity(
        status: status ?? this.status,
        data: data ?? this.data,
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };

  @override
  List<Object?> get props => [status, data];
}

class CategoryDataEntity extends Equatable {
  const CategoryDataEntity({
    required this.id,
    required this.name,
    required this.slugName,
    required this.parent,
    required this.img,
    required this.count,
  });

  final int id;
  final String name;
  final String slugName;
  final int parent;
  final String img;
  final int count;

  CategoryDataEntity copyWith({
    int? id,
    String? name,
    String? slugName,
    int? parent,
    String? img,
    int? count,
  }) =>
      CategoryDataEntity(
        id: id ?? this.id,
        name: name ?? this.name,
        slugName: slugName ?? this.slugName,
        parent: parent ?? this.parent,
        img: img ?? this.img,
        count: count ?? this.count,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "slug_name": slugName,
        "parent": parent,
        "img": img,
        "count": count,
      };

  @override
  List<Object?> get props => [id, name, slugName, parent, img, count];
}
