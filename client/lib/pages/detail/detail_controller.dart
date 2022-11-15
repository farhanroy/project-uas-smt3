import 'package:get/get.dart';

class DetailController extends GetxController with StateMixin<String> {

  Future<void> submit() async {
    change('', status: RxStatus.loading());
    try {

      change('', status: RxStatus.success());
    } catch (e) {
      change('', status: RxStatus.error(e.toString()));
    }
  }
}