import 'package:client/models/attendance_model.dart';
import 'package:client/models/event_model.dart';
import 'package:client/network/network_interceptor.dart';
import 'package:client/utils/helper.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppService {
  late Dio _dio;
  late BaseOptions _baseOptions;

  final String baseUrl = "https://dynamic-uas.herokuapp.com/api/";

  AppService() {
    _baseOptions = BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: (10 * 60 * 1000),
      receiveTimeout: (10 * 60 * 1000),
      sendTimeout: (10 * 60 * 1000),
      responseType: ResponseType.json,
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      },
    );

    _dio = Dio(_baseOptions);
    _dio.interceptors.add(NetworkInterceptor());
  }

  Future<void> login(String email, String password) async {

    final data = {"email": email, "password": password};

    try {
      final response = await _dio.post('auth/signin', data: {"email": email, "password": password});
      final body = response.data;

      final prefs = await SharedPreferences.getInstance();
      await prefs.setStringList('data', [
        body['token']!,
        body['data']['id'],
        body['data']['name'],
        body['data']['email'],
        body['data']['nrp'],
        body['data']['id']
      ]);

    } on DioError catch (e) {
      throw Exception(e.message);
    }
  }

  Future<void> register(String email, String name, String nrp, String password) async {

    final data = {
      "email": email,
      "name": name,
      "nrp": nrp,
      "password": password
    };

    try {
      final response = await _dio.post('auth/signup', data: data);
      final body = response.data;

      final prefs = await SharedPreferences.getInstance();
      await prefs.setStringList('data', [
        body['token']!,
        body['data']['id'],
        body['data']['name'],
        body['data']['email'],
        body['data']['nrp'],
        body['data']['id']
      ]);

    } on DioError catch (e) {
      throw Exception(e.message);
    }
  }

  Future<void> logout() async {
    try {
      final request = await _dio.get('auth/signout');
    } on DioError catch (e) {
      throw Exception(e.message);
    }
  }

  Future<void> storeAttendance({required String nrp, required String token}) async {
    try {
      final request = await _dio.post(
          'attendance/add',
          data: {
            "student_id": nrp,
            "token": token,
            "time": DateTime.now().toString()
          }
      );
    } on DioError catch(e) {
      throw Exception(e.message);
    }
  }

  Future<List<EventModel>> getAllEvent() async {
    try {
      final token = await Helper.getPreference('data');

      final request = await _dio.get('event/all', options: Options(
        headers: {
          "Authorization": "token ${token![0]}"
        }
      ));
      final body = request.data;
      return List<EventModel>.from(body["data"].map((x) => EventModel.fromJson(x)));
    } on DioError catch(e) {
      throw Exception(e.message);
    }
  }

  Future<void> addEvent(String name, String start, String end) async {
    try {
      final token = await Helper.getPreference('data');

      final request = await _dio.post('event/add', options: Options(
          headers: {
            "Authorization": "token ${token![0]}"
          }
      ),
          data: {
            "name": name,
            "start": start,
            "end": end
          }
      );
    } on DioError catch(e) {
      throw Exception(e.message);
    }
  }

  Future<void> deleteEvent(String id) async {
    try {
      final token = await Helper.getPreference('data');

      final request = await _dio.post('event/delete', options: Options(
          headers: {
            "Authorization": "token ${token![0]}"
          }
      ),
        data: {"id": id}
      );

    } on DioError catch(e) {
      throw Exception(e.message);
    }
  }

  Future<void> addAttendance(String token) async {
    try {
      final jwt = await Helper.getPreference('data');

      final request = await _dio.post('attendance/add', options: Options(
          headers: {
            "Authorization": "token ${jwt![0]}"
          }
      ),
          data: {
            "id": jwt[5],
            "token": token,
            "time": DateTime.now().toIso8601String()
          }
      );
    } on DioError catch(e) {
      throw Exception(e.message);
    }
  }

  Future<List<Attendance>> getAllAttendance(String id) async {
    try {
      final token = await Helper.getPreference('data');

      final request = await _dio.get('attendance/all?id=$id', options: Options(
          headers: {
            "Authorization": "token ${token![0]}"
          },
      ));
      final body = request.data;
      return List<Attendance>.from(body["data"].map((x) => Attendance.fromJson(x)));
    } on DioError catch(e) {
      throw Exception(e.message);
    }
  }

  Future<void> deleteAttendance(String id) async {
    try {
      final token = await Helper.getPreference('data');

      final request = await _dio.post('attendance/delete', options: Options(
          headers: {
            "Authorization": "token ${token![0]}"
          }
      ),
          data: {"id": id}
      );

    } on DioError catch(e) {
      throw Exception(e.message);
    }
  }

}