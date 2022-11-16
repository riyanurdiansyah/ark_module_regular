import 'package:ark_module_regular/ark_module_regular.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ark_module_regular/utils/app_constanta_list.dart';
import 'package:ark_module_regular/utils/app_color.dart';

class ArkNotificationPage extends StatelessWidget {
  ArkNotificationPage({Key? key}) : super(key: key);

  final _notifC = Get.find<ArkNotificationController>();

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
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(14),
            child: Row(
              children: [
                Row(
                  children: List.generate(
                    notificationStatus.length,
                    (i) => Obx(
                      () => GestureDetector(
                        onTap: () => _notifC.changeSelectedIndex(i),
                        child: Container(
                          decoration: BoxDecoration(
                              color: _notifC.indexSelected.value == i
                                  ? kPrimaryColor
                                  : Colors.transparent,
                              borderRadius: BorderRadius.circular(4),
                              border: Border.all(color: kNewBlack4)),
                          margin: const EdgeInsets.only(right: 5),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 5.5, vertical: 5),
                          child: Text(
                            notificationStatus[i],
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: _notifC.indexSelected.value == i
                                  ? Colors.white
                                  : kNewBlack4,
                              fontSize: 10,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: InkWell(
                    onTap: () async {},
                    child: const Text(
                      'Tandai sudah dibaca',
                      style: TextStyle(
                        fontSize: 11,
                        color: kPrimaryColor,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
