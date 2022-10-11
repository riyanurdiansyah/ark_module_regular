import 'package:ark_module_regular/ark_module_regular.dart';
import 'package:ark_module_regular/src/presentation/pages/my_class/widget/ark_tab_course_finished.dart';
import 'package:ark_module_setup/ark_module_setup.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'widget/ark_tab_course_active.dart';

class ArkMyClassPage extends StatelessWidget {
  ArkMyClassPage({Key? key}) : super(key: key);

  final _myClassC = Get.find<ArkMyClassController>();
  final _dashboardC = Get.find<ArkDashboardController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3F4F5),
      appBar: AppBar(
        elevation: 0,
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
      body: DefaultTabController(
        length: 2,
        child: Column(
          children: [
            TabBar(
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
                Obx(() => Tab(
                    text: "Selesai (${_myClassC.listCourseFinished.length})")),
              ],
            ),
            Container(
                decoration: BoxDecoration(
                  color: kCanvasColor,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 0.5,
                      blurRadius: 6,
                    )
                  ],
                ),
                child: const Divider(height: 0, thickness: 1)),
            Obx(
              () => Expanded(
                child: TabBarView(
                  physics: const ScrollPhysics(),
                  children: [
                    ArkTabCourseActive(
                      listCourseActive: _myClassC.listCourseActive,
                      listCourseExpired: _myClassC.listCourseExpired,
                      isLoading: _myClassC.isLoadingCourse.value,
                      onRefresh: () => _myClassC.getMyCourse(),
                    ),
                    ArkTabCourseFinished(
                      listCourse: _myClassC.listCourseFinished,
                      onRefresh: () => _myClassC.getMyCourse(),
                      isLoading: _myClassC.isLoadingCourse.value,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
