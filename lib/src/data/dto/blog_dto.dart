import 'dart:convert';
import 'package:ark_module_regular/ark_module_regular.dart';

List<BlogDTO> blogEntityFromJson(String str) =>
    List<BlogDTO>.from(json.decode(str).map((x) => BlogDTO.fromJson(x)));

class BlogDTO extends BlogEntity {
  BlogDTO({
    required super.id,
    required super.date,
    required super.slug,
    required super.link,
    required super.title,
    required super.content,
    required super.featuredImg,
    required super.authorName,
    required super.featuredImgApp,
  });

  factory BlogDTO.fromJson(Map<String, dynamic> json) => BlogDTO(
        id: json["id"],
        date: json["date"] == null
            ? DateTime.now()
            : DateTime.parse(json["date"]),
        slug: json["slug"],
        link: json["link"],
        title: json["title"] == null
            ? ContentBlogDTO(rendered: "")
            : ContentBlogDTO.fromJson(json["title"]),
        content: ContentBlogDTO.fromJson(json["content"]),
        featuredImgApp: json["featured_img_app"] == false ||
                json["featured_img_app"] == null
            ? ""
            : json["featured_img_app"],
        authorName: json["author_name"] ?? "",
        featuredImg: json["featured_img"] ?? "",
      );
}

class ContentBlogDTO extends ContentBlogEntity {
  ContentBlogDTO({
    required super.rendered,
  });

  factory ContentBlogDTO.fromJson(Map<String, dynamic> json) => ContentBlogDTO(
        rendered: json["rendered"],
      );
}
