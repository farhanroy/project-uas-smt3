import 'package:client/models/event_model.dart';
import 'package:get/get.dart';

import '../../services/app_service.dart';

class EventController extends GetxController with StateMixin<List<EventModel>> {

  final _appService = AppService();

  Future<void> getAllEvent() async {
    change([], status: RxStatus.loading());
    try {
      final result = await _appService.getAllEvent();
      if (result.isNotEmpty) {
        change(result, status: RxStatus.success());
      } else {
        change([], status: RxStatus.success());
      }
    } catch (e) {
      change([], status: RxStatus.error(e.toString()));
    }
  }

  Future<void> deleteEvent(String id) async {
    try {
      await _appService.deleteEvent(id);
      getAllEvent();
    } catch(e) {

    }
  }
}