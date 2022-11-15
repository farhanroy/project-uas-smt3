import 'package:get/get.dart';

import '../../services/app_service.dart';

class EventController extends GetxController with StateMixin<String> {

  final _appService = AppService();

  Future<void> submit() async {
    change('', status: RxStatus.loading());
    try {

      change('', status: RxStatus.success());
    } catch (e) {
      change('', status: RxStatus.error(e.toString()));
    }
  }
}