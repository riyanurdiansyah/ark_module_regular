import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ark_module_regular/utils/app_route_name.dart';

class ArkBannerPreparationTest extends StatelessWidget {
  const ArkBannerPreparationTest({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Preparation Test',
            style: TextStyle(fontSize: 17, fontWeight: FontWeight.w800),
          ),
          const SizedBox(height: 10),
          // const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () => Get.toNamed(AppRouteName.cpns),
                child: SizedBox(
                  height: 110,
                  width: Get.size.width * 0.46 - 10,
                  child: Card(
                      margin: EdgeInsets.zero,
                      elevation: 2,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.asset(
                              'assets/images/image-cpns.png',
                              fit: BoxFit.fill,
                              height: 110,
                              width: Get.size.width * 0.47,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(15),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: const [
                                Text('CPNS',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18)),
                                SizedBox(height: 2),
                                Text('3 Paket Tes',
                                    style: TextStyle(
                                        fontSize: 13,
                                        fontFamily: 'SourceSansPro'))
                              ],
                            ),
                          ),
                        ],
                      )),
                ),
              ),
              GestureDetector(
                onTap: () {
                  // mixpanel!.track('atc card pppk clicked');
                  // AppFirebaseAnalyticsService()
                  //     .addLog('atc_cardmblclickpppk');
                  // AppPrint.debugPrint("PPPK");
                  // if (_sp.isLogin.isTrue) {
                  //   Get.toNamed(AppRouteName.pppk);
                  // } else {
                  //   Get.toNamed(AppRouteName.auth);
                  // }
                },
                child: Stack(
                  children: [
                    SizedBox(
                      height: 110,
                      width: Get.size.width * 0.46 - 10,
                      child: Card(
                        elevation: 2,
                        margin: EdgeInsets.zero,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Stack(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Image.asset(
                                'assets/images/image-pppk.png',
                                fit: BoxFit.fill,
                                height: 110,
                                width: Get.width * 0.47,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(15),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: const [
                                  Text(
                                    'PPPK',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),
                                  ),
                                  SizedBox(height: 2),
                                  Text(
                                    '11 Paket Tes',
                                    style: TextStyle(
                                        fontFamily: 'SourceSansPro',
                                        fontSize: 13),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      width: 70,
                      height: 22,
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Color.fromRGBO(255, 129, 17, 1),
                            Color.fromRGBO(255, 141, 22, 1),
                            Color.fromRGBO(255, 184, 39, 1),
                          ],
                        ),
                        borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(10),
                          topLeft: Radius.circular(5),
                        ),
                      ),
                      child: const Center(
                        child: Text(
                          "Diskon 100%",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 8.5,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
