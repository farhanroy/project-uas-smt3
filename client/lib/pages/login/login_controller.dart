import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../routes/app_routes.dart';
import '../../services/app_service.dart';
import '../../utils/helper.dart';

class LoginController extends GetxController with StateMixin<String> {

  final _appService = AppService();

  RxString email = RxString('');
  RxString password = RxString('');

  void emailChanged(String val) => email.value = val;
  void passwordChanged(String val) => password.value = val;

  Future<void> submit() async {

    change('', status: RxStatus.loading());
    try {
      final result = await _appService.login(email.value, password.value);
      final prefs = await SharedPreferences.getInstance();
      final List<String>? list = prefs.getStringList('data');
      if (Helper.checkNrp(list![4])) {
        Get.offNamed(AppRoutes.event);
      } else {
        Get.offNamed(AppRoutes.home);
      }
      change('', status: RxStatus.success());
    } catch (e) {
      change('', status: RxStatus.error(e.toString()));
    }
  }
}