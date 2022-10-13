import 'package:ark_module_regular/src/domain/entities/course_entity.dart';
import 'package:ark_module_setup/ark_module_setup.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

class ClassCard extends StatelessWidget {
  const ClassCard({
    Key? key,
    required this.course,
  }) : super(key: key);

  final CourseDataEntity course;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: SizedBox(
        width: Get.size.width * 0.44,
        child: Column(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(5),
                topRight: Radius.circular(5),
              ),
              child: CachedNetworkImage(
                placeholder: (context, url) {
                  return Shimmer.fromColors(
                    baseColor: Colors.grey[300]!,
                    highlightColor: Colors.grey[100]!,
                    child: Container(
                      color: Colors.grey,
                      height: 82,
                    ),
                  );
                },
                fit: BoxFit.fill,
                height: 100,
                width: Get.size.width * 0.48,
                imageUrl: course.featuredImage,
              ),
            ),
            Container(
              height: 140,
              padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 9),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(course.instructor.name,
                      maxLines: 1,
                      style: const TextStyle(
                          color: kNewBlack3,
                          fontSize: 10,
                          fontWeight: FontWeight.bold)),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 2),
                    child: Text(course.name,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                            height: 1.4,
                            color: kNewBlack2a,
                            fontSize: 11,
                            fontWeight: FontWeight.bold)),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Row(
                      children: [
                        Icon(Icons.star,
                            size: Get.size.shortestSide < 600 ? 13 : 15,
                            color: Colors.yellow[700]),
                        Text(
                          course.averageRating == '0'
                              ? '5'
                              : course.averageRating.toString(),
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: kNewBlack2b,
                            fontSize: Get.size.shortestSide < 600 ? 11 : 15,
                          ),
                        ),
                        Text(
                          course.totalStudents > 1000
                              ? ' (>1000)'
                              : course.totalStudents > 100
                                  ? ' (>100)'
                                  : " (${course.totalStudents})",
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: kNewBlack2b,
                              fontSize: Get.size.shortestSide < 600 ? 10 : 15),
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                  course.salePrice == '0'
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              currencyFormatter
                                  .format(int.parse(course.regularPrice)),
                              style: const TextStyle(
                                  color: kNewBlack2a,
                                  fontWeight: FontWeight.w800,
                                  fontSize: 13),
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 4, vertical: 4),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                                color: const Color(0xFFF1F2F4),
                              ),
                              child: Row(
                                children: [
                                  Image.asset(
                                    "assets/images/coins.png",
                                    width: 10,
                                  ),
                                  Text(
                                    currencyFormatter
                                        .format(int.parse(course.coinCashback)),
                                    style: const TextStyle(
                                        color: Color(
                                          0xFF838589,
                                        ),
                                        fontWeight: FontWeight.w500,
                                        fontSize: 8),
                                  ),
                                ],
                              ),
                            )
                          ],
                        )
                      : Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Container(
                                  margin: const EdgeInsets.only(right: 4),
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 2, horizontal: 4),
                                  decoration: BoxDecoration(
                                      color: kPrimaryRed4,
                                      borderRadius: BorderRadius.circular(4)),
                                  child: Text(
                                    '${course.discount.floor()}%',
                                    style: const TextStyle(
                                        color: kPrimaryRed2,
                                        fontSize: 10.5,
                                        fontWeight: FontWeight.w800),
                                  ),
                                ),
                                Text(
                                  currencyFormatter
                                      .format(int.parse(course.regularPrice)),
                                  style: const TextStyle(
                                      decoration: TextDecoration.lineThrough,
                                      fontWeight: FontWeight.w500,
                                      color: kNewBlack3,
                                      fontSize: 10),
                                ),
                              ],
                            ),
                            const SizedBox(height: 3),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  currencyFormatter
                                      .format(int.parse(course.salePrice)),
                                  style: const TextStyle(
                                      color: kNewBlack2a,
                                      fontWeight: FontWeight.w800,
                                      fontSize: 13),
                                ),
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 4, vertical: 4),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(16),
                                    color: const Color(0xFFF1F2F4),
                                  ),
                                  child: Row(
                                    children: [
                                      Image.asset(
                                        "assets/images/coins.png",
                                        width: 10,
                                      ),
                                      Text(
                                        ' +${numberFormat.format(int.parse(course.coinCashback))}',
                                        style: const TextStyle(
                                          fontWeight: FontWeight.w500,
                                          color: Color(
                                            0xFF838589,
                                          ),
                                          fontSize: 8,
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                  const SizedBox(height: 8),
                  // tagPrakerja != '' || offlineDownload == true
                  //     ? Container()
                  //     : const SizedBox(height: 7),
                  // PriceWidgetSmall(price1, price2),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
