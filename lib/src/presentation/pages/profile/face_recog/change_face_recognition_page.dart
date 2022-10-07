import 'dart:convert';
import 'package:ark_module_regular/src/presentation/controllers/ark_profile_controller.dart';
import 'package:ark_module_setup/ark_module_setup.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import 'package:url_launcher/url_launcher.dart';

class ArkChangeFaceRecognitionPage extends StatelessWidget {
  ArkChangeFaceRecognitionPage({Key? key}) : super(key: key);

  final _cP = Get.find<ArkProfileController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        iconTheme: const IconThemeData(color: kNewBlack1),
        backgroundColor: Colors.white,
        elevation: 3,
        title: const Text(
          'Ubah Data Face Recognition',
          style: TextStyle(
              color: kNewBlack1, fontSize: 15, fontWeight: FontWeight.bold),
        ),
        titleSpacing: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 50),
              const Text(
                'Yang Terdaftar:',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 12.5,
                ),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Obx(
                    () => _cP.isLoadingFaceRecog.value
                        ? Shimmer.fromColors(
                            baseColor: Colors.grey[300]!,
                            highlightColor: Colors.grey[100]!,
                            child: Container(
                              color: Colors.grey,
                              height: 150,
                              width: 150,
                            ),
                          )
                        : _cP.faceRecog.value.base64image.isEmpty
                            ? Image.asset('assets/images/fr_default_face.png',
                                fit: BoxFit.fill, height: 150, width: 150)
                            : Image.memory(
                                base64Decode(_cP.faceRecog.value.base64image),
                                width: 150,
                                height: 150,
                                fit: BoxFit.cover,
                              ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 50),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'Syarat dan Ketentuan',
                      style: TextStyle(fontWeight: FontWeight.w800),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Persyaratan untuk mengubah wajah yang sudah terdaftar hanya dilakukan jika terdapat perubahan fisik pada wajah seperti bekas kecelakaan atau pergeseran tulang, yang mengakibatkan perubahan struktur pada wajah, sehingga ketika dilakukan scanning, sistem kami tidak dapat melakukan validasi pada wajah yang terdaftar dan wajah yang di scanning.\n\nUntuk mengajukan perubahan data, harap untuk memberikan informasi dengan lengkap seperti Email, nama, foto KTP, foto selfie dan penjelasan pengajuan perubahan. Pengajuan perubahan data membutuhkan waktu validasi sekitar 2-3 hari kerja.',
                      style:
                          TextStyle(fontFamily: 'SourceSansPro', height: 1.35),
                    ),
                  ],
                ),
              ),
              TextButton(
                style: TextButton.styleFrom(primary: Colors.white),
                child: const Text(
                  'Ajukan Pengubahan Data Wajah',
                  style: TextStyle(
                    fontSize: 13,
                    decoration: TextDecoration.underline,
                    decorationThickness: 1.2,
                    color: kPrimaryColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                onPressed: () async {
                  if (await canLaunchUrl(
                      Uri.parse('https://t.me/arkademicare'))) {
                    await launchUrl(Uri.parse('https://t.me/arkademicare'),
                        mode: LaunchMode.externalApplication);
                  }
                },
              ),
              const SizedBox(
                height: 25,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
