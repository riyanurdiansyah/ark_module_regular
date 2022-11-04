import 'package:ark_module_regular/utils/app_dialog.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ArkDashboardController extends GetxController {
  late SharedPreferences _prefs;

  final Rx<int> _selectedIndex = 1.obs;
  Rx<int> get selectedIndex => _selectedIndex;

  final Rx<bool> _isLogin = false.obs;
  Rx<bool> get isLogin => _isLogin;

  @override
  void onInit() async {
    await _setup();
    super.onInit();
  }

  Future _setup() async {
    _prefs = await SharedPreferences.getInstance();
    _isLogin.value = _prefs.getBool('user_login') ?? false;
  }

  Future<bool> onWillPop() async => await AppDialog.dialogOnWillPop() ?? false;

  void onTapNavbar(int i) {
    _selectedIndex.value = i;

    if (_prefs.getBool('show_dialog_job_course') == null) {
      _prefs.setBool('show_dialog_job_course', false);
    }
    if (_prefs.getBool('once_click_dialog_job') == null) {
      _prefs.setBool('once_click_dialog_job', true);
    }

    if (DateTime.now().weekday == DateTime.monday) {
      if (selectedIndex.value == 0) {
        if (_isLogin.value) {
          if (!_prefs.getBool('show_dialog_job_course')!) {
            if (_prefs.getBool('once_click_dialog_job') == true) {
              AppDialog.dialogJRC();
            }
            _prefs.setBool('tour_kamu_x_profesi', true);
          } else {
            if (DateTime.now().weekday == DateTime.monday) {
              if (_prefs.getBool('once_click_dialog_job_weekday') == false) {
                AppDialog.dialogJRC();
              }
            } else {
              _prefs.setBool('once_click_dialog_job_weekday', false);
            }
          }
        }
      }
    }
  }
}
