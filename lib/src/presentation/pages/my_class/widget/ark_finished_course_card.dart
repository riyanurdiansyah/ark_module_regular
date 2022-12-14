import 'package:ark_module_regular/ark_module_regular.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:ark_module_regular/utils/app_color.dart';

class ArkFinishedCourseCard extends StatelessWidget {
  const ArkFinishedCourseCard({
    Key? key,
    required this.course,
    required this.isExpired,
  }) : super(key: key);

  final MyCourseEntity course;
  final bool isExpired;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // _lCC.fetchDetailClass(course.id);
        // Get.to(() => const ClassPage());
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 4),
        width: Get.width,
        child: Card(
          elevation: isExpired == true ? 0 : 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
          color: isExpired == true ? const Color(0xffF1F2F4) : Colors.white,
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
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 55,
                          alignment: Alignment.centerLeft,
                          margin: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 12,
                          ),
                          child: Text(
                            course.name,
                            style: const TextStyle(
                              color: kNewBlack1,
                              fontWeight: FontWeight.w700,

                              // fontSize: Get.size.shortestSide < 600 ? 11 : 14,
                              fontSize: 10,
                            ),
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
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
                                    : 'Waktu tersisa $isExpired hari',
                            style: const TextStyle(
                              fontFamily: 'SourceSansPro',
                              color: Color(0xff94969B),
                              fontSize: 10,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          LinearPercentIndicator(
                            padding: EdgeInsets.zero,
                            leading: Text(
                              "100%    ",
                              style: TextStyle(
                                  fontSize:
                                      Get.size.shortestSide < 600 ? 10 : 16,
                                  color: isExpired == true
                                      ? const Color.fromRGBO(152, 152, 152, 0.9)
                                      : course.userProgress == '0'
                                          ? kNewBlack2a
                                          : const Color(0xff333539),
                                  fontWeight: FontWeight.w800),
                            ),
                            lineHeight: Get.size.shortestSide < 600 ? 7 : 12,
                            percent: 1.0,
                            progressColor: isExpired == true
                                ? const Color.fromRGBO(152, 152, 152, 0.9)
                                : const Color(0xff1B91D9),
                            backgroundColor:
                                const Color.fromRGBO(229, 230, 233, 1),
                            barRadius: const Radius.circular(2),
                          ),
                          const SizedBox(height: 6),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
