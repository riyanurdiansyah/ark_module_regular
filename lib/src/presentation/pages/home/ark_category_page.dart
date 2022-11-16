import 'package:ark_module_regular/ark_module_regular.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ark_module_regular/utils/app_route_name.dart';
import 'package:ark_module_regular/utils/app_color.dart';

class ArkCategoryPage extends StatelessWidget {
  const ArkCategoryPage({
    Key? key,
    required this.categories,
    required this.isHome,
  }) : super(key: key);

  final List<CategoryDataEntity> categories;
  final bool isHome;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        title: const Text(
          'Kategori',
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 14,
            color: Colors.white,
          ),
        ),
        centerTitle: false,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.centerRight,
              end: Alignment.centerLeft,
              colors: [
                Color(0xFF139DD6),
                Color(0xFF0977BE),
              ],
            ),
          ),
        ),
      ),
      body: ListView(
        children: List.generate(
          categories.length,
          (i) => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (i == 0)
                const SizedBox(
                  height: 8,
                ),
              GestureDetector(
                onTap: () {
                  if (isHome) {
                    Get.offNamed(
                      AppRouteName.arkCategoryResult,
                      arguments: [categories, i],
                    );
                  } else {
                    Get.back();
                    Get.find<ArkCategoryController>()
                        .changeSelectedCategory(i, categories[i].id);
                  }
                },
                child: Container(
                  padding: const EdgeInsets.only(
                      left: 15, top: 8, right: 15, bottom: 8),
                  child: Row(children: [
                    CachedNetworkImage(
                      imageUrl: categories[i].img,
                      width: 22,
                      height: 22,
                    ),
                    const SizedBox(width: 15),
                    Text(categories[i].name),
                    if (categories[i].id == 2778)
                      const SizedBox(
                        width: 10,
                      ),
                    if (categories[i].id == 2778)
                      Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 4, horizontal: 6),
                        decoration: BoxDecoration(
                          color: const Color(0xFF4DD2F9),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: const Text(
                          'Baru',
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                            fontSize: 10,
                          ),
                        ),
                      )
                  ]),
                ),
              ),
              const Divider(
                color: kNewBlack4,
                thickness: 0.7,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
