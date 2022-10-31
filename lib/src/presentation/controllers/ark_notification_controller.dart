import 'package:get/get.dart';

class ArkNotificationController extends GetxController {
  final Rx<int> _indexSelected = 0.obs;
  Rx<int> get indexSelected => _indexSelected;

  void changeSelectedIndex(int i) {
    _indexSelected.value = i;
  }
}
