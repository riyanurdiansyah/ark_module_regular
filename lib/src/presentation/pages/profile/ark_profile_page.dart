import 'package:ark_module_regular/src/presentation/controllers/ark_profile_controller.dart';
import 'package:ark_module_setup/ark_module_setup.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ArkProfilePage extends StatelessWidget {
  ArkProfilePage({
    Key? key,
    // required this.onTapLogout,
  }) : super(key: key);

  final _pC = Get.find<ArkProfileController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3F4F5),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          'Profiles',
          style: AppStyleText.styleMontserrat(
            fontWeight: FontWeight.w700,
            fontSize: 14,
            color: Colors.white,
          ),
        ),
        centerTitle: false,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.centerRight,
              end: Alignment.centerLeft,
              colors: [
                Color(0xFF139DD6),
                Color(0xFF0977BE),
              ],
            ),
          ),
        ),
      ),
      body: SizedBox(
        height: Get.height,
        width: Get.width,
        child: Column(
          children: [
            Expanded(
              flex: 2,
              child: Container(
                color: Colors.amber,
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            Expanded(
              flex: 3,
              child: Container(
                color: Colors.red,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
