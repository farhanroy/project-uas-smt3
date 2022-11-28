import 'package:client/models/attendance_model.dart';
import 'package:client/services/app_service.dart';
import 'package:get/get.dart';

class DetailController extends GetxController with StateMixin<List<Attendance>> {

  final _appService = AppService();

  RxString idEvent = RxString('');

  void idEventChanged(String id) => idEvent.value = id;

  Future<void> getAllAttendance() async {
    change([], status: RxStatus.loading());
    try {
      final result = await _appService.getAllAttendance(idEvent.value);
      if (result.isEmpty) {
        change([], status: RxStatus.empty());
      } else {
        change(result, status: RxStatus.success());
      }
    } catch (e) {
      change([], status: RxStatus.error(e.toString()));
    }
  }

  Future<void> deleteAttendance(String id) async {
    await _appService.deleteAttendance(id);
    getAllAttendance();
  }
}