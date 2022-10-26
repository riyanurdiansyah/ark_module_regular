import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:get/get.dart';

class ArkMiniCourseWebviewPage extends StatelessWidget {
  ArkMiniCourseWebviewPage({
    Key? key,
    required this.url,
  }) : super(key: key);

  final String url;
  final Rx<bool> _isLoading = false.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          InAppWebView(
            initialOptions: InAppWebViewGroupOptions(
                android: AndroidInAppWebViewOptions(),
                ios: IOSInAppWebViewOptions()),
            initialUrlRequest: URLRequest(
              url: Uri.parse(url),
            ),
            onWebViewCreated: (_) => _isLoading.value = true,
            onLoadStop: (_, __) => _isLoading.value = false,
          ),
          Obx(
            () => _isLoading.value
                ? const Center(child: CircularProgressIndicator())
                : const SizedBox(),
          )
        ],
      ),
    );
  }
}
