import 'package:ark_module_regular/ark_module_regular.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:ark_module_regular/utils/app_route_name.dart';
import 'package:ark_module_regular/utils/app_color.dart';

class ArkActiveCourseCard extends StatelessWidget {
  const ArkActiveCourseCard({
    Key? key,
    required this.isExpired,
    required this.course,
  }) : super(key: key);

  final bool isExpired;
  final MyCourseEntity course;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 4),
      width: Get.width,
      child: Card(
        elevation: isExpired ? 0 : 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
        color: isExpired ? const Color(0xffF1F2F4) : Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.only(
                    left: 12,
                    top: 12,
                    bottom: 12,
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(4),
                    child: CachedNetworkImage(
                      imageUrl: course.featuredImage,
                      height: Get.size.shortestSide < 600 ? 75 : 140,
                      width: Get.size.shortestSide < 600 ? 75 : 140,
                      color: isExpired ? kNewBlack5a : Colors.transparent,
                      colorBlendMode: BlendMode.color,
                      fit: BoxFit.cover,
                      errorWidget: (_, __, ___) => const ErrorImageWidget(
                        isImage: false,
                      ),
                      placeholder: (_, __) => Container(
                        height: Get.size.shortestSide < 600 ? 75 : 140,
                        width: Get.size.shortestSide < 600 ? 75 : 140,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                          borderRadius: BorderRadius.circular(6),
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 13,
                        ),
                        Container(
                          height: course.sesiKonsultasi == '' ? 75 : 33,
                          // color: Colors.blue,
                          alignment: course.sesiKonsultasi == ''
                              ? Alignment.centerLeft
                              : Alignment.bottomLeft,
                          child: Text(
                            course.name,
                            style: const TextStyle(
                              color: kNewBlack1,
                              fontWeight: FontWeight.w700,
                              // fontSize: Get.size.shortestSide < 600 ? 11 : 14,
                              fontSize: 10,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        if (course.sesiKonsultasi != '')
                          RichText(
                            text: TextSpan(
                              text: 'sesi konsultasi: ',
                              style: const TextStyle(
                                  fontFamily: 'SourceSansPro',
                                  color: Color(0xff5A5C60),
                                  fontSize: 11),
                              children: [
                                TextSpan(
                                  text: course.sesiKonsultasi,
                                  style: const TextStyle(
                                    color: Color(0xff5A5C60),
                                  ),
                                ),
                              ],
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 6,
            ),
            Container(
              color: const Color(0xffE3E5E9),
              width: Get.width,
              height: 2,
              child: LayoutBuilder(
                builder: (context, constraint) => Flex(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  direction: Axis.horizontal,
                  children: List.generate(
                    (constraint.constrainWidth() / 8).floor(),
                    (index) => const SizedBox(
                      width: 4,
                      height: 2,
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                right: 14,
                bottom: 15,
                top: 10,
                left: 12,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          DateTime.fromMicrosecondsSinceEpoch(
                                          int.parse(course.userExpiry) *
                                              1000000)
                                      .difference(DateTime.now())
                                      .inDays >
                                  900
                              ? 'Tak Terbatas'
                              : DateTime.fromMicrosecondsSinceEpoch(
                                              int.parse(course.userExpiry) *
                                                  1000000)
                                          .difference(DateTime.now())
                                          .inDays <=
                                      0
                                  ? 'Waktu akses habis'
                                  : 'Waktu tersisa ${DateTime.fromMicrosecondsSinceEpoch(int.parse(course.userExpiry) * 1000000).difference(DateTime.now()).inDays} hari',
                          style: const TextStyle(
                            fontFamily: 'SourceSansPro',
                            color: Color(0xff94969B),
                            fontSize: 10,
                          ),
                        ),
                        const SizedBox(
                          height: 6,
                        ),
                        LinearPercentIndicator(
                          padding: EdgeInsets.zero,
                          barRadius: const Radius.circular(2),
                          leading: Text(
                            "${double.parse(course.userProgress.toString()).floor()}%    ",
                            style: TextStyle(
                                fontSize: Get.size.shortestSide < 600 ? 10 : 16,
                                color: isExpired
                                    ? const Color.fromRGBO(152, 152, 152, 0.9)
                                    : course.userProgress == '0'
                                        ? kNewBlack2a
                                        : const Color(0xff333539),
                                fontWeight: FontWeight.w800),
                          ),
                          lineHeight: Get.size.shortestSide < 600 ? 7 : 12,
                          percent: double.parse(course.userProgress) / 100,
                          progressColor: isExpired
                              ? const Color.fromRGBO(152, 152, 152, 0.9)
                              : const Color(0xff1B91D9),
                          backgroundColor:
                              const Color.fromRGBO(229, 230, 233, 1),
                        ),
                        // const SizedBox(height: 2),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 14,
                      ),
                      child: isExpired != true
                          ? ButtonReusableWidget(
                              isOutlinedButton: false,
                              onPressed: () {
                                // _lCC.fetchDetailClass(course.id);
                                // expiry == true
                                //     ? Get.to(() => const CheckoutPage())
                                //     : Get.to(() => const ClassPage());
                              },
                              borderRadius: BorderRadius.circular(5),
                              padding: const EdgeInsets.symmetric(
                                vertical: 12,
                              ),
                              isGradient: const LinearGradient(
                                end: Alignment.bottomRight,
                                begin: Alignment.topLeft,
                                colors: [],
                              ),
                              widget: Center(
                                child: Text(
                                  course.userStatus == "1"
                                      ? "Mulai Pelatihan"
                                      : "Lanjutkan",
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 12,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            )
                          : ButtonReusableWidget(
                              isOutlinedButton: true,
                              onPressed: () async {
                                Get.toNamed(
                                  AppRouteName.arkCourse,
                                  arguments: course,
                                );
                              },
                              borderSide: MaterialStateProperty.all(
                                const BorderSide(
                                  width: 1,
                                  color: Color(0xff0977BE),
                                ),
                              ),
                              //  shapeOutline: MaterialStateProperty.all(BorderRadius.c,
                              widget: Center(
                                child: Text(
                                  isExpired ? "Perpanjang" : "Lanjutkan",
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 12,
                                    color: Color(0xff0977BE),
                                  ),
                                ),
                              ),
                            ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
