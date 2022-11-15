import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../routes/app_routes.dart';
import '../../utils/helper.dart';

class SplashController extends GetxController with StateMixin<String> {
  @override
  void onInit() {
    checkUserExist();
    super.onInit();
  }

  Future<void> checkUserExist() async {
    final prefs = await SharedPreferences.getInstance();
    final List<String>? isLogin = prefs.getStringList('data');

    if (isLogin != null) {
      if (Helper.checkNrp(isLogin[4])) {
        Get.offNamed(AppRoutes.event);
      } else {
        Get.offNamed(AppRoutes.home);
      }
    } else {
      Get.offNamed(AppRoutes.login);
    }
  }
}