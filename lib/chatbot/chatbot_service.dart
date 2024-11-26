// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:health_care_advisor/constants/constants.dart';
import 'package:health_care_advisor/views/utilities/button.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ChatbotService {
  Button button = Button();
  Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('auth_token');
  }

  Future sendMessage(String message) async {
    try {
      var url = Constants.mainUrl + Constants.chatbot;
      String? token = await getToken();

      var data = {"message": message};

      var response = await http
          .post(Uri.parse(url),
              headers: {
                'Authorization': 'Bearer $token',
                "Content-Type": "application/json"
              },
              body: jsonEncode(data))
          .timeout(const Duration(seconds: Constants.timeOut));
      var tokken = button.sendMessage(message);
      return tokken;
    } catch (e) {
      print('Error fetching package subscriptions: $e');
      rethrow;
    }
  }
}
