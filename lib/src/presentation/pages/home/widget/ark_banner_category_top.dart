import 'package:ark_module_regular/ark_module_regular.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ark_module_regular/utils/app_route_name.dart';
import 'package:ark_module_regular/utils/app_shimmer.dart';
import 'package:ark_module_regular/utils/app_color.dart';
import 'ark_category_widget.dart';

class ArkBannerCategoryTop extends StatelessWidget {
  const ArkBannerCategoryTop({
    Key? key,
    required this.categories,
    required this.selectedCategory,
    required this.isLoading,
    required this.isHome,
  }) : super(key: key);

  final List<CategoryDataEntity> categories;
  final int selectedCategory;
  final bool isLoading;
  final bool isHome;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (isLoading)
          Expanded(
            child: SizedBox(
              height: 50,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                children: List.generate(
                  6,
                  (index) => Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: AppShimmer.loadImage(
                      85,
                      40,
                    ),
                  ),
                ),
              ),
            ),
          ),
        if (!isLoading)
          Expanded(
            child: SizedBox(
              height: 50,
              child: ListView(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                scrollDirection: Axis.horizontal,
                children: [
                  if (isHome)
                    InkWell(
                      onTap: () {},
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          vertical: 6,
                          horizontal: 10,
                        ),
                        margin: const EdgeInsets.only(right: 6),
                        decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              colors: [
                                kPrimaryColor,
                                Color.fromARGB(255, 46, 170, 228),
                              ],
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                            ),
                            borderRadius: BorderRadius.circular(6)),
                        child: Row(
                          children: [
                            Image.asset(
                              'assets/images/logo_pohon_skill.png',
                              width: 13,
                              height: 13,
                              fit: BoxFit.fill,
                            ),
                            const SizedBox(width: 6),
                            const Text(
                              'Pohon Skill',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 10.5),
                            ),
                          ],
                        ),
                      ),
                    ),
                  Row(
                    children: List.generate(categories.length, (i) {
                      if (categories[i].id == 2778) {
                        return InkWell(
                          onTap: () {
                            if (isHome) {
                              Get.toNamed(
                                AppRouteName.arkCategoryResult,
                                arguments: [categories, i],
                              );
                            } else {
                              Get.find<ArkCategoryController>()
                                  .changeSelectedCategory(i, categories[i].id);
                            }
                          },
                          child: Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 12),
                              margin: const EdgeInsets.only(right: 6),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(6),
                                  gradient: const LinearGradient(
                                    colors: [
                                      Color(0xFFBF972E),
                                      Color(0xFFEEE4AA),
                                      Color(0xFFFAF7C9),
                                      Color(0xFFBF972E),
                                    ],
                                  )),
                              child: Text(
                                categories[i].name,
                                style: const TextStyle(
                                  fontSize: 11.5,
                                  color: Color(0xFF333539),
                                  fontWeight: FontWeight.w700,
                                ),
                              )),
                        );
                      } else {
                        return InkWell(
                          borderRadius: BorderRadius.circular(6),
                          onTap: () async {
                            if (isHome) {
                              Get.toNamed(
                                AppRouteName.arkCategoryResult,
                                arguments: [categories, i],
                              );
                            } else {
                              Get.find<ArkCategoryController>()
                                  .changeSelectedCategory(i, categories[i].id);
                            }
                          },
                          child: ArkCategoryWidget(
                            title: categories[i].name,
                            colorBorder: kNewBlack4,
                            textColor: kNewBlack2b,
                            color: i == selectedCategory
                                ? kPrimaryBlue4
                                : Colors.white,
                            margin: EdgeInsets.only(
                                right: i == categories.length - 1 ? 0 : 6),
                          ),
                        );
                      }
                    }),
                  ),
                ],
              ),
            ),
          ),
        Stack(
          alignment: Alignment.centerLeft,
          children: [
            Align(
              alignment: Alignment.center,
              child: Container(
                alignment: Alignment.center,
                height: 20,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      spreadRadius: 5.0,
                      blurRadius: 2.0,
                      color: const Color.fromARGB(137, 208, 208, 208)
                          .withOpacity(0.4),
                    ),
                    const BoxShadow(
                        color: kCanvasColor, offset: Offset(0, -16)),
                    const BoxShadow(color: kCanvasColor, offset: Offset(0, 16)),
                    const BoxShadow(
                        color: kCanvasColor, offset: Offset(16, 16)),
                    const BoxShadow(
                        color: kCanvasColor, offset: Offset(16, -16)),
                  ],
                  border: const Border(
                      left: BorderSide(width: 1.5, color: Colors.black12)),
                  color: kCanvasColor,
                ),
              ),
            ),
            Container(
              // margin: const EdgeInsets.only(left: 5),
              margin: const EdgeInsets.only(
                right: 10,
                bottom: 4,
              ),
              padding: const EdgeInsets.all(10),
              decoration: const BoxDecoration(
                color: kCanvasColor,
              ),
              child: InkWell(
                onTap: () => Get.toNamed(
                  AppRouteName.arkCategory,
                  arguments: [categories, isHome],
                ),
                child: const Icon(Icons.menu, color: kPrimaryColor, size: 30),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
