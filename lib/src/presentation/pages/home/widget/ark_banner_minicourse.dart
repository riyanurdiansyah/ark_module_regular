import 'package:ark_module_setup/ark_module_setup.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ArkMiniCourse extends StatelessWidget {
  const ArkMiniCourse({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: Get.width,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            children: [
              const Text(
                "Mini Course",
                style: TextStyle(
                  color: kNewBlack1,
                  fontSize: 19,
                  fontWeight: FontWeight.w800,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Image.asset(
                'assets/images/cardbase_new.png',
                height: 18,
              ),
              const SizedBox(
                width: 4,
              ),
              Image.asset(
                'assets/images/icon-gratis-cpns.png',
                height: 18,
              ),
              const Spacer(),
              GestureDetector(
                onTap: () {},
                child: Text(
                  'Lihat Semua',
                  style: TextStyle(
                    fontWeight: FontWeight.w800,
                    fontSize: Get.size.shortestSide < 600 ? 11 : 20,
                    color: kPrimaryColorNew,
                  ),
                ),
              )
            ],
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        GestureDetector(
          onTap: () {
            // SystemChrome.setPreferredOrientations([
            //   DeviceOrientation.landscapeRight,
            //   DeviceOrientation.landscapeLeft,
            // ]);
            // http.post(Uri.parse(
            //     'https://us-central1-arkademi-flutter-v201.cloudfunctions.net/app/cardbase/?cardbase=gamee&email=${_aC.email.value}'));
            // Future.delayed(
            //     const Duration(seconds: 1),
            //     () => Get.to(
            //           () => GameBasedWebView('https://game.arkd.me'),
            //         ));
          },
          child: Card(
            margin: const EdgeInsets.symmetric(horizontal: 18),
            elevation: 3,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            child: Image.asset(
              'assets/images/cardbase_gamee.png',
              fit: BoxFit.fill,
            ),
          ),
        ),
        const SizedBox(
          height: 4,
        ),
        SizedBox(
          height: 120,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 18),
            itemBuilder: (ctx, i) {
              return GestureDetector(
                onTap: () {},
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                  elevation: 3,
                  margin: i == 2
                      ? EdgeInsets.zero
                      : const EdgeInsets.only(right: 10),
                  child: Image.asset(
                    cardBase[i]['image']!,
                    fit: BoxFit.fill,
                  ),
                ),
              );
            },
            itemCount: cardBase.length,
          ),
        ),
      ],
    );
  }
}
