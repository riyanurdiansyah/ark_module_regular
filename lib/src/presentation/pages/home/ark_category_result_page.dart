import 'package:ark_module_regular/ark_module_regular.dart';
import 'package:ark_module_regular/src/presentation/pages/home/widget/ark_banner_category_top.dart';
import 'package:ark_module_regular/src/presentation/pages/search/widget/ark_class_search_result_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ark_module_regular/utils/app_route_name.dart';
import 'package:ark_module_regular/utils/app_shimmer.dart';
import 'package:ark_module_regular/utils/app_color.dart';

class ArkCategoryResultPage extends StatelessWidget {
  ArkCategoryResultPage({
    Key? key,
  }) : super(key: key);

  final _ctgC = Get.find<ArkCategoryController>();

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
      body: SingleChildScrollView(
        controller: _ctgC.controllerList,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Obx(
              () => ArkBannerCategoryTop(
                categories: _ctgC.categories,
                selectedCategory: _ctgC.selectedCategory.value,
                isLoading: _ctgC.isLoadingCategory.value,
                isHome: false,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Obx(
                    () => Text(
                      _ctgC.isLoadingCategory.value
                          ? "..."
                          : _ctgC.categories[_ctgC.selectedCategory.value].name,
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.w800),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  GestureDetector(
                    onTap: () => Get.toNamed(AppRouteName.search),
                    child: Container(
                      height: 40,
                      // width: 196,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(color: kNewBlack3)),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 9, vertical: 7),
                      child: Row(
                        children: const [
                          Icon(Icons.search, color: kNewBlack2b, size: 15),
                          SizedBox(width: 4),
                          Text(
                            'Cari Kursus',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: kNewBlack3,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Obx(
                    () {
                      if (_ctgC.isLoadingCourses.value) {
                        return AppShimmer.loadBannerBlog();
                      } else {
                        return Column(
                          children: [
                            ListView.builder(
                              shrinkWrap: true,
                              physics: const ScrollPhysics(),
                              itemCount: _ctgC.courses.length,
                              itemBuilder: (context, index) =>
                                  ArkClassSearchResultCard(
                                course: _ctgC.courses[index],
                              ),
                            ),
                          ],
                        );
                      }
                    },
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
