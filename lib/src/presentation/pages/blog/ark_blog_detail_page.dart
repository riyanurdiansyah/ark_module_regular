import 'package:ark_module_setup/ark_module_setup.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

class ArkBlogDetailPage extends StatelessWidget {
  const ArkBlogDetailPage({
    Key? key,
    required this.blog,
  }) : super(key: key);

  final BlogEntity blog;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        titleSpacing: 0,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF0977BE), Color(0xFF139DD6)],
            ),
          ),
        ),
        title: const Text(
          "Blog",
          style: TextStyle(
            fontSize: 15.5,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(blog.title.rendered,
                  style: const TextStyle(
                      height: 1.3, fontSize: 21, fontWeight: FontWeight.w800)),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15, bottom: 20, left: 20),
              child: RichText(
                  text: TextSpan(
                      text: '${blog.authorName} ',
                      style: const TextStyle(
                        color: kNewBlack3,
                        fontFamily: 'SourceSansPro',
                        fontWeight: FontWeight.bold,
                        fontSize: 13,
                      ),
                      children: [
                    TextSpan(
                        style: const TextStyle(fontWeight: FontWeight.w400),
                        text:
                            ' • ${DateFormat('MMM d, yyyy', "id_ID").format(blog.date)}')
                  ])),
            ),
            blog.featuredImg != null
                ? Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(14),
                      child: Image.network(
                        blog.featuredImg,
                        fit: BoxFit.fitWidth,
                        width: Get.width,
                      ),
                    ),
                  )
                : Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    width: Get.width,
                    height: 240,
                    decoration: BoxDecoration(
                      color: kPrimaryBlue4,
                      borderRadius: BorderRadius.circular(10),
                      image: const DecorationImage(
                        image: AssetImage(
                          'assets/images/logo-arkademi.png',
                        ),
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
            const SizedBox(
              height: 10,
            ),
            blog.isBlank!
                ? const Align(
                    alignment: Alignment.center,
                    child: CircularProgressIndicator())
                : Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Html(
                        onLinkTap: (url, __, ___, ____) => launchUrl(
                            Uri.parse(url!),
                            mode: LaunchMode.externalApplication),
                        data: blog.content.rendered,
                        style: {
                          'html': Style(
                              fontFamily: 'SourceSansPro',
                              fontSize: const FontSize(15),
                              color: kNewBlack2b,
                              lineHeight: const LineHeight(1.5)),
                          'h2': Style(
                              fontFamily: 'Montserrat',
                              color: kNewBlack2a,
                              fontWeight: FontWeight.w800,
                              fontSize: const FontSize(18)),
                        },
                        customRender: {
                          'div': (context, wid) {
                            return context.tree.attributes['class']!
                                    .contains('wp-container')
                                ? Container()
                                : null;
                          },
                          'a': (context, widget) {
                            if (context.tree.attributes['href'] != null &&
                                context.tree.attributes['href']!
                                    .contains('https://play.google.com/')) {
                              return const Text(' aplikasi');
                            }
                          },
                          'flutter': (_, htmlWidget) {
                            return Container(
                              margin:
                                  const EdgeInsets.only(top: 10, bottom: 10),
                              width: double.infinity,
                              height: 45,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(7)),
                                  primary: const Color(0xFFFF8017),
                                ),
                                child: Text(
                                  _.tree.attributes['button']!,
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                                onPressed: () async {
                                  // mixpanel!.track(
                                  //   'atc Button click form blog detail',
                                  // );
                                  // AppFirebaseAnalyticsService()
                                  //     .addLog("atc_btnmblclickcta");
                                  // // go to coupons page if the atributes of button contains KUPON
                                  // _.tree.attributes['button']!.contains('KUPON')
                                  //     ? Get.to(() => CouponListPage())
                                  //     : null;
                                },
                              ),
                            );
                          }
                        },
                        tagsList: Html.tags..addAll(["flutter"])),
                  ),
          ],
        ),
      ),
    );
  }
}
