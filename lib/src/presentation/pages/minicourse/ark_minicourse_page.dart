import 'package:ark_module_regular/ark_module_regular.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ark_module_regular/utils/app_constanta_list.dart';
import 'package:ark_module_regular/utils/app_color.dart';

class ArkMiniCoursePage extends StatelessWidget {
  ArkMiniCoursePage({Key? key}) : super(key: key);

  final _homeC = Get.find<ArkHomeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Mini Course',
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 15, color: kNewBlack2a),
        ),
        titleSpacing: 0,
        iconTheme: const IconThemeData(color: kNewBlack2a),
        backgroundColor: kCanvasColor,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 12),
                child: Text(
                  'Game Based Learning',
                  style: TextStyle(
                      color: kNewBlack1,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Montserrat'),
                ),
              ),
              GestureDetector(
                onTap: () => _homeC.postGameBase("gamee"),
                child: Card(
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                  child: Image.asset(
                    'assets/images/cardbase_gamee.png',
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              const SizedBox(height: 4),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 12),
                child: Text(
                  'Card Based Learning',
                  style:
                      TextStyle(color: kNewBlack1, fontWeight: FontWeight.bold),
                ),
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: List.generate(
                  cardBase.length,
                  (i) => Padding(
                    padding: const EdgeInsets.only(bottom: 5),
                    child: GestureDetector(
                      onTap: () => _homeC.postGameBase(cardBase[i]['subtitle']!,
                          cardbaseUrl: cardBase[i]['link']),
                      child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)),
                        elevation: 3,
                        child: Image.asset(
                          cardBase[i]['image_long']!,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
