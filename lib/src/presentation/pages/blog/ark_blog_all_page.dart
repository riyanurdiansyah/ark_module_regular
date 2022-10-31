import 'package:ark_module_regular/src/presentation/controllers/ark_blog_controller.dart';
import 'package:ark_module_regular/src/presentation/pages/home/widget/ark_blog_card.dart';
import 'package:ark_module_setup/ark_module_setup.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ArkBlogAllPage extends StatelessWidget {
  ArkBlogAllPage({Key? key}) : super(key: key);

  final _blogC = Get.find<ArkBlogController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        titleSpacing: 0,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF0977BE), Color(0xFF139DD6)],
            ),
          ),
        ),
        title: const Text(
          "Blog",
          style: TextStyle(
            fontSize: 15.5,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
            height: Get.size.shortestSide < 600 ? 72 : 82,
            child: TextFormField(
              controller: _blogC.txSearchBlog,
              style: TextStyle(fontSize: Get.size.shortestSide < 600 ? 14 : 20),
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.all(10),
                prefixIcon: GestureDetector(
                  child: const Icon(
                    Icons.search_rounded,
                    size: 20,
                    color: kNewBlack4,
                  ),
                ),
                hintText: "Cari Topik",
                hintStyle: const TextStyle(
                    fontSize: 14, color: Color.fromRGBO(28, 29, 32, 0.45)),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide: BorderSide(
                    color: Colors.grey.shade300,
                    width: 1,
                    style: BorderStyle.solid,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide: const BorderSide(
                    color: Color.fromRGBO(13, 89, 159, 0.6),
                    width: 1,
                    style: BorderStyle.solid,
                  ),
                ),
                filled: true,
                fillColor: Colors.white,
              ),
              onChanged: (query) {
                _blogC.onSearch(query);
              },
            ),
          ),
          Expanded(
            child: Obx(
              () => ListView(
                children: List.generate(
                  _blogC.blogs.length,
                  (i) => Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 14.0),
                    child: ArkBlogCard(
                      blogs: _blogC.blogs[i],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
