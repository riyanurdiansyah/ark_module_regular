import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinch_zoom/pinch_zoom.dart';

class ArkSertifikatShowPage extends StatelessWidget {
  const ArkSertifikatShowPage({
    Key? key,
    required this.url,
    required this.tag,
  }) : super(key: key);

  final String url;
  final String tag;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Scaffold(
        body: Center(
          child: Hero(
            tag: tag,
            child: PinchZoom(
              child: Image.network(
                url,
              ),
            ),
          ),
        ),
      ),
      onTap: () => Get.back(),
    );
  }
}
