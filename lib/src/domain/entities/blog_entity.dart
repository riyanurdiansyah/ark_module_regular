import 'dart:convert';

String blogEntityToJson(List<BlogEntity> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class BlogEntity {
  BlogEntity({
    required this.id,
    required this.date,
    required this.slug,
    required this.link,
    required this.title,
    required this.content,
    required this.featuredImg,
    required this.authorName,
    required this.featuredImgApp,
  });

  final int id;
  final DateTime date;
  final String slug;
  final String link;
  final ContentBlogEntity title;
  final ContentBlogEntity content;
  final String featuredImg;
  final String authorName;
  final String featuredImgApp;

  BlogEntity copyWith({
    int? id,
    DateTime? date,
    DateTime? dateGmt,
    DateTime? modified,
    DateTime? modifiedGmt,
    String? slug,
    String? link,
    ContentBlogEntity? title,
    ContentBlogEntity? content,
    String? featuredImg,
    String? authorName,
    String? featuredImgApp,
  }) =>
      BlogEntity(
        id: id ?? this.id,
        date: date ?? this.date,
        slug: slug ?? this.slug,
        content: title ?? this.content,
        authorName: authorName ?? this.authorName,
        featuredImg: featuredImg ?? this.featuredImg,
        featuredImgApp: featuredImgApp ?? this.featuredImgApp,
        link: link ?? this.link,
        title: title ?? this.title,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "date": date.toIso8601String(),
        "slug": slug,
        "link": link,
        "title": title.toJson(),
        "content": content.toJson(),
        "featured_img": featuredImg,
        "author_name": authorName,
        "featured_img_app": featuredImgApp,
      };

  static fromJson(x) {}
}

class ContentBlogEntity {
  ContentBlogEntity({
    required this.rendered,
  });

  String rendered;

  ContentBlogEntity copyWith({
    String? rendered,
  }) =>
      ContentBlogEntity(
        rendered: rendered ?? this.rendered,
      );

  Map<String, dynamic> toJson() => {
        "rendered": rendered,
      };
}
