import 'package:ark_module_regular/src/presentation/pages/home/widget/ark_blog_card.dart';
import 'package:ark_module_setup/ark_module_setup.dart';
import 'package:ark_module_setup/utils/app_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ArkBannerBlog extends StatelessWidget {
  const ArkBannerBlog({
    Key? key,
    required this.blogs,
    required this.isLoading,
  }) : super(key: key);

  final List<BlogEntity> blogs;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Blog",
                style: TextStyle(
                  fontSize: Get.size.shortestSide < 600 ? 18 : 25,
                  fontWeight: FontWeight.w800,
                  color: kNewBlack1,
                ),
              ),
              GestureDetector(
                onTap: () =>
                    Get.toNamed(AppRouteName.blogAll, arguments: blogs),
                child: Text(
                  'Lihat Semua',
                  style: TextStyle(
                    fontWeight: FontWeight.w800,
                    fontSize: Get.size.shortestSide < 600 ? 11 : 20,
                    color: const Color.fromRGBO(43, 160, 231, 1),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          if (isLoading) AppShimmer.loadBannerBlog(),
          if (!isLoading)
            Column(
              children: List.generate(
                blogs.length > 5 ? 5 : blogs.length,
                (index) => ArkBlogCard(
                  blogs: blogs[index],
                ),
              ),
            )
        ],
      ),
    );
  }
}
