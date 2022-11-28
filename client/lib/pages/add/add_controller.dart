import 'package:client/services/app_service.dart';
import 'package:get/get.dart';

class AddController extends GetxController with StateMixin<String> {

  final _appService = AppService();

  RxString name = RxString('');
  RxString start = RxString('');
  RxString end = RxString('');

  void nameChanged(String val) => name.value = val;
  void startChanged(String val) => start.value = val;
  void endChanged(String val) => end.value = val;

  Future<void> submit() async {
    change('', status: RxStatus.loading());
    try {
      final result = await _appService.addEvent(name.value, start.value, end.value);
      Get.back();
      change('', status: RxStatus.success());
      Get.back();
    } catch (e) {
      change('', status: RxStatus.error(e.toString()));
    }
  }
}