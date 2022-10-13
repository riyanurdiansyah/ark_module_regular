import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ArkBannerPrakerja extends StatelessWidget {
  const ArkBannerPrakerja({
    Key? key,
    required this.onTapBanner,
  }) : super(key: key);

  final VoidCallback onTapBanner;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 25,
        vertical: 25,
      ),
      margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        image: const DecorationImage(
          image: AssetImage(
            'assets/images/logo_baner_prakerja.png',
          ),
          fit: BoxFit.fitWidth,
        ),
      ),
      width: Get.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/logo_prakerja.png',
                  width: 105,
                ),
                const Text(
                  'Punya Voucher Prakerja?',
                  style: TextStyle(
                    fontSize: 13,
                    color: Colors.black,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(height: 4),
                const Text(
                  'Tukar kode voucher prakerja Anda di sini.',
                  style: TextStyle(
                    fontSize: 9,
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                fixedSize: const Size(130, 24),
                primary: const Color.fromRGBO(243, 130, 46, 1),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ),
              onPressed: () async {},
              child: FittedBox(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset('assets/images/icon-explore-prakerja.png',
                        height: 13),
                    Container(
                      width: 10,
                    ),
                    const Text(
                      'TUKAR VOUCHER',
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
