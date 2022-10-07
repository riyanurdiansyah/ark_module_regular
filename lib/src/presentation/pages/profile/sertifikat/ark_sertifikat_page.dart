import 'package:ark_module_regular/src/presentation/controllers/ark_sertifikat_controller.dart';
import 'package:ark_module_setup/ark_module_setup.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'widget/custom_popup_menu.dart';
import 'widget/sertifikat_kelulusan_tab.dart';
import 'widget/sertifikat_penyelesaian_tab.dart';

class ArkSertifikatPage extends StatelessWidget {
  ArkSertifikatPage({Key? key}) : super(key: key);
  final _sC = Get.find<ArkSertifikatController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _sC.scaffoldkey,
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "Sertifikat",
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
      body: Column(
        children: [
          const SizedBox(
            height: 16,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14),
            child: Row(
              children: [
                Expanded(
                  flex: 6,
                  child: SizedBox(
                    height: 40,
                    child: Obx(
                      () => TextField(
                        controller: _sC.txSearch,
                        onChanged: (query) => _sC.fnOnSearchCertificate(query),
                        style: AppStyleText.styleMontserrat(
                          fontWeight: FontWeight.w500,
                          fontSize: 12,
                          color: Colors.black,
                        ),
                        decoration: AppStyleTextfield.customOutlined(
                          'Cari sertifikat',
                          const Icon(
                            Icons.search_rounded,
                            size: 18,
                          ),
                          _sC.isHaveQuerySearch.value
                              ? GestureDetector(
                                  onTap: () => _sC.fnOnSearchCertificate(''),
                                  child: const Icon(
                                    Icons.close_rounded,
                                    size: 18,
                                  ),
                                )
                              : null,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  flex: 5,
                  child: CustomPopUpMenu(
                    icon: Container(
                      height: 40,
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(
                          width: 0.6,
                          color: const Color(0xFFC0C2C6),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Obx(
                            () => Text(
                              _sC.txtUrutkan.value,
                              style: AppStyleText.styleMontserrat(
                                fontWeight: FontWeight.w500,
                                fontSize: 11,
                                color: const Color(0xFF333539),
                              ),
                            ),
                          ),
                          const Icon(
                            Icons.expand_more_rounded,
                            size: 18,
                          ),
                        ],
                      ),
                    ),
                    listMenu: <PopupMenuItem>[
                      PopupMenuItem(
                        onTap: () => _sC.fnSortCertificate('Terbaru'),
                        child: Text(
                          'Terbaru',
                          style: AppStyleText.styleMontserrat(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: Colors.black54,
                          ),
                        ),
                      ),
                      PopupMenuItem(
                        onTap: () => _sC.fnSortCertificate('A - Z'),
                        child: Text(
                          'A - Z',
                          style: AppStyleText.styleMontserrat(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: Colors.black54,
                          ),
                        ),
                      ),
                      PopupMenuItem(
                        onTap: () => _sC.fnSortCertificate('Z - A'),
                        child: Text(
                          'Z - A',
                          style: AppStyleText.styleMontserrat(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: Colors.black54,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 14,
          ),
          Obx(
            () => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14),
              child: Row(
                children: [
                  InkWell(
                    onTap: () => _sC.fnOnChangeSertif(0),
                    child: FittedBox(
                      fit: BoxFit.contain,
                      child: Container(
                        alignment: Alignment.center,
                        height: 30,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 13, vertical: 8),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            color: _sC.indexTabSertif.value == 0
                                ? const Color(0xFFDEF1FD)
                                : Colors.white,
                            border: Border.all(
                              color: _sC.indexTabSertif.value == 0
                                  ? const Color(0xFFDEF1FD)
                                  : Colors.grey.shade300,
                            )),
                        child: Text(
                          'Sertifikat Penyelesaian',
                          style: AppStyleText.styleMontserrat(
                            fontSize: 10,
                            fontWeight: FontWeight.w700,
                            color: _sC.indexTabSertif.value == 0
                                ? const Color(0xFF0977BE)
                                : const Color(0xFF838589),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Expanded(
                    flex: 1,
                    child: InkWell(
                      onTap: () => _sC.fnOnChangeSertif(1),
                      child: Container(
                        alignment: Alignment.center,
                        height: 30,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 13, vertical: 8),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          color: _sC.indexTabSertif.value == 1
                              ? const Color(0xFFDEF1FD)
                              : Colors.white,
                          border: Border.all(
                            color: _sC.indexTabSertif.value == 1
                                ? const Color(0xFFDEF1FD)
                                : Colors.grey.shade300,
                          ),
                        ),
                        child: FittedBox(
                          fit: BoxFit.contain,
                          child: Text(
                            'Sertifikat Kompetensi Kelulusan',
                            style: AppStyleText.styleMontserrat(
                              fontSize: 10,
                              fontWeight: FontWeight.w700,
                              color: _sC.indexTabSertif.value == 1
                                  ? const Color(0xFF0977BE)
                                  : const Color(0xFF838589),
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
          const SizedBox(
            height: 20,
          ),
          Expanded(
            child: Obx(
              () => IndexedStack(
                index: _sC.indexTabSertif.value,
                children: [
                  SertifikatPenyelesaianTab(),
                  SertifikatKelulusanTab(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
