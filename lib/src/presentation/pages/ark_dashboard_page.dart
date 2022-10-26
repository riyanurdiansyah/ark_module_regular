import 'package:ark_module_profile/ark_module_profile.dart';
import 'package:ark_module_regular/ark_module_regular.dart';
import 'package:ark_module_regular/src/presentation/pages/my_class/ark_my_course_page.dart';
import 'package:ark_module_setup/ark_module_setup.dart';
import 'package:connectivity_wrapper/connectivity_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ArkDashboardPage extends StatelessWidget {
  ArkDashboardPage({Key? key}) : super(key: key);

  final _dashboardC = Get.find<ArkDashboardController>();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _dashboardC.onWillPop,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: ConnectivityWidgetWrapper(
          message: 'Tidak ada connection',
          messageStyle: AppStyleText.styleMontserrat(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
          child: Obx(
            () => IndexedStack(
              index: _dashboardC.selectedIndex.value,
              children: [
                ArkHomePage(),
                ArkMyCoursePage(),
                ArkProfilePage(),
              ],
            ),
          ),
        ),
        bottomNavigationBar: Container(
          decoration: const BoxDecoration(
              color: kCanvasColor,
              boxShadow: <BoxShadow>[
                BoxShadow(
                    color: Colors.black26,
                    blurRadius: 15.0,
                    offset: Offset(0.0, 0.75))
              ],
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20), topRight: Radius.circular(20))),
          width: Get.width,
          height: 60,
          child: Obx(
            () => Column(
              children: [
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: List.generate(
                        navbarItems.length,
                        (i) => InkWell(
                          onTap: () => _dashboardC.onTapNavbar(i),
                          child: Container(
                            padding: i == 0 && GetPlatform.isAndroid
                                ? const EdgeInsets.only(left: 50, top: 9)
                                : i == 2
                                    ? const EdgeInsets.only(right: 50, top: 9)
                                    : null,
                            margin:
                                i == 1 ? const EdgeInsets.only(top: 17) : null,
                            width: Get.size.width * 0.33,
                            child: Column(
                              children: [
                                Image.asset(
                                  _dashboardC.selectedIndex.value == i
                                      ? navbarItems[i]['icon_select']!
                                      : navbarItems[i]['icon_deselect']!,
                                  width: 22,
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  navbarItems[i]['text']!,
                                  style: AppStyleText.styleMontserrat(
                                    fontSize: 9,
                                    color: _dashboardC.selectedIndex.value == i
                                        ? const Color(0xff1C1D20)
                                        : const Color(0xff939598),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned.fill(
                      top: -15,
                      child: GestureDetector(
                        onTap: () => _dashboardC.selectedIndex.value = 1,
                        child: Align(
                            alignment: Alignment.topCenter,
                            child: ClipOval(
                              child: Container(
                                width: 53,
                                height: 53,
                                color: const Color(0xffFF8017),
                                child: Padding(
                                  padding: const EdgeInsets.all(14),
                                  child: Image.asset(
                                    'assets/images/kelas_saya_icon.png',
                                    fit: BoxFit.fitWidth,
                                  ),
                                ),
                              ),
                            )),
                      ),
                    )
                  ],
                ),
                GetPlatform.isIOS
                    ? SizedBox(height: Get.size.height * 0.02)
                    : const SizedBox()
              ],
            ),
          ),
        ),
        floatingActionButton: Obx(
          () => !_dashboardC.isLogin.value
              ? Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: InkWell(
                    onTap: () => Get.toNamed(AppRouteName.signup),
                    child: Container(
                      alignment: Alignment.center,
                      width: Get.size.width - 40,
                      height: 43,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        gradient: const LinearGradient(
                          begin: Alignment.bottomLeft,
                          end: Alignment.topRight,
                          colors: [
                            Color(0xff0977BE),
                            Color(0xff139DD6),
                          ],
                        ),
                      ),
                      child: const Text(
                        "Daftar",
                        style: TextStyle(
                          fontSize: 14.5,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                )
              : const SizedBox(),
        ),
      ),
    );
  }
}
