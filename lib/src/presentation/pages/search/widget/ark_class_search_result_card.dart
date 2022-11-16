import 'package:ark_module_regular/src/domain/entities/course_entity.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ark_module_regular/utils/app_color.dart';
import 'package:ark_module_regular/utils/app_constanta.dart';

class ArkClassSearchResultCard extends StatelessWidget {
  const ArkClassSearchResultCard({
    Key? key,
    required this.course,
  }) : super(key: key);

  final CourseParseEntity course;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // _lCC.fetchDetailClass(course.course!.id,
        //     useGetBack: true);
        // // _classController
        // //     .fetchDetailClass(course.course!.id);
        // Get.to(() => const ClassPage(useGetBack: true));
      },
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        margin: const EdgeInsets.only(bottom: 10),
        child: SizedBox(
          height: 112,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(6),
                  child: CachedNetworkImage(
                    imageUrl: course.course.featuredImage,
                    placeholder: (context, _) => Container(
                      color: Colors.grey[200],
                      width: 96,
                      height: 96,
                    ),
                    width: 96,
                    height: 96,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.only(
                      top: 8, bottom: 8, right: 10, left: 4),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              course.course.instructor.name,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                  fontSize: 10,
                                  color: kNewBlack3,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Icon(Icons.star, size: 14, color: Colors.yellow[700]),
                          Text(
                            course.course.averageRating.toString() == '0'
                                ? ' 5'
                                : ' ${course.course.averageRating.toString()}',
                            style: TextStyle(
                              color: kNewBlack2a,
                              fontWeight: FontWeight.bold,
                              fontSize: Get.size.shortestSide < 600 ? 11.5 : 15,
                            ),
                          ),
                          Text(
                            course.course.totalStudents > 1000
                                ? ' (>1000)'
                                : course.course.totalStudents > 100
                                    ? ' (>100)'
                                    : " (${course.course.totalStudents})",
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: kNewBlack2b,
                                fontSize:
                                    Get.size.shortestSide < 600 ? 11 : 15),
                          ),
                          const SizedBox(height: 6),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 4, bottom: 8),
                        child: Text(
                          course.course.name,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 11),
                        ),
                      ),
                      const Spacer(),
                      course.course.salePrice == '0'
                          ? Text(
                              currencyFormatter.format(
                                  int.parse(course.course.regularPrice)),
                              style: const TextStyle(
                                  fontWeight: FontWeight.w800,
                                  color: kNewBlack2a,
                                  fontSize: 12.5),
                            )
                          : Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 2, horizontal: 4),
                                      decoration: BoxDecoration(
                                          color: kPrimaryRed4,
                                          borderRadius:
                                              BorderRadius.circular(4)),
                                      child: Text(
                                        '${course.course.discount.floor()}%',
                                        style: const TextStyle(
                                            color: kPrimaryRed2,
                                            fontSize: 9.5,
                                            fontWeight: FontWeight.w800),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      currencyFormatter.format(int.parse(
                                          course.course.regularPrice)),
                                      style: const TextStyle(
                                          decoration:
                                              TextDecoration.lineThrough,
                                          fontWeight: FontWeight.w500,
                                          color: kNewBlack3,
                                          fontSize: 8),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 4,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      currencyFormatter.format(
                                          int.parse(course.course.salePrice)),
                                      style: const TextStyle(
                                          fontWeight: FontWeight.w800,
                                          color: kNewBlack2a,
                                          fontSize: 12.5),
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
                                            ' +${numberFormat.format(int.parse(course.course.coinCashback))}',
                                            style: const TextStyle(
                                              fontSize: 8,
                                              color: Color(
                                                0xFF838589,
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                      const SizedBox(height: 5),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
