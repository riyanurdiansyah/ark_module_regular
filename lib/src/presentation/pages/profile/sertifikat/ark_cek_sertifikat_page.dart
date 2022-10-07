import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class ArkCekSertifikatPage extends StatelessWidget {
  const ArkCekSertifikatPage({Key? key, required this.uriDeeplink})
      : super(key: key);

  final Uri uriDeeplink;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            InAppWebView(
              initialOptions: InAppWebViewGroupOptions(
                  android: AndroidInAppWebViewOptions(),
                  ios: IOSInAppWebViewOptions()),
              initialUrlRequest: URLRequest(
                url: uriDeeplink,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
