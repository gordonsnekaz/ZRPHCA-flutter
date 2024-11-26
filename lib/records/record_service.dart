// ignore_for_file: avoid_print

import 'package:health_care_advisor/constants/constants.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class RecordService {
  Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('auth_token');
  }

  Future<String?> getUserId() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('user_id');
  }

  Future fetchRecords() async {
    try {
      String? token = await getToken();
      String? userId = await getUserId();

      var url = Uri.parse("${Constants.mainUrl}${Constants.records}/$userId");

      var response = await http.get(url, headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      }).timeout(const Duration(seconds: Constants.timeOut));

      return response;
    } catch (e) {
      print('Error fetching package subscriptions: $e');
      rethrow;
    }
  }
}
