class RecordModel {
  int patientId;
  String diagnosedBy;
  String diagnosisDate;
  String symptoms;
  String diagnosis;
  String prescribedMedication;
  String notes;

  RecordModel({
    required this.patientId,
    required this.diagnosedBy,
    required this.diagnosisDate,
    required this.symptoms,
    required this.diagnosis,
    required this.prescribedMedication,
    required this.notes,
  });

  factory RecordModel.fromJson(Map<String, dynamic> json) {
    return RecordModel(
      patientId: json['patient_id'] ?? 0,
      diagnosedBy: json['diagnosed_by'] ?? '',
      diagnosisDate: json['diagnosis_date'] ?? '',
      symptoms: json['symptoms'] ?? '',
      diagnosis: json['diagnosis'] ?? '',
      prescribedMedication: json['prescribed_medication'] ?? '',
      notes: json['notes'] ?? '',
    );
  }
}
