import 'package:ark_module_setup/ark_module_setup.dart';
import 'package:ark_module_setup/utils/app_shimmer.dart';
import 'package:flutter/material.dart';

import 'ark_category_widget.dart';

class ArkBannerCategoryTop extends StatelessWidget {
  const ArkBannerCategoryTop({
    Key? key,
    required this.categories,
    required this.selectedCategory,
    required this.isLoading,
  }) : super(key: key);

  final List<CategoryDataEntity> categories;
  final int selectedCategory;
  final bool isLoading;

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
                children: List.generate(categories.length, (i) {
                  if (categories[i].id == 2778) {
                    return InkWell(
                      onTap: () {
                        // AppFirebaseAnalyticsService()
                        //     .addLog('mbl_prj_jrc_p4_cta_home');
                        // _dC.fetchListOfCategories(
                        //     categories[i].id, 0, 8);
                        // Get.to(() => CategoryResultPage(
                        //       categories[i].name,
                        //       categories[i].id
                        //           .toString(),
                        //       index: i,
                        //     ));
                      },
                      child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 12),
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
                            style: AppStyleText.styleMontserrat(
                              fontSize: 11.5,
                              color: const Color(0xFF333539),
                              fontWeight: FontWeight.w700,
                            ),
                          )),
                    );
                  } else {
                    return InkWell(
                      borderRadius: BorderRadius.circular(6),
                      onTap: () async {
                        // _dC.fetchListOfCategories(
                        //     categories[i].id, 0, 8);
                        // AppFirebaseAnalyticsService().addLogWithParam(
                        //   "tap_category",
                        //   {
                        //     "name": _dC.listNameCategory.value
                        //         .data![i].name!,
                        //     "id": _dC
                        //         .listNameCategory.value.data![i].id!
                        //         .toString(),
                        //   },
                        // );
                        // Get.to(() => CategoryResultPage(
                        //       categories[i].name,
                        //       categories[i].id
                        //           .toString(),
                        //       index: i,
                        //     ));
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
                onTap: () {},
                // onTap: () => Get.toNamed(
                //   AppRouteName.category,
                //   arguments: _homeC.category.value,
                // ),
                child: const Icon(Icons.menu, color: kPrimaryColor, size: 30),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
