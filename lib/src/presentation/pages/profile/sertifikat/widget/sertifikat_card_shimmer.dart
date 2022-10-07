import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

class SertifikatCardShimmer extends StatelessWidget {
  const SertifikatCardShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Shimmer.fromColors(
          baseColor: Colors.grey[300]!,
          highlightColor: Colors.grey[100]!,
          child: Container(
            width: Get.width / 1.4,
            color: Colors.grey,
            height: 235,
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        Shimmer.fromColors(
          baseColor: Colors.grey[300]!,
          highlightColor: Colors.grey[100]!,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(8),
            ),
            width: Get.width / 1.2,
            height: 26,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
