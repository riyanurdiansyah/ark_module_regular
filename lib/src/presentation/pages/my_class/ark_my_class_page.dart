import 'package:ark_module_regular/ark_module_regular.dart';
import 'package:ark_module_setup/ark_module_setup.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ArkMyClassPage extends StatelessWidget {
  ArkMyClassPage({Key? key}) : super(key: key);

  final _myClassC = Get.find<ArkMyClassController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3F4F5),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          'Kelas Saya',
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
      body: RefreshIndicator(
        onRefresh: () => _myClassC.getMyCourse(),
        child: DefaultTabController(
          length: 2,
          child: TabBar(
            labelColor: kNewBlack1,
            labelStyle: const TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 13,
                fontFamily: 'Montserrat'),
            indicatorWeight: 3,
            unselectedLabelColor: kNewBlack3,
            indicatorColor: const Color(0xff0977BE),
            unselectedLabelStyle: const TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 13,
                fontFamily: 'Montserrat'),
            tabs: [
              Obx(() =>
                  Tab(text: "Aktif (${_myClassC.listCourseActive.length})")),
              Obx(() =>
                  Tab(text: "Selesai (${_myClassC.listCourseFinished.length})"))
            ],
          ),
        ),
      ),
    );
  }
}
