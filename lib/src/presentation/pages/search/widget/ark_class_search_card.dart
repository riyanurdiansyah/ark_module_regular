import 'package:ark_module_regular/src/domain/entities/course_entity.dart';
import 'package:ark_module_setup/ark_module_setup.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ArkClassSearchCard extends StatelessWidget {
  const ArkClassSearchCard({
    Key? key,
    required this.course,
  }) : super(key: key);

  final CourseParseEntity course;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(5),
            child: CachedNetworkImage(
              imageUrl: course.course.featuredImage,
              width: 65,
              height: 65,
              fit: BoxFit.fill,
              placeholder: (_, __) => Container(
                height: 65,
                width: 65,
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(6),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: Get.size.width * 0.65,
                  child: Text(
                    course.course.name,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 12.5,
                        height: 1.3),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: Row(
                    children: [
                      Icon(Icons.star, size: 14, color: Colors.yellow[700]),
                      Text(
                        course.course.averageRating.toString() == '0'
                            ? '5.0'
                            : course.course.averageRating.toString(),
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: kNewBlack2b,
                          fontSize: Get.size.shortestSide < 600 ? 12 : 15,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
