import 'package:ark_module_regular/src/domain/entities/my_course_entity.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

import 'ark_finished_course_card.dart';

class ArkTabCourseFinished extends StatelessWidget {
  const ArkTabCourseFinished({
    Key? key,
    required this.listCourse,
    required this.onRefresh,
    required this.isLoading,
  }) : super(key: key);

  final List<MyCourseEntity> listCourse;
  final VoidCallback onRefresh;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        onRefresh();
        await Future.delayed(const Duration(seconds: 1));
      },
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: isLoading
            ? SingleChildScrollView(
                child: Column(
                  children: List.generate(
                    3,
                    (index) => Shimmer.fromColors(
                      baseColor: Colors.grey[300]!,
                      highlightColor: Colors.grey[100]!,
                      child: Container(
                        margin: const EdgeInsets.symmetric(vertical: 8),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          color: Colors.grey,
                        ),
                        height: 125,
                        width: Get.width,
                      ),
                    ),
                  ),
                ),
              )
            : ListView(
                children: List.generate(
                  listCourse.length,
                  (index) => ArkFinishedCourseCard(
                    course: listCourse[index],
                    isExpired: false,
                  ),
                ),
              ),
      ),
    );
  }
}
