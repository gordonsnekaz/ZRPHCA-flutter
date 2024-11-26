class ClientModel {
  final String firstName;
  final String lastName;
  final String email;
  final DateTime dob;
  final String gender;
  final String mobile;
  final String nationalId;
  final String bloodType;
  final String address;
  final String password;

  ClientModel({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.dob,
    required this.gender,
    required this.mobile,
    required this.nationalId,
    required this.bloodType,
    required this.address,
    required this.password, 
  });

  factory ClientModel.fromJson(Map<String, dynamic> json) {
    return ClientModel(
      firstName: json['firstName'],
      lastName: json['lastName'],
      email: json['email'],
      dob: DateTime.parse(json['dob']),
      gender: json['gender'],
      mobile: json['mobile'],
      nationalId: json['nationalId'],
      address: json['address'],
      bloodType: json['bloodType'],
      password: json['password'], 
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'dob': dob.toIso8601String(),
      'gender': gender,
      'mobile': mobile,
      'nationalId': nationalId,
      'address': address,
      'bloodType': bloodType,
      'password': password,
    };
  }
}
