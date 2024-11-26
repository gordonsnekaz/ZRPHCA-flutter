class AppointmentModel {
  final String reason;
  final DateTime appointmentDate;
  final String time;

  AppointmentModel({
    required this.reason,
    required this.appointmentDate,
    required this.time,
  });

  factory AppointmentModel.fromJson(Map<String, dynamic> json) {
    return AppointmentModel(
      reason: json['title'],
      appointmentDate: DateTime.parse(json['dob']),
      time: json['gender'],
    );
  }
}
