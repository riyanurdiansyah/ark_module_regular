import 'package:ark_module_regular/src/domain/entities/my_course_entity.dart';
import 'package:ark_module_setup/ark_module_setup.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

import 'ark_active_course_card.dart';

class ArkTabCourseActive extends StatelessWidget {
  const ArkTabCourseActive({
    Key? key,
    required this.listCourseActive,
    required this.listCourseExpired,
    required this.isLoading,
    required this.onRefresh,
  }) : super(key: key);

  final List<MyCourseEntity> listCourseActive;
  final List<MyCourseEntity> listCourseExpired;
  final bool isLoading;
  final VoidCallback onRefresh;

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        onRefresh();
        await Future.delayed(const Duration(seconds: 1));
      },
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: Get.width,
                margin: const EdgeInsets.symmetric(horizontal: 4),
                padding: const EdgeInsets.symmetric(
                  horizontal: 14,
                  vertical: 13,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: const Color(0xffB1B3B7),
                  ),
                ),
                child: Row(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset(
                          "assets/images/logo_prakerja.png",
                          width: 61,
                          height: 24,
                        ),
                        SizedBox(
                          height: Get.size.height < 600 ? 3 : 6,
                        ),
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: "Peserta Prakerja? ",
                                style: AppStyleText.styleMontserrat(
                                  fontSize: Get.size.height < 600 ? 10 : 12,
                                  fontWeight: FontWeight.w700,
                                  color: const Color(0xff121315),
                                ),
                              ),
                              TextSpan(
                                text: "Cek pelatihanmu di sini!",
                                style: AppStyleText.styleMontserrat(
                                  fontSize: Get.size.height < 600 ? 10 : 12,
                                  fontWeight: FontWeight.w500,
                                  color: const Color(0xff333539),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    InkWell(
                      onTap: () {
                        // _spfC.isLogin.value == true
                        //     ? Get.toNamed(AppRouteName.mainPrakerja,
                        //         preventDuplicates: false)
                        //     : Get.to(
                        //         () => RegistPage(
                        //               routes: AppRouteName.mainPrakerja,
                        //               isPrakerjas: true,
                        //             ),
                        //         transition: Transition.rightToLeft);
                      },
                      child: const Icon(
                        Icons.chevron_right,
                        color: Color(0xffC9CBCF),
                      ),
                    ),
                  ],
                ),
              ),
              if (isLoading)
                SingleChildScrollView(
                  child: Column(
                    children: List.generate(
                      3,
                      (index) => Shimmer.fromColors(
                        baseColor: Colors.grey[300]!,
                        highlightColor: Colors.grey[100]!,
                        child: Container(
                          margin: const EdgeInsets.symmetric(vertical: 8),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            color: Colors.grey,
                          ),
                          height: 125,
                          width: Get.width,
                        ),
                      ),
                    ),
                  ),
                ),
              if (!isLoading)
                Column(
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    ListView.builder(
                      physics: const ScrollPhysics(),
                      itemCount: listCourseActive.length,
                      shrinkWrap: true,
                      itemBuilder: (context, i) {
                        return ArkActiveCourseCard(
                          isExpired: false,
                          course: listCourseActive[i],
                        );
                      },
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8, horizontal: 5),
                      child: Obx(
                        () => listCourseExpired.isNotEmpty
                            ? Text(
                                "Kelas Kadaluarsa (${listCourseExpired.length})",
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize:
                                      Get.size.shortestSide < 600 ? 12 : 14,
                                  color: kNewBlack3,
                                ),
                              )
                            : const SizedBox(),
                      ),
                    ),
                    ListView.builder(
                      padding: const EdgeInsets.only(bottom: 60),
                      physics: const ScrollPhysics(),
                      itemCount: listCourseExpired.length,
                      shrinkWrap: true,
                      itemBuilder: (context, i) {
                        return ArkActiveCourseCard(
                          isExpired: true,
                          course: listCourseExpired[i],
                        );
                      },
                    ),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}
