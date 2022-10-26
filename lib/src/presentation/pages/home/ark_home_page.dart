import 'package:ark_module_regular/ark_module_regular.dart';
import 'package:ark_module_regular/src/presentation/pages/home/widget/ark_banner_blog.dart';
import 'package:ark_module_regular/src/presentation/pages/home/widget/ark_banner_category.dart';
import 'package:ark_module_regular/src/presentation/pages/home/widget/ark_banner_category_top.dart';
import 'package:ark_module_regular/src/presentation/pages/home/widget/ark_banner_jrc.dart';
import 'package:ark_module_regular/src/presentation/pages/home/widget/ark_banner_minicourse.dart';
import 'package:ark_module_regular/src/presentation/pages/home/widget/ark_banner_prakerja.dart';
import 'package:ark_module_regular/src/presentation/pages/home/widget/ark_banner_preparation_test.dart';
import 'package:ark_module_regular/src/presentation/pages/home/widget/ark_banner_text_with_class.dart';
import 'package:ark_module_regular/src/presentation/pages/home/widget/ark_banner_version.dart';
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
                                onTap: () =>
                                    Get.toNamed(AppRouteName.arkWishlist),
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
                () => ArkBannerCategoryTop(
                  categories: _homeC.category.value.data,
                  selectedCategory: _homeC.selectedCategoryIndex.value,
                  isLoading: _homeC.isLoadingCategory.value,
                  isHome: true,
                ),
              ),
              ArkSliderHome(),
              ArkBannerPrakerja(
                onTapBanner: () => Get.toNamed(AppRouteName.mainPrakerja),
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
              ArkBannerMiniCourse(),
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
                  // isMore: true,
                  // more: () {
                  //   Get.toNamed(AppRouteName.arkCategoryResult);
                  // },
                ),
              ),
              const SizedBox(height: 20),
              Obx(
                () => ArkBannerTextWithClass(
                  title: "Bisnis",
                  listCourse: _homeC.businessCourse,
                  isLoading: _homeC.isLoadingBusinessCourse.value,
                  isMore: true,
                  more: () {
                    Get.toNamed(
                      AppRouteName.arkCategoryResult,
                      arguments: 562,
                    );
                  },
                ),
              ),
              const SizedBox(height: 20),
              Obx(
                () => ArkBannerTextWithClass(
                  title: "Pengembangan Diri",
                  listCourse: _homeC.pengembanganKarirCourse,
                  isLoading: _homeC.isLoadingPengembanganKarirCourse.value,
                  isMore: true,
                  more: () {
                    Get.toNamed(
                      AppRouteName.arkCategoryResult,
                      arguments: 1733,
                    );
                  },
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
