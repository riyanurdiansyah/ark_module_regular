import 'package:ark_module_regular/ark_module_regular.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:ark_module_regular/utils/app_route_name.dart';
import 'package:ark_module_regular/utils/app_color.dart';

class ArkBlogCard extends StatelessWidget {
  const ArkBlogCard({
    Key? key,
    required this.blogs,
  }) : super(key: key);

  final BlogEntity blogs;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      width: double.infinity,
      height: Get.size.shortestSide < 600 ? 85 : 140,
      child: GestureDetector(
        onTap: () => Get.toNamed(AppRouteName.blogDetail, arguments: blogs),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: blogs.featuredImg.isNotEmpty
                  ? CachedNetworkImage(
                      imageUrl: blogs.featuredImgApp == ''
                          ? blogs.featuredImg
                          : blogs.featuredImgApp,
                      fit: BoxFit.cover,
                      width: 85,
                      height: 85,
                      errorWidget: (_, __, ___) {
                        return Container(
                          width: 85,
                          height: 85,
                          color: kPrimaryColorNew,
                          child: Image.asset(
                            'assets/images/logo-arkademi.png',
                            fit: BoxFit.fill,
                          ),
                        );
                      },
                      placeholder: (_, __) => Container(
                        width: 85,
                        height: 85,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                          borderRadius: BorderRadius.circular(6),
                        ),
                      ),
                    )
                  : Container(
                      height: 85,
                      width: 85,
                      color: kPrimaryColorNew,
                      child: Image.asset(
                        'assets/images/logo-arkademi.png',
                        fit: BoxFit.fill,
                      ),
                    ),
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 6,
                  ),
                  Text(
                    blogs.title.rendered,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 11,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        "Oleh: ",
                        style: TextStyle(
                          fontSize: 11,
                          color: kNewBlack2b,
                          fontWeight: FontWeight.w600,
                          fontFamily: "SourceSansPro",
                        ),
                      ),
                      Text(
                        blogs.authorName,
                        style: const TextStyle(
                          fontSize: 11,
                          color: kNewBlack2b,
                          fontWeight: FontWeight.w600,
                          fontFamily: "SourceSansPro",
                        ),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          bottom: 5,
                        ),
                        child: Text(
                          ".",
                          style: TextStyle(
                            fontSize: 11,
                            color: Colors.grey.shade400,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Text(
                        DateFormat('dd MMMM yyyy').format(
                          blogs.date,
                        ),
                        style: const TextStyle(
                          fontSize: 11,
                          color: kNewBlack3,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
