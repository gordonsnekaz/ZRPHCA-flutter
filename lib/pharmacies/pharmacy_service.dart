// ignore_for_file: avoid_print

import 'package:health_care_advisor/constants/constants.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class PharmacyService {
  Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('auth_token');
  }

  Future fetchPharmacies() async {
    try {

      var url = Constants.mainUrl + Constants.pharmacies;
      String? token = await getToken();

      var response = await http.get(
        Uri.parse(url),
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type':
              'application/json',
        },
      ).timeout(const Duration(seconds: Constants.timeOut));

      return response;
    } catch (e) {
      print('Error fetching package subscriptions: $e');
      rethrow;
    }
  }
}
