import 'package:client/services/app_service.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:qrscan/qrscan.dart' as scanner;
import 'package:shared_preferences/shared_preferences.dart';

class HomeController extends GetxController with StateMixin<String> {

  final _appService = AppService();

  Future<void> submit() async {
    change('', status: RxStatus.loading());
    await Permission.camera.request();
    try {
      String? scan = await scanner.scan();

      if (scan == null) {
        change('', status: RxStatus.error('gagal scan'));
      } else {
        final pref = await SharedPreferences.getInstance();
        final list = pref.getStringList('data');

        final result = await _appService.storeAttendance(nrp: list![4], token: list[0]);
        change('', status: RxStatus.success());
      }
    } catch (e) {
      change('', status: RxStatus.error(e.toString()));
    }
  }
}