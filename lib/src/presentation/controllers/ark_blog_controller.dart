import 'package:ark_module_regular/src/domain/entities/blog_entity.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ArkBlogController extends GetxController {
  final RxList<BlogEntity> _blogs = <BlogEntity>[].obs;
  RxList<BlogEntity> get blogs => _blogs;

  final RxList<BlogEntity> _blogsSearch = <BlogEntity>[].obs;
  RxList<BlogEntity> get blogsSearch => _blogsSearch;

  final TextEditingController _txSearchBlog = TextEditingController();
  TextEditingController get txSearchBlog => _txSearchBlog;

  @override
  void onInit() {
    if (Get.arguments != null) {
      _blogs.value = Get.arguments;
    }
    super.onInit();
  }

  @override
  void onClose() {
    _txSearchBlog.dispose();
    super.onClose();
  }

  void onSearch(String query) {
    for (var e in blogs) {
      if (e.title.rendered.contains(query)) {
        blogsSearch.add(e);
      }
    }
    blogs.value = blogsSearch
        .where(
          (e) => e.title.rendered.toLowerCase().contains(
                txSearchBlog.value.text,
              ),
        )
        .toSet()
        .toList();
  }
}
