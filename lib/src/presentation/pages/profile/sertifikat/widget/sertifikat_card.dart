import 'dart:developer';
import 'package:ark_module_setup/ark_module_setup.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

class SertifikatCard extends StatelessWidget {
  const SertifikatCard({
    Key? key,
    required this.sertif,
    required this.onTapUnduh,
    required this.downloadProgress,
    required this.index,
    required this.onTapShare,
    required this.onTapShareLinkedin,
  }) : super(key: key);

  final SertifikatDataEntity sertif;
  final VoidCallback onTapUnduh;
  final VoidCallback onTapShare;
  final VoidCallback onTapShareLinkedin;
  final RxList<int> downloadProgress;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            log("COURSE : ${sertif.courseName}");
            Get.toNamed(AppRouteName.showSertif, arguments: [
              sertif.courseName,
              sertif.certificateUrl,
            ]);
          },
          child: Hero(
            tag: sertif.courseName,
            child: SizedBox(
              width: Get.width / 1.3,
              child: CachedNetworkImage(
                imageUrl: sertif.certificateUrl,
                placeholder: (_, __) => Shimmer.fromColors(
                  baseColor: Colors.grey[300]!,
                  highlightColor: Colors.grey[100]!,
                  child: Container(
                    color: Colors.grey,
                    height: 250,
                  ),
                ),
                errorWidget: (_, __, ___) => Image.asset(
                  'assets/images/sertif-blur.png',
                ),
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Text(
            parseHtmlString(sertif.courseName),
            textAlign: TextAlign.center,
            style: AppStyleText.styleMontserrat(
              fontSize: 12,
              height: 1.5,
              color: Colors.black,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        Text(
          sertif.certificateDate,
          textAlign: TextAlign.center,
          style: AppStyleText.styleSourceSansPro(
            fontSize: 10.5,
            color: Colors.black,
            fontWeight: FontWeight.w400,
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        ExpandableNotifier(
          child: ScrollOnExpand(
            scrollOnCollapse: false,
            scrollOnExpand: false,
            child: ExpandablePanel(
              theme: const ExpandableThemeData(
                useInkWell: true,
                hasIcon: false,
                headerAlignment: ExpandablePanelHeaderAlignment.center,
                expandIcon: Icons.add_rounded,
                collapseIcon: Icons.remove_rounded,
                animationDuration: Duration(milliseconds: 900),
              ),
              collapsed: Column(
                children: const [
                  SizedBox(
                    height: 16,
                  ),
                  Divider(
                    color: Color(0xFFE0E2E5),
                  ),
                ],
              ),
              expanded: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 25,
                  ),
                  Text(
                    'Instruksi',
                    style: AppStyleText.styleMontserrat(
                      fontWeight: FontWeight.w800,
                      color: Colors.black,
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  Text(
                    'Masukkan data-data di bawah ini ke LinkedIn melalui tombol',
                    style: AppStyleText.styleSourceSansPro(
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                      fontSize: 12.5,
                    ),
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  Text(
                    '\'Taruh di Profile LinkedIn\'',
                    style: AppStyleText.styleSourceSansPro(
                      fontWeight: FontWeight.w700,
                      color: Colors.black,
                      fontSize: 12.5,
                    ),
                  ),
                  const SizedBox(
                    height: 14,
                  ),
                  Container(
                    padding: const EdgeInsets.all(14),
                    width: double.infinity,
                    color: const Color(0xFFF6F7FA),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            InkWell(
                              onTap: () => onTapShareLinkedin(),
                              child: Container(
                                height: 36,
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 12),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  gradient: const LinearGradient(
                                    end: Alignment.centerRight,
                                    begin: Alignment.centerLeft,
                                    colors: [
                                      Color(0xFFFF8017),
                                      Color(0xFFFF9417),
                                      Color(0xFFFF9417),
                                      Color(0xFFFF9417),
                                    ],
                                  ),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Image.asset(
                                      'assets/images/job_ready_course/edit_profile.png',
                                    ),
                                    const SizedBox(
                                      width: 8,
                                    ),
                                    Text(
                                      'Taruh di Profile LinkedIn',
                                      style: AppStyleText.styleMontserrat(
                                        fontWeight: FontWeight.w700,
                                        color: Colors.white,
                                        fontSize: 12,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 6,
                            ),
                            Text(
                              '*Pastikan kamu memiliki aplikasi LinkedIn untuk menggunakan fitur ini',
                              style: AppStyleText.styleSourceSansPro(
                                fontWeight: FontWeight.w400,
                                fontSize: 8,
                                color: const Color(0xFF838589),
                              ),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 14,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Expanded(
                              flex: 3,
                              child: Text(
                                'Name',
                                style: AppStyleText.styleSourceSansPro(
                                  fontSize: 13,
                                  height: 1.4,
                                  color: const Color(0xFF333539),
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                            Text(
                              ":  ",
                              style: AppStyleText.styleSourceSansPro(
                                height: 1.4,
                                fontSize: 13,
                                color: const Color(0xFF333539),
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            Expanded(
                              flex: 4,
                              child: Text(
                                parseHtmlString(sertif.courseName),
                                style: AppStyleText.styleSourceSansPro(
                                  height: 1.4,
                                  fontSize: 13,
                                  color: const Color(0xFF333539),
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 6,
                        ),
                        Row(
                          children: [
                            Expanded(
                              flex: 3,
                              child: Text(
                                'Issuing Organization',
                                style: AppStyleText.styleSourceSansPro(
                                  fontSize: 13,
                                  color: const Color(0xFF333539),
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                            Text(
                              ":  ",
                              style: AppStyleText.styleSourceSansPro(
                                fontSize: 13,
                                color: const Color(0xFF333539),
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            Expanded(
                              flex: 4,
                              child: Text(
                                sertif.issuingOrganization,
                                style: AppStyleText.styleSourceSansPro(
                                  fontSize: 13,
                                  color: const Color(0xFF333539),
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 6,
                        ),
                        Row(
                          children: [
                            Expanded(
                              flex: 3,
                              child: Text(
                                'Issue Date',
                                style: AppStyleText.styleSourceSansPro(
                                  fontSize: 13,
                                  color: const Color(0xFF333539),
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                            Text(
                              ":  ",
                              style: AppStyleText.styleSourceSansPro(
                                fontSize: 13,
                                color: const Color(0xFF333539),
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            Expanded(
                              flex: 4,
                              child: Text(
                                sertif.issueDate,
                                style: AppStyleText.styleSourceSansPro(
                                  fontSize: 13,
                                  color: const Color(0xFF333539),
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 6,
                        ),
                        Row(
                          children: [
                            Expanded(
                              flex: 3,
                              child: Text(
                                'Credential ID',
                                style: AppStyleText.styleSourceSansPro(
                                  fontSize: 13,
                                  color: const Color(0xFF333539),
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                            Text(
                              ":  ",
                              style: AppStyleText.styleSourceSansPro(
                                fontSize: 13,
                                color: const Color(0xFF333539),
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            Expanded(
                              flex: 4,
                              child: Text(
                                sertif.credentialId,
                                style: AppStyleText.styleSourceSansPro(
                                  fontSize: 13,
                                  color: const Color(0xFF333539),
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 6,
                        ),
                        Row(
                          children: [
                            Expanded(
                              flex: 3,
                              child: Text(
                                'Credential URL',
                                style: AppStyleText.styleSourceSansPro(
                                  fontSize: 13,
                                  color: const Color(0xFF333539),
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                            Text(
                              ":  ",
                              style: AppStyleText.styleSourceSansPro(
                                fontSize: 13,
                                color: const Color(0xFF333539),
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            Expanded(
                              flex: 4,
                              child: Text(
                                sertif.credentialUrl,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: AppStyleText.styleSourceSansPro(
                                  fontSize: 13,
                                  color: const Color(0xFF333539),
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
              header: Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: Container(
                      height: 30,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 6, vertical: 8),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          gradient: const LinearGradient(
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                            colors: [
                              Color(0xFF0977BE),
                              Color(0xFF1CA2E4),
                            ],
                          )),
                      child: FittedBox(
                        fit: BoxFit.contain,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            SvgPicture.asset(
                              'assets/svg/linkedin.svg',
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(
                              "Tambahkan ke LinkedIn",
                              style: AppStyleText.styleMontserrat(
                                fontSize: 11,
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            const Icon(
                              Icons.expand_more_rounded,
                              size: 16,
                              color: Colors.white,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 6,
                  ),
                  InkWell(
                    onTap: () => onTapUnduh(),
                    child: Container(
                      height: 30,
                      alignment: Alignment.center,
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(
                          color: const Color(0xFF838589),
                          width: 0.56,
                        ),
                      ),
                      child: Obx(() {
                        if (downloadProgress[index] == 0 ||
                            downloadProgress[index] == 100 ||
                            downloadProgress[index] == -1) {
                          return Row(
                            children: [
                              const Icon(
                                Icons.download_rounded,
                                color: Color(0xFF0977BE),
                                size: 10,
                              ),
                              const SizedBox(
                                width: 4,
                              ),
                              Text(
                                'Unduh',
                                style: AppStyleText.styleMontserrat(
                                  fontSize: 9,
                                  color: const Color(0xFF0977BE),
                                  fontWeight: FontWeight.w700,
                                ),
                              )
                            ],
                          );
                        } else {
                          return Text(
                            'Progress ${downloadProgress[index]}%',
                            style: AppStyleText.styleMontserrat(
                              fontSize: 9,
                              color: const Color(0xFF0977BE),
                              fontWeight: FontWeight.w700,
                            ),
                          );
                        }
                      }),
                    ),
                  ),
                  const SizedBox(
                    width: 6,
                  ),
                  InkWell(
                    onTap: () => onTapShare(),
                    child: Container(
                      alignment: Alignment.center,
                      height: 30,
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(
                          color: const Color(0xFF838589),
                          width: 0.56,
                        ),
                      ),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.share_rounded,
                            color: Color(0xFF0977BE),
                            size: 12,
                          ),
                          const SizedBox(
                            width: 6,
                          ),
                          Text(
                            'Bagikan',
                            style: AppStyleText.styleMontserrat(
                              fontSize: 9,
                              color: const Color(0xFF0977BE),
                              fontWeight: FontWeight.w700,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
