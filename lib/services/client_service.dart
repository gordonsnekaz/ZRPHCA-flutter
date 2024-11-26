import 'dart:convert';
import 'package:health_care_advisor/constants/constants.dart';
import 'package:health_care_advisor/models/client_model.dart';
import 'package:http/http.dart' as http;

class ClientService {
  //login client
  Future loginClient(String email, String password) async {
    var url = Constants.mainUrl + Constants.loginUrl;

    var data = {"login": email, "password": password};

    // Starting Web API Call.
    var response = await http
        .post(Uri.parse(url),
            headers: {"Content-Type": "application/json"},
            body: jsonEncode(data))
        .timeout(const Duration(seconds: Constants.timeOut));

    return response;
  }

  //register client
  // Future<http.Response> registerClient(ClientModel clientModel) async {
  //   var url = Constants.mainUrl + Constants.registrationUrl;

  //   final response = await http.post(
  //     Uri.parse(url),
  //     headers: {'Content-Type': 'application/json'},
  //     body: jsonEncode(clientModel.toJson()),
  //   );

  //   return response;
  // }
}
