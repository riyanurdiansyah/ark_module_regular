import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ArkBannerVersion extends StatelessWidget {
  const ArkBannerVersion({
    Key? key,
    required this.version,
  }) : super(key: key);

  final String version;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        top: 15,
      ),
      padding: const EdgeInsets.only(
        left: 20,
        right: 20,
      ),
      child: Column(
        children: [
          const Divider(
            height: 3,
          ),
          Container(
            height: 20,
          ),
          Text(
            "ARKADEMI V $version",
            style: TextStyle(
              fontSize: Get.width < 600 ? 16 : 26,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            "All rights reserved PT Arkademi Daya Indonesia 2017-2021",
            style: TextStyle(
              fontFamily: 'SourceSansPro',
              fontSize: Get.size.width < 600 ? 12 : 20,
            ),
          ),
          const SizedBox(height: 50),
        ],
      ),
    );
  }
}
