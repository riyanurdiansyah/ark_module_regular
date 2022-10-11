import 'package:ark_module_setup/ark_module_setup.dart';
import 'package:flutter/material.dart';

class ArkEmptyCourse extends StatelessWidget {
  const ArkEmptyCourse({Key? key, required this.onTap}) : super(key: key);

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Center(
      // padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 30),
      child: SingleChildScrollView(
        child: Column(
          children: [
            // const SizedBox(height: 30),
            Image.asset('assets/images/empty_state.png',
                width: 100, height: 100),
            const SizedBox(height: 10),
            const Text(
              'Mau belajar apa hari ini?',
              style: TextStyle(
                  fontWeight: FontWeight.w700, fontSize: 11, height: 1.6),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 3,
            ),
            const Text(
              'Yuk, temukan kelas impianmu sekarang!',
              style: TextStyle(
                  fontWeight: FontWeight.w500, fontSize: 11, height: 1.6),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 35),
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
              child: const Text(
                'Eksplor Kelas',
                style: TextStyle(
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
