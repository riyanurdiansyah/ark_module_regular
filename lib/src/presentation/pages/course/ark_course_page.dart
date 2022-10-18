import 'package:ark_module_regular/ark_module_regular.dart';
import 'package:ark_module_regular/src/presentation/pages/course/widget/ark_row_with_two_widget.dart';
import 'package:ark_module_setup/ark_module_setup.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:connectivity_wrapper/connectivity_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class ArkCoursePage extends StatelessWidget {
  ArkCoursePage({Key? key}) : super(key: key);

  final _courseC = Get.find<ArkCourseController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: kNewBlack2a,
        ),
        titleSpacing: 0,
        backgroundColor: Colors.white,
        title: const Text(
          "Kelas",
          style: TextStyle(
            color: kNewBlack2a,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.share_outlined,
              color: Colors.black,
            ),
          ),
        ],
      ),
      body: ConnectivityWidgetWrapper(
        offlineCallback: () {},
        onlineCallback: () {},
        child: Obx(
          () => Column(
            children: [
              _courseC.isHaveVideo.value && _courseC.splitVid.length > 1
                  ? YoutubePlayerIFrame(
                      controller: _courseC.ytController,
                      aspectRatio: 16 / 9,
                    )
                  : CachedNetworkImage(
                      imageUrl: _courseC.detailCourse.value.featuredImage,
                      width: Get.width,
                      fit: BoxFit.cover,
                      errorWidget: (context, url, error) =>
                          const ErrorImageWidget(
                        isImage: false,
                        height: 200,
                      ),
                    ),
              Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image:
                        AssetImage('assets/images/class_page_background.png'),
                  ),
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 10,
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 6),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 4),
                        child: Text(
                          _courseC.detailCourse.value.name,
                          maxLines: 3,
                          overflow: TextOverflow.fade,
                          softWrap: true,
                          style: TextStyle(
                              fontSize: Get.size.shortestSide < 600 ? 16 : 19,
                              color: Colors.white,
                              fontWeight: FontWeight.w800),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 8,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ArkRowWithWidgetAndString(
                              leftWidget: RatingBar.builder(
                                itemSize:
                                    Get.size.shortestSide < 600 ? 14.5 : 20,
                                ignoreGestures: true,
                                initialRating:
                                    _courseC.detailCourse.value.averageRating ==
                                            '0'
                                        ? 5.0
                                        : double.parse(_courseC
                                            .detailCourse.value.averageRating),
                                allowHalfRating: true,
                                itemPadding:
                                    const EdgeInsets.symmetric(horizontal: 0.2),
                                itemBuilder: (context, _) => const Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                ),
                                onRatingUpdate: (_) {},
                              ),
                              rightString: _courseC
                                          .detailCourse.value.averageRating ==
                                      '0'
                                  ? '5'
                                  : _courseC.detailCourse.value.averageRating,
                            ),
                            Container(
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: ArkRowWithWidgetAndString(
                                leftWidget: Icon(
                                  Icons.person,
                                  color: Colors.white,
                                  size: Get.size.shortestSide < 600 ? 16 : 20,
                                ),
                                rightString: _courseC
                                    .detailCourse.value.totalStudents
                                    .toString(),
                              ),
                            ),
                            ArkRowWithWidgetAndString(
                              expandedRightString: true,
                              leftWidget: Image.network(
                                  _courseC
                                      .detailCourse.value.instructor.avatar.url,
                                  width: 15,
                                  height: 15),
                              rightString:
                                  _courseC.detailCourse.value.instructor.name,
                            )
                          ],
                        ),
                      ),
                      if (_courseC.detailCourse.value.mpLinks.isNotEmpty)
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 5),
                            const Text(
                              'Tersedia juga di ',
                              style: TextStyle(
                                fontSize: 10,
                                color: kNewBlack6,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Wrap(
                              children: List.generate(
                                _courseC.detailCourse.value.mpLinks.length,
                                (i) => InkWell(
                                  child: Card(
                                    margin: const EdgeInsets.only(
                                        top: 3, bottom: 3, right: 5),
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(4)),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 15),
                                      child: CachedNetworkImage(
                                        imageUrl: _courseC.detailCourse.value
                                            .mpLinks[i - 1].mpLogo,
                                        height: 35,
                                        errorWidget: (context, url, error) {
                                          return Image.asset(
                                              'assets/images/logo_pintar_prakerja.png');
                                        },
                                        width: Get.size.width > width360Pixel
                                            ? 81
                                            : Get.size.width > width320Pixel
                                                ? 65
                                                : 50,
                                        placeholder: (context, url) {
                                          return SizedBox(
                                            height: 35,
                                            width: Get.size.width >
                                                    width360Pixel
                                                ? 70
                                                : Get.size.width > width320Pixel
                                                    ? 55
                                                    : 40,
                                          );
                                        },
                                      ),
                                    ),
                                  ),
                                  onTap: () => _courseC.onTapMplinks(i),
                                ),
                              ),
                            ),
                            const SizedBox(height: 10),
                          ],
                        ),
                    ],
                  ),
                ),
              ),
              // Container(
              //   width: Get.size.width,
              //   color: Colors.grey[300],
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.spaceAround,
              //     children: [
              //       ArkTabTitleClassPage(
              //         tabIndex: _courseC.tabIndex,
              //         indexCondition: 0,
              //         title: 'Ikhtisar',
              //       ),
              //       ArkTabTitleClassPage(
              //         tabIndex: _courseC.tabIndex,
              //         indexCondition: 1,
              //         title: 'Kurikulum',
              //       ),
              //       ArkTabTitleClassPage(
              //         tabIndex: _courseC.tabIndex,
              //         indexCondition: 2,
              //         title: 'Ulasan',
              //       ),
              //     ],
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
