import 'package:ark_module_regular/ark_module_regular.dart';
import 'package:ark_module_setup/ark_module_setup.dart';
import 'package:connectivity_wrapper/connectivity_wrapper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

import 'widget/ark_row_with_two_widget.dart';

class ArkCoursePage extends StatelessWidget {
  ArkCoursePage({Key? key}) : super(key: key);

  final _courseC = Get.find<ArkCourseController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(Get.size.width, 150),
        child: Container(
          padding: EdgeInsets.only(
              top: Get.size.height * 0.05, bottom: 16, left: 15),
          width: Get.width,
          decoration: const BoxDecoration(
            boxShadow: <BoxShadow>[
              BoxShadow(
                  color: Colors.black26,
                  blurRadius: 15.0,
                  offset: Offset(0.0, 0.75))
            ],
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color(0xFF139DD6),
                Color(0xFF0977BE),
              ],
            ),
          ),
          child: Row(
            children: [
              InkWell(
                  onTap: () {
                    // if (widget.slug != '' || widget.useGetBack == true) {
                    //   AppPrint.debugPrint('getback');
                    //   Get.back();
                    // } else {
                    //   Get.off(() => MainPage());
                    // }
                  },
                  child: Image.asset(
                    'assets/images/job_ready_course/arrow_back.png',
                    fit: BoxFit.fill,
                    height: 14,
                    width: 17,
                  )),
              const SizedBox(width: 14),
              Text(
                'Kelas',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: Get.size.shortestSide < 600 ? 15 : 20,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const Spacer(),
              Row(
                children: [
                  InkWell(
                      onTap: () {
                        // Share.share(
                        //     'Ikuti kelas ${_courseC.detailCourse.value.name} di Arkademi https://arkademi.com/course/${_courseC.detailCourse.value.courseSlug}');
                      },
                      child: Image.asset(
                        'assets/images/job_ready_course/share.png',
                        fit: BoxFit.fill,
                        height: 20,
                        width: 20,
                      )),
                  const SizedBox(
                    width: 20,
                  ),
                  InkWell(
                    onTap: () {
                      // if (_lcC.isFav.value) {
                      //   _lcC.removeFromWishlist(
                      //       _courseC.detailCourse.value.id
                      //           .toString(),
                      //       context);
                      // } else {
                      //   _lcC.addToWishlist(
                      //       _courseC.detailCourse.value.id
                      //           .toString(),
                      //       context);
                      // }
                      // mixpanel!.getPeople().append(
                      //     "Wishlist",
                      //     _courseC.detailCourse.value.id
                      //         .toString());
                    },
                    child: const Icon(
                      CupertinoIcons.heart,
                      color: Colors.white,
                      size: 25,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                width: 20,
              ),
            ],
          ),
        ),
      ),
      body: ConnectivityWidgetWrapper(
        offlineCallback: () {},
        onlineCallback: () {},
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Obx(
                () => Column(
                  children: [
                    _courseC.isHaveVideo.value && _courseC.splitVid.length > 1
                        ? YoutubePlayerIFrame(
                            controller: _courseC.ytController,
                            aspectRatio: 16 / 9,
                          )
                        : Image.network(
                            _courseC.detailCourse.value.featuredImage,
                            width: Get.size.width,
                            fit: BoxFit.fitWidth,
                          ),
                    Container(
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.fill,
                          image: AssetImage(
                              'assets/images/job_ready_course/class_page_background_long.png'),
                        ),
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 18,
                        vertical: 10,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 6),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: const EdgeInsets.only(
                                  top: 3, bottom: 4, left: 7.5, right: 7.5),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(3),
                                gradient: const LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                  colors: [
                                    Color.fromARGB(255, 206, 164, 57),
                                    Color(0xFFEEE4AA),
                                    Color(0xFFFAF7C9),
                                    Color.fromARGB(255, 206, 164, 57),
                                  ],
                                ),
                              ),
                              child: const Text(
                                'JOB READY COURSE',
                                style: TextStyle(
                                  letterSpacing: 0.1,
                                  fontSize: 9.3,
                                  fontWeight: FontWeight.bold,
                                  color: kNewBlack1,
                                ),
                              ),
                            ),
                            const SizedBox(height: 6),
                            Text(
                              _courseC.detailCourse.value.name,
                              maxLines: 3,
                              overflow: TextOverflow.fade,
                              softWrap: true,
                              style: TextStyle(
                                  height: 1.3,
                                  fontSize:
                                      Get.size.shortestSide < 600 ? 16 : 19,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w800),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 8),
                              child: Row(
                                children: [
                                  ArkRowWithWidgetAndString(
                                    leftWidget: Padding(
                                      padding: const EdgeInsets.only(bottom: 1),
                                      child: RatingBar.builder(
                                        itemSize: Get.size.shortestSide < 600
                                            ? 12.5
                                            : 18,
                                        ignoreGestures: true,
                                        initialRating: _courseC.detailCourse
                                                    .value.averageRating ==
                                                '0'
                                            ? 5.0
                                            : double.parse(_courseC.detailCourse
                                                .value.averageRating),
                                        allowHalfRating: true,
                                        itemPadding: const EdgeInsets.symmetric(
                                            horizontal: 0.8),
                                        itemBuilder: (context, _) =>
                                            Image.asset(
                                          'assets/images/job_ready_course/star_yellow.png',
                                          fit: BoxFit.fill,
                                        ),
                                        onRatingUpdate: (_) {},
                                      ),
                                    ),
                                    rightString: _courseC.detailCourse.value
                                                .averageRating ==
                                            '0'
                                        ? '5'
                                        : _courseC
                                            .detailCourse.value.averageRating,
                                  ),
                                  Container(
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 20),
                                    child: ArkRowWithWidgetAndString(
                                      leftWidget: Icon(
                                        Icons.person,
                                        color: Colors.white,
                                        size: Get.size.shortestSide < 600
                                            ? 16
                                            : 20,
                                      ),
                                      rightString: _courseC.detailCourse.value
                                                  .totalStudents <
                                              4
                                          ? '3 siswa'
                                          : '${_courseC.detailCourse.value.totalStudents} siswa',
                                    ),
                                  ),
                                  SizedBox(
                                    width: Get.width * 0.35,
                                    child: ArkRowWithWidgetAndString(
                                      expandedRightString: false,
                                      leftWidget: ClipRRect(
                                        borderRadius: BorderRadius.circular(30),
                                        child: Image.network(
                                            _courseC.detailCourse.value
                                                .instructor.avatar.url,
                                            width: 15,
                                            height: 15),
                                      ),
                                      rightString: _courseC
                                          .detailCourse.value.instructor.name,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            // _courseC.detailCourse.value
                            //         .peluangKarir!.isEmpty
                            //     ? const SizedBox()
                            //     :
                            Card(
                                margin: const EdgeInsets.symmetric(
                                  vertical: 10,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(20),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        'Level: Pemula',
                                        style: TextStyle(
                                            fontSize: 10.5,
                                            fontWeight: FontWeight.w700,
                                            color: Color.fromRGBO(
                                                131, 133, 137, 1)),
                                      ),
                                      const SizedBox(height: 10),

                                      ///TODO: BELUM DI HANDLE
                                      // if (_courseC.detailCourse.value
                                      //     .peluangKarir!.isNotEmpty)
                                      //   PeluangKarirJrc(
                                      //     listUsed: _lcC.detailClass.value
                                      //         .data![0].course!.peluangKarir!,
                                      //   ),

                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 7),
                                                child: SvgPicture.asset(
                                                  'assets/svg/cv.svg',
                                                ),
                                              ),
                                              const SizedBox(
                                                width: 12,
                                              ),
                                              Expanded(
                                                child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: const [
                                                      ///TODO: BELUM DIHANDLE
                                                      // AppText.labelW700(
                                                      //   '${_lcC.jrc.value.data!.totalLowongan} Lowongan',
                                                      //   familiy:
                                                      //       'SourceSansPro',
                                                      //   13,
                                                      //   kNewBlack1,
                                                      //   maxLines: 3,
                                                      //   height: 1.5,
                                                      // ),
                                                      // AppText.labelW400(
                                                      //   'Lowongan yang tersedia untuk posisi ${_lcC.jrc.value.data!.subCategory} dalam 3 hari',
                                                      //   familiy:
                                                      //       'SourceSansPro',
                                                      //   11,
                                                      //   const Color(0xFF5A5C60),
                                                      //   maxLines: 3,
                                                      //   height: 1.5,
                                                      // ),
                                                    ]),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 8,
                                          ),
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 7),
                                                child: SvgPicture.asset(
                                                  'assets/svg/salary.svg',
                                                ),
                                              ),
                                              const SizedBox(
                                                width: 10,
                                              ),
                                              Expanded(
                                                child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: const [
                                                      ///TODO: BELUM DIHANDLE
                                                      // AppText.labelW700(
                                                      //   'Rp${substractGaji(_lcC.jrc.value.data!.minGaji!)} - ${substractGaji(_lcC.jrc.value.data!.maxGaji!)} juta',
                                                      //   familiy:
                                                      //       'SourceSansPro',
                                                      //   13,
                                                      //   kNewBlack1,
                                                      //   maxLines: 3,
                                                      //   height: 1.5,
                                                      // ),
                                                      // AppText.labelW400(
                                                      //   'Rata-rata gaji sebagai ${_lcC.jrc.value.data!.subCategory}',
                                                      //   familiy:
                                                      //       'SourceSansPro',
                                                      //   11,
                                                      //   const Color(0xFF5A5C60),
                                                      //   maxLines: 3,
                                                      //   height: 1.5,
                                                      // ),
                                                    ]),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 12,
                                          ),
                                        ],
                                      ),

                                      // if (_courseC.detailCourse.value
                                      //     .ygAkanDipelajariWeb!.isNotEmpty)
                                      //   CardWithIconForDescription(
                                      //       'Yang Akan Dipelajari',
                                      //       _courseC.detailCourse.value
                                      //           .ygAkanDipelajariWeb),
                                      // const SizedBox(height: 22),
                                      // if (_courseC.detailCourse.value
                                      //     .skillYgAkanDiperolehWeb!.isNotEmpty)
                                      //   CardForDescription(
                                      //       'Skill yang Akan Diperoleh',
                                      //       _courseC.detailCourse.value
                                      //           .skillYgAkanDiperolehWeb!,
                                      //       kNewBlack6)
                                    ],
                                  ),
                                )),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
