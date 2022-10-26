import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_windowmanager/flutter_windowmanager.dart';
import 'package:get/get.dart';

class ArkGameBasePage extends StatefulWidget {
  const ArkGameBasePage({
    Key? key,
  }) : super(key: key);

  @override
  State<ArkGameBasePage> createState() => _ArkGameBasePageState();
}

class _ArkGameBasePageState extends State<ArkGameBasePage> {
  var isLoading = true.obs;

  Future<void> secure() async {
    await FlutterWindowManager.addFlags(FlutterWindowManager.FLAG_SECURE);
  }

  @override
  void initState() {
    super.initState();
    // if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);
    secure();
  }

  @override
  void dispose() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight]);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: InAppWebView(
          initialOptions: InAppWebViewGroupOptions(
              android: AndroidInAppWebViewOptions(),
              ios: IOSInAppWebViewOptions()),
          initialUrlRequest: URLRequest(
            url: Uri.parse("https://game.arkd.me"),
          ),
        ),
      ),
    );
  }
}
