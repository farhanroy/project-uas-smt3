import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:qrscan/qrscan.dart' as scanner;

import '../../services/app_service.dart';

class HomeController extends GetxController with StateMixin<String> {

  final _appService = AppService();

  Future<void> submit() async {
    await Permission.camera.request();
    try {
      String? scan = await scanner.scan();

      if (scan == null) {
        Fluttertoast.showToast(msg: "QR Code tidak dapat terbaca");
      } else {

        final result = await _appService.addAttendance(scan);
        Fluttertoast.showToast(msg: "Berhasil melakukan presensi");
      }
    } catch (e) {
      Fluttertoast.showToast(msg: e.toString());
    }
  }
}