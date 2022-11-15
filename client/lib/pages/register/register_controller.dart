import 'package:client/routes/app_routes.dart';
import 'package:get/get.dart';

import '../../services/app_service.dart';
import '../../utils/helper.dart';

class RegisterController extends GetxController with StateMixin<String> {

  final _appService = AppService();

  RxString email = RxString('');
  RxString name = RxString('');
  RxString nrp = RxString('');
  RxString password = RxString('');

  void emailChanged(String val) => email.value = val;
  void nameChanged(String val) => name.value = val;
  void nrpChanged(String val) => nrp.value = val;
  void passwordChanged(String val) => password.value = val;

  Future<void> submit() async {
    change('', status: RxStatus.loading());
    try {
      final result = await _appService.register(email.value,name.value, nrp.value,password.value);
      if (Helper.checkNrp(nrp.value)) {
        Get.offNamed(AppRoutes.event);
      } else {
        Get.offNamed(AppRoutes.home);
      }
      change('', status: RxStatus.success());
    } catch (e) {
      Get.snackbar('Gagal daftar', e.toString());
      change('', status: RxStatus.error(e.toString()));
    }
  }
}