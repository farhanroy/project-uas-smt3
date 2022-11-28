import 'package:client/services/app_service.dart';
import 'package:client/utils/helper.dart';
import 'package:get/get.dart';

import '../../routes/app_routes.dart';

class ProfileController extends GetxController with StateMixin<List<String>> {

  final _appService = AppService();

  Future<void> getData() async {
    change([], status: RxStatus.loading());
    try {
      final user = await Helper.getPreference('data');
      print(user!.length);
      change(user, status: RxStatus.success());
    } catch (e) {
      change([], status: RxStatus.error(e.toString()));
    }
  }

  Future<void> logout() async {
    change([], status: RxStatus.loading());
    try{
      final result = await _appService.logout();
      await Helper.deletePreference('data');
    } catch(e) {
      change([], status: RxStatus.error(e.toString()));
    }
  }
}