import 'package:ark_module_regular/src/domain/entities/course_entity.dart';
import 'package:ark_module_regular/widgets/ark_class_card.dart';
import 'package:flutter/material.dart';

class ArkBannerJRC extends StatelessWidget {
  const ArkBannerJRC({
    Key? key,
    required this.onTapShowAll,
    required this.onTapClass,
    required this.listCourseJRC,
    required this.isLoading,
  }) : super(key: key);

  final VoidCallback onTapShowAll;
  final VoidCallback onTapClass;
  final List<CourseParseEntity> listCourseJRC;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 25,
      ),
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 14),
      decoration: BoxDecoration(
        color: const Color(0xFFF7F8FB),
        border: Border.all(
          color: const Color(0xFFE4E5E9),
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 4.0),
                  child: Text(
                    "Job Ready Course",
                    style: TextStyle(
                      fontSize: 17,
                      color: Colors.black,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 4, horizontal: 6),
                  decoration: BoxDecoration(
                    color: const Color(0xFF4DD2F9),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: const Text(
                    "Baru",
                    style: TextStyle(
                      fontSize: 10,
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 16,
            ),
            child: Text(
              'Kursus online yang siap membantu kamu dalam\nmeningkatkan skill dan mengembangkan karier profesional',
              maxLines: 2,
              style: TextStyle(
                fontFamily: 'SourceSansPro',
                fontSize: 11,
                color: Color(0xFF333539),
                fontWeight: FontWeight.w400,
                height: 1.4,
              ),
            ),
          ),
          const SizedBox(
            height: 14,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
            ),
            child: InkWell(
              onTap: () => onTapShowAll(),
              child: Row(
                children: const [
                  Text(
                    'Lihat Semua Kursus',
                    maxLines: 2,
                    style: TextStyle(
                      fontFamily: 'SourceSansPro',
                      fontSize: 12,
                      color: Color(0xFF1B91D9),
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(
                    width: 6,
                  ),
                  Icon(
                    Icons.arrow_forward_rounded,
                    size: 12,
                    color: Color(0xFF1B91D9),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          if (!isLoading)
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                ),
                child: Row(
                  children: List.generate(
                    listCourseJRC.length,
                    (index) => InkWell(
                      onTap: () {
                        // AppFirebaseAnalyticsService().addLog('mbl_prj_jrc_p4_card');
                        // _lCC.fetchDetailClass(
                        //     _hC.jrcList.value.data![index].course!.id!);
                        // Get.to(
                        //   () => const ClassPage(),
                        // );
                      },
                      child: ArkClassCard(
                        course: listCourseJRC[index].course,
                      ),
                    ),
                  ),
                ),
              ),
            )
        ],
      ),
    );
  }
}
