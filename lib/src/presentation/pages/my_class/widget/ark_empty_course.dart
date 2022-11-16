import 'package:flutter/material.dart';
import 'package:ark_module_regular/utils/app_color.dart';

class ArkEmptyCourse extends StatelessWidget {
  const ArkEmptyCourse({
    Key? key,
    required this.onTap,
    this.title,
    this.subtitle,
    this.txtButton,
    this.isHaveButton = true,
  }) : super(key: key);

  final VoidCallback onTap;
  final String? title;
  final String? subtitle;
  final String? txtButton;
  final bool? isHaveButton;

  @override
  Widget build(BuildContext context) {
    return Center(
      // padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 30),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // const SizedBox(height: 30),
            Image.asset('assets/images/empty_state.png',
                width: 100, height: 100),
            const SizedBox(height: 10),
            Text(
              title ?? 'Mau belajar apa hari ini?',
              style: const TextStyle(
                  fontWeight: FontWeight.w700, fontSize: 11, height: 1.6),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 3,
            ),
            Text(
              subtitle ?? 'Yuk, temukan kelas impianmu sekarang!',
              style: const TextStyle(
                  fontWeight: FontWeight.w500, fontSize: 11, height: 1.6),
              textAlign: TextAlign.center,
            ),
            if (isHaveButton!) const SizedBox(height: 35),
            if (isHaveButton!)
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding:
                      const EdgeInsets.symmetric(vertical: 16, horizontal: 30),
                  elevation: 1,
                  primary: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6),
                    side: const BorderSide(
                      width: 0.5,
                      color: kPrimaryColor,
                    ),
                  ),
                ),
                onPressed: () => onTap(),
                child: Text(
                  txtButton ?? 'Eksplor Kelas',
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                    color: kPrimaryColor,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
