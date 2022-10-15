import 'package:ark_module_regular/src/presentation/controllers/ark_home_controller.dart';
import 'package:ark_module_regular/src/presentation/pages/home/widget/ark_banner_blog.dart';
import 'package:ark_module_regular/src/presentation/pages/home/widget/ark_banner_category.dart';
import 'package:ark_module_regular/src/presentation/pages/home/widget/ark_banner_jrc.dart';
import 'package:ark_module_regular/src/presentation/pages/home/widget/ark_banner_minicourse.dart';
import 'package:ark_module_regular/src/presentation/pages/home/widget/ark_banner_prakerja.dart';
import 'package:ark_module_regular/src/presentation/pages/home/widget/ark_banner_preparation_test.dart';
import 'package:ark_module_regular/src/presentation/pages/home/widget/ark_banner_text_with_class.dart';
import 'package:ark_module_regular/src/presentation/pages/home/widget/ark_banner_version.dart';
import 'package:ark_module_regular/src/presentation/pages/home/widget/ark_category_widget.dart';
import 'package:ark_module_regular/src/presentation/pages/home/widget/ark_slider_home.dart';
import 'package:ark_module_setup/ark_module_setup.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import 'widget/ark_banner_text_with_grid_class.dart';

class ArkHomePage extends StatelessWidget {
  ArkHomePage({Key? key}) : super(key: key);

  final _spfC = Get.find<ArkSpfController>();
  final _homeC = Get.find<ArkHomeController>();

  @override
  Widget build(BuildContext context) {
    const double barHeight = 113.0;
    final double statusbarHeight = MediaQuery.of(context).padding.top;
    return RefreshIndicator(
      onRefresh: () async {
        _homeC.onRefresh();
        await Future.delayed(const Duration(seconds: 1));
      },
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size(
            Get.width,
            125,
          ),
          child: Container(
            width: Get.width,
            height: statusbarHeight + barHeight,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xff0977BE),
                  Color(0xff139DD6),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 11,
                  horizontal: 20,
                ),
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Image.asset(
                          'assets/images/Logo-Arkademi-APP.png',
                          height: 30,
                        ),
                        const Spacer(),
                        if (_spfC.isLogin.value)
                          Row(
                            children: [
                              GestureDetector(
                                onTap: () =>
                                    Get.toNamed(AppRouteName.notification),
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      bottom: 2, right: 8, top: 8),
                                  child: SvgPicture.asset(
                                      'assets/images/icon-notif-prakerja.svg',
                                      height: 23),
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              GestureDetector(
                                onTap: () => Get.toNamed(AppRouteName.wishlist),
                                child: const Icon(
                                  CupertinoIcons.heart,
                                  color: Colors.white,
                                  size: 26,
                                ),
                              )
                            ],
                          ),
                      ],
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 10),
                      color: kPrimaryColorNew,
                      child: GestureDetector(
                        onTap: () {
                          // _dC.firstInit.value = true;
                          // Get.to(() => SearchPage(),
                          //     transition: Transition.downToUp);

                          Get.toNamed(
                            AppRouteName.search,
                            arguments: [
                              _homeC.category.value.data,
                              _homeC.recomendationCourse,
                            ],
                          );
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: const Color.fromRGBO(241, 242, 244, 1),
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(width: 0.2, color: kNewBlack4),
                          ),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 9, vertical: 7),
                          child: Row(
                            children: const [
                              Icon(Icons.search, color: kPrimaryColor),
                              SizedBox(width: 4),
                              Text(
                                'Cari kelas',
                                style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w500,
                                  color: kNewBlack3,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Obx(
                () => Row(
                  children: [
                    Expanded(
                      child: SizedBox(
                        height: 50,
                        child: ListView(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 10),
                          scrollDirection: Axis.horizontal,
                          children: List.generate(
                              _homeC.category.value.data.length, (i) {
                            if (_homeC.category.value.data[i].id == 2778) {
                              return InkWell(
                                onTap: () {
                                  // AppFirebaseAnalyticsService()
                                  //     .addLog('mbl_prj_jrc_p4_cta_home');
                                  // _dC.fetchListOfCategories(
                                  //     _homeC.category.value.data[i].id, 0, 8);
                                  // Get.to(() => CategoryResultPage(
                                  //       _homeC.category.value.data[i].name,
                                  //       _homeC.category.value.data[i].id
                                  //           .toString(),
                                  //       index: i,
                                  //     ));
                                },
                                child: Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 12),
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
                                      _homeC.category.value.data[i].name,
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
                                  //     _homeC.category.value.data[i].id, 0, 8);
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
                                  //       _homeC.category.value.data[i].name,
                                  //       _homeC.category.value.data[i].id
                                  //           .toString(),
                                  //       index: i,
                                  //     ));
                                },
                                child: ArkCategoryWidget(
                                  title: _homeC.category.value.data[i].name,
                                  colorBorder: kNewBlack4,
                                  textColor: kNewBlack2b,
                                  color: i == _homeC.selectedCategoryIndex.value
                                      ? kPrimaryBlue4
                                      : Colors.white,
                                  margin: EdgeInsets.only(
                                      right: i ==
                                              _homeC.category.value.data
                                                      .length -
                                                  1
                                          ? 0
                                          : 6),
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
                                  color:
                                      const Color.fromARGB(137, 208, 208, 208)
                                          .withOpacity(0.4),
                                ),
                                const BoxShadow(
                                    color: kCanvasColor,
                                    offset: Offset(0, -16)),
                                const BoxShadow(
                                    color: kCanvasColor, offset: Offset(0, 16)),
                                const BoxShadow(
                                    color: kCanvasColor,
                                    offset: Offset(16, 16)),
                                const BoxShadow(
                                    color: kCanvasColor,
                                    offset: Offset(16, -16)),
                              ],
                              border: const Border(
                                  left: BorderSide(
                                      width: 1.5, color: Colors.black12)),
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
                              AppRouteName.category,
                              arguments: _homeC.category.value,
                            ),
                            child: const Icon(Icons.menu,
                                color: kPrimaryColor, size: 30),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              ArkSliderHome(),
              ArkBannerPrakerja(
                onTapBanner: () {},
              ),
              Obx(
                () => ArkBannerJRC(
                  onTapShowAll: () {},
                  onTapClass: () {},
                  listCourseJRC: _homeC.courseJRC.value.data,
                  isLoading: _homeC.isLoadingCourseJRC.value,
                ),
              ),
              const ArkBannerPreparationTest(),
              const SizedBox(height: 14),
              Obx(
                () => ArkBannerTextWithClass(
                  title: "Trending",
                  imageTitle: "trending.png",
                  listCourse: _homeC.trendingCourse,
                  isLoading: _homeC.isLoadingTrendingCourse.value,
                ),
              ),
              const SizedBox(height: 25),
              const ArkMiniCourse(),
              const SizedBox(height: 20),
              Obx(
                () => ArkBannerCategory(
                  listCategory: _homeC.category.value.data,
                  isLoading: _homeC.isLoadingCategory.value,
                ),
              ),
              const SizedBox(height: 20),
              Obx(
                () => ArkBannerTextWithClass(
                  title: "Kelas Terbaru",
                  listCourse: _homeC.newestCourse,
                  isLoading: _homeC.isLoadingNewestCourse.value,
                ),
              ),
              const SizedBox(height: 20),
              Obx(
                () => ArkBannerTextWithClass(
                  title: "Bisnis",
                  listCourse: _homeC.businessCourse,
                  isLoading: _homeC.isLoadingBusinessCourse.value,
                ),
              ),
              const SizedBox(height: 20),
              Obx(
                () => ArkBannerTextWithClass(
                  title: "Pengembangan Diri",
                  listCourse: _homeC.pengembanganKarirCourse,
                  isLoading: _homeC.isLoadingPengembanganKarirCourse.value,
                ),
              ),
              const SizedBox(height: 26),
              Obx(
                () => ArkBannerTextWithGridClass(
                  title: "Rekomendasi",
                  isMore: true,
                  more: () {},
                  listCourse: _homeC.recomendationCourse,
                  isLoading: _homeC.isLoadingRecomendationCourse.value,
                ),
              ),
              const SizedBox(height: 26),
              Obx(
                () => ArkBannerBlog(
                  blogs: _homeC.blogs,
                  isLoading: _homeC.isLoadingBlog.value,
                ),
              ),
              ArkBannerVersion(
                version: _homeC.version.value,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
