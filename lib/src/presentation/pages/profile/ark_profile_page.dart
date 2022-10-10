import 'package:ark_module_regular/src/domain/entities/coin_entity.dart';
import 'package:ark_module_regular/src/presentation/controllers/ark_profile_controller.dart';
import 'package:ark_module_setup/ark_module_setup.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

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
          'Profile',
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
      body: ListView(
        children: [
          Obx(
            () {
              if (_pC.isLogin.value) {
                return Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(50),
                          child: CachedNetworkImage(
                            errorWidget: (context, url, error) {
                              return Container();
                            },
                            placeholder: (context, url) {
                              return Shimmer.fromColors(
                                baseColor: Colors.grey[300]!,
                                highlightColor: Colors.grey[100]!,
                                child: Container(
                                  color: Colors.grey,
                                  height: 82,
                                ),
                              );
                            },
                            fit: BoxFit.fill,
                            height: 70,
                            width: 70,
                            imageUrl: _pC.avatar.value,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 12,
                      ),
                      Expanded(
                        flex: 8,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  _pC.name.value.capitalize!,
                                  style: const TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const Spacer(),
                                InkWell(
                                  onTap: () =>
                                      Get.toNamed(AppRouteName.editProfile),
                                  child: SvgPicture.asset(
                                    'assets/svg/edit.svg',
                                    width: 16,
                                  ),
                                ),
                              ],
                            ),
                            Text(
                              _pC.email.value.toLowerCase(),
                              style: TextStyle(
                                fontSize: 12,
                                fontFamily: 'SourceSansPro',
                                fontWeight: FontWeight.w400,
                                color: Colors.black.withOpacity(0.8),
                              ),
                            ),
                            const SizedBox(height: 10),
                            Row(
                              children: [
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 3, horizontal: 8),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    gradient: const LinearGradient(
                                      begin: Alignment.centerLeft,
                                      end: Alignment.centerRight,
                                      colors: [
                                        Color(0xFF1B91D9),
                                        Color(0xFF31A7E8),
                                      ],
                                    ),
                                  ),
                                  child: Center(
                                    child: Obx(
                                      () => Text(
                                        '${_pC.listCourse.length} kelas diikuti',
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 8,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 5),
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 3, horizontal: 8),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    gradient: const LinearGradient(
                                      begin: Alignment.centerLeft,
                                      end: Alignment.centerRight,
                                      colors: [
                                        Color(0xFF1B91D9),
                                        Color(0xFF31A7E8),
                                      ],
                                    ),
                                  ),
                                  child: Center(
                                    child: Obx(
                                      () => Text(
                                        '${_pC.jmlKelasSelesai.value} kelas selesai',
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 8,
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              } else {
                return SizedBox(
                  height: Get.height / 1.2,
                  width: double.infinity,
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 20),
                        child: Row(
                          children: [
                            Expanded(
                              flex: 2,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(50),
                                child: Image.asset(
                                  'assets/images/fr_default_face.png',
                                  fit: BoxFit.fill,
                                  height: 70,
                                  width: 70,
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 12,
                            ),
                            Expanded(
                              flex: 8,
                              child: Row(
                                children: [
                                  const SizedBox(width: 10),
                                  OutlinedButton(
                                    onPressed: () =>
                                        Get.toNamed(AppRouteName.signin),
                                    style: OutlinedButton.styleFrom(
                                        side: const BorderSide(
                                      color: kPrimaryColor,
                                    )),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 16),
                                      child: Text(
                                        'Login',
                                        style: AppStyleText.styleMontserrat(
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold,
                                            color: kPrimaryColor),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 12),
                                  OutlinedButton(
                                    onPressed: () =>
                                        Get.toNamed(AppRouteName.signup),
                                    style: OutlinedButton.styleFrom(
                                        side: const BorderSide(
                                      color: kPrimaryColor,
                                    )),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 16),
                                      child: Text(
                                        'Daftar',
                                        style: AppStyleText.styleMontserrat(
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold,
                                            color: kPrimaryColor),
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
                        height: 16,
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 18),
                        color: Colors.white,
                        width: double.infinity,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Akun Saya',
                              style: AppStyleText.styleMontserrat(
                                fontSize: 14,
                                color: Colors.black,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                            SizedBox(
                              height: 25,
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      'Sertifikat Saya',
                                      style: AppStyleText.styleMontserrat(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 11.5,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                  const Icon(
                                    Icons.arrow_forward_ios_rounded,
                                    size: 12,
                                    color: Color(0xFFC0C2C6),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                      Expanded(
                        child: Container(
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                );
              }
            },
          ),
          Obx(
            () {
              if (_pC.isLogin.value) {
                return StreamBuilder<CoinEntity>(
                  stream: _pC.fnGetCoin(),
                  builder: (_, snapshot) {
                    if (snapshot.hasData) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        child: Column(
                          children: [
                            Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              elevation: 2,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Expanded(
                                    flex: 1,
                                    child: InkWell(
                                      onTap: () =>
                                          Get.toNamed(AppRouteName.coin),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 15, vertical: 16),
                                        child: Row(
                                          children: [
                                            Image.asset(
                                              "assets/images/coins.png",
                                              width: 20,
                                            ),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            Column(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  'Arkademi Koin',
                                                  style: AppStyleText
                                                      .styleSourceSansPro(
                                                    fontWeight: FontWeight.w400,
                                                    fontSize: 10,
                                                    color: Colors.grey,
                                                  ),
                                                ),
                                                FittedBox(
                                                  fit: BoxFit.contain,
                                                  child: Text(
                                                    '${numberFormat.format(snapshot.data?.coins ?? 0)} Koin',
                                                    style: AppStyleText
                                                        .styleMontserrat(
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: snapshot
                                                                  .data!.coins
                                                                  .toString()
                                                                  .length >=
                                                              7
                                                          ? 12
                                                          : 14,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: 0.8,
                                    height: 30,
                                    color: const Color(0xFFE5E6E9),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 15, vertical: 16),
                                      child: Row(
                                        children: [
                                          Image.asset(
                                            "assets/images/wallet.png",
                                            width: 20,
                                          ),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'Arkademi Wallet',
                                                style: AppStyleText
                                                    .styleSourceSansPro(
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 10,
                                                  color: Colors.grey,
                                                ),
                                              ),
                                              Text(
                                                "Coming Soon",
                                                style: AppStyleText
                                                    .styleMontserrat(
                                                  fontSize: 11,
                                                  fontStyle: FontStyle.italic,
                                                  fontWeight: FontWeight.w500,
                                                  color: Colors.black,
                                                ),
                                              )
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            if (snapshot.data!.isCompleted == false)
                              Container(
                                margin: const EdgeInsets.only(top: 10),
                                width: Get.width / 1.1,
                                height: 50,
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 12),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: const Color(0xFFFEF7EA),
                                  border: Border.all(
                                    color: const Color(
                                      0xFFFAE5C4,
                                    ),
                                  ),
                                ),
                                child: Row(
                                  children: [
                                    Expanded(
                                      flex: 4,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Lengkapi Informasi Akun Anda',
                                            style: AppStyleText.styleMontserrat(
                                              fontSize: 10,
                                              color: Colors.black,
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 3,
                                          ),
                                          Row(
                                            children: [
                                              Image.asset(
                                                "assets/images/coin.png",
                                                width: 15,
                                              ),
                                              RichText(
                                                text: TextSpan(
                                                  text: "Dapatkan",
                                                  style: AppStyleText
                                                      .styleSourceSansPro(
                                                    fontSize: 10,
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                  children: [
                                                    TextSpan(
                                                      text: snapshot
                                                              .data!.isOldUser!
                                                          ? "  10.000 koin"
                                                          : "  5.000 koin",
                                                      style: AppStyleText
                                                          .styleMontserrat(
                                                        fontSize: 10,
                                                        color: Colors.black,
                                                        fontWeight:
                                                            FontWeight.w700,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              )
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      width: 90,
                                      height: 30,
                                      child: ElevatedButton(
                                        style: ButtonStyle(
                                          backgroundColor:
                                              MaterialStateProperty.all(
                                                  const Color(0xFFFF8111)),
                                        ),
                                        onPressed: () => Get.toNamed(
                                            AppRouteName.editProfile),
                                        child: Text(
                                          'Lengkapi',
                                          style: AppStyleText.styleMontserrat(
                                            fontSize: 10,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                          ],
                        ),
                      );
                    } else {
                      return Shimmer.fromColors(
                        baseColor: Colors.grey[300]!,
                        highlightColor: Colors.grey[100]!,
                        child: Container(
                          margin: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 10),
                          color: Colors.grey,
                          height: 65,
                        ),
                      );
                    }
                  },
                );
              } else {
                return const SizedBox();
              }
            },
          ),
          const SizedBox(
            height: 18,
          ),
          if (_pC.isLogin.value)
            Expanded(
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 18),
                    color: Colors.white,
                    width: double.infinity,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Akun Saya',
                          style: AppStyleText.styleMontserrat(
                            fontSize: 14,
                            color: Colors.black,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        GestureDetector(
                          onTap: () => Get.toNamed(
                            AppRouteName.certificate,
                            arguments: _pC.userId.value,
                          ),
                          child: SizedBox(
                            height: 25,
                            child: Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    'Sertifikat Saya',
                                    style: AppStyleText.styleMontserrat(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 11.5,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                                const Icon(
                                  Icons.arrow_forward_ios_rounded,
                                  size: 12,
                                  color: Color(0xFFC0C2C6),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 20),
                    color: Colors.white,
                    width: double.infinity,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Pengaturan Akun",
                          style: AppStyleText.styleMontserrat(
                            fontWeight: FontWeight.w800,
                            fontSize: 14,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        InkWell(
                          onTap: () =>
                              Get.toNamed(AppRouteName.changeFaceRecog),
                          child: SizedBox(
                            height: 25,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Text(
                                    "Ubah Data Face Recognition",
                                    style: AppStyleText.styleMontserrat(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 11.5,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                                const Icon(
                                  Icons.arrow_forward_ios_rounded,
                                  size: 12,
                                  color: Color(0xFFC0C2C6),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Divider(
                          height: 1,
                          color: Colors.grey.shade300,
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        GestureDetector(
                          onTap: () => _pC.fnResetPassword(),
                          child: SizedBox(
                            height: 25,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Text(
                                    "Ubah Password",
                                    style: AppStyleText.styleMontserrat(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 11.5,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                                const Icon(
                                  Icons.arrow_forward_ios_rounded,
                                  size: 12,
                                  color: Color(0xFFC0C2C6),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 20),
                    color: Colors.white,
                    child: GestureDetector(
                      onTap: () => _pC.fnConfirmLogout(),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SvgPicture.asset(
                            'assets/svg/keluar.svg',
                            width: 18,
                            color: const Color(0xFFFB5C5C),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 4),
                            child: Text(
                              "Keluar",
                              style: AppStyleText.styleMontserrat(
                                fontWeight: FontWeight.w500,
                                fontSize: 12,
                                color: const Color(0xFFFB5C5C),
                              ),
                            ),
                          ),
                          Container(
                            height: Get.height / 4,
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
