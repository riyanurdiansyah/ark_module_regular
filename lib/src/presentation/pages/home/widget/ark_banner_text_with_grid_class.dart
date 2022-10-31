import 'package:ark_module_setup/ark_module_setup.dart';
import 'package:ark_module_setup/utils/app_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ArkBannerTextWithGridClass extends StatelessWidget {
  const ArkBannerTextWithGridClass({
    Key? key,
    required this.title,
    this.imageTitle,
    this.subtitle,
    this.isMore = false,
    this.more,
    required this.listCourse,
    required this.isLoading,
  }) : super(key: key);

  final String? imageTitle;
  final Widget? subtitle;
  final bool isMore;
  final VoidCallback? more;
  final String title;
  final List<CourseParseEntity> listCourse;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Row(
            children: [
              if (imageTitle != null)
                Padding(
                  padding: const EdgeInsets.only(right: 6),
                  child: Image.asset(
                    "assets/images/$imageTitle",
                    width: 30,
                  ),
                ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title,
                      style: const TextStyle(
                          fontSize: 17, fontWeight: FontWeight.w800)
                      //Theme.of(context).textTheme.headline1,
                      ),
                  if (subtitle != null) subtitle!,
                ],
              ),
              const Spacer(),
              if (isMore)
                InkWell(
                  onTap: more,
                  child: Text(
                    'Lihat Semua',
                    style: TextStyle(
                      fontWeight: FontWeight.w800,
                      fontSize: Get.size.shortestSide < 600 ? 12 : 19,
                      color: kPrimaryColor,
                    ),
                  ),
                )
            ],
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        if (isLoading)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14),
            child: Wrap(
              spacing: 8,
              runSpacing: 4,
              children: List.generate(
                6,
                (index) => AppShimmer.loadImage(Get.size.width * 0.44, 200),
              ),
            ),
          ),
        if (!isLoading)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Wrap(
              spacing: 3,
              runSpacing: 4,
              children: List.generate(
                listCourse.length < 6 ? listCourse.length : 6,
                (index) => ArkClassCard(
                  course: listCourse[index].course,
                ),
              ),
            ),
          ),
      ],
    );
  }
}
