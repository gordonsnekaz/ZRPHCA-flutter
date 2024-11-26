class ProfileModel {
  final int id;
  final String address;
  final String firstName;
  final String lastName;
  final String email;
  final String mobile;
  final DateTime dob;
  final String gender;
  final String nationalId;
  final String bloodType;
  final String emergencyContact;
  final int userId;

  ProfileModel({
    required this.id,
    required this.address,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.mobile,
    required this.dob,
    required this.gender,
    required this.nationalId,
    required this.bloodType,
    required this.emergencyContact,
    required this.userId,
  });

  factory ProfileModel.fromJson(Map<String, dynamic> json) {
    return ProfileModel(
      id: json['id'] as int,
      address: json['address'] as String? ?? '',
      firstName: json['first_name'] as String? ?? '',
      lastName: json['last_name'] as String? ?? '',
      email: json['email'] as String? ?? '',
      mobile: json['phone_number'] as String? ?? '',
      dob: DateTime.parse(json['date_of_birth'] as String),
      gender: json['gender'] as String? ?? '',
      nationalId: json['id_number'] as String? ?? '',
      bloodType: json['blood_type'] as String? ?? '',
      emergencyContact: json['emergency_contact'] as String? ?? '',
      userId: json['user_id'] as int,
    );
  }
}
