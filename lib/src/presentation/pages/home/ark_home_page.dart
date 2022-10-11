import 'package:ark_module_setup/ark_module_setup.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class ArkHomePage extends StatelessWidget {
  ArkHomePage({Key? key}) : super(key: key);

  final _spfC = Get.find<ArkSpfController>();

  @override
  Widget build(BuildContext context) {
    const double barHeight = 113.0;
    final double statusbarHeight = MediaQuery.of(context).padding.top;
    return RefreshIndicator(
      onRefresh: () async => false,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size(
            Get.width,
            125,
          ),
          child: Container(
            width: Get.width,
            height: statusbarHeight + barHeight,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xff0977BE),
                  Color(0xff139DD6),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 11,
                  horizontal: 20,
                ),
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Image.asset(
                          'assets/images/Logo-Arkademi-APP.png',
                          height: 30,
                        ),
                        const Spacer(),
                        if (_spfC.isLogin.value)
                          Row(
                            children: [
                              GestureDetector(
                                onTap: () =>
                                    Get.toNamed(AppRouteName.notification),
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      bottom: 2, right: 8, top: 8),
                                  child: SvgPicture.asset(
                                      'assets/images/icon-notif-prakerja.svg',
                                      height: 23),
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              GestureDetector(
                                onTap: () => Get.toNamed(AppRouteName.wishlist),
                                child: const Icon(
                                  CupertinoIcons.heart,
                                  color: Colors.white,
                                  size: 26,
                                ),
                              )
                            ],
                          ),
                      ],
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 10),
                      color: kPrimaryColorNew,
                      child: GestureDetector(
                        onTap: () {
                          // _dC.firstInit.value = true;
                          // Get.to(() => SearchPage(),
                          //     transition: Transition.downToUp);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color: const Color.fromRGBO(241, 242, 244, 1),
                              borderRadius: BorderRadius.circular(5),
                              border:
                                  Border.all(width: 0.2, color: kNewBlack4)),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 9, vertical: 7),
                          child: Row(
                            children: const [
                              Icon(Icons.search, color: kPrimaryColor),
                              SizedBox(width: 4),
                              Text(
                                'Cari kelas',
                                style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w500,
                                  color: kNewBlack3,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: const [],
          ),
        ),
      ),
    );
  }
}
