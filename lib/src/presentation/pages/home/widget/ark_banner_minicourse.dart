import 'package:ark_module_regular/ark_module_regular.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ark_module_regular/utils/app_constanta_list.dart';
import 'package:ark_module_regular/utils/app_route_name.dart';
import 'package:ark_module_regular/utils/app_color.dart';

class ArkBannerMiniCourse extends StatelessWidget {
  ArkBannerMiniCourse({Key? key}) : super(key: key);

  final _homeC = Get.find<ArkHomeController>();

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
                onTap: () => Get.toNamed(AppRouteName.minicourse),
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
          onTap: () => _homeC.postGameBase("gamee"),
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
                onTap: () => _homeC.postGameBase(cardBase[i]['subtitle']!,
                    cardbaseUrl: cardBase[i]['link']),
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
