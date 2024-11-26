import 'dart:convert';
import 'package:health_care_advisor/appointment/appointment_model.dart';
import 'package:health_care_advisor/constants/constants.dart';
import 'package:http/http.dart' as http;

class ScheduleAppointmentService {
  Future<http.Response> bookAppointment(AppointmentModel appointment) async {
    var url = Constants.mainUrl + Constants.appointment;

    final response = await http.post(
      Uri.parse(url),
      headers: {'Content-Type': 'application/json'},
      //body: jsonEncode(appointment.toJson()),
    );

    return response;
  }
}
