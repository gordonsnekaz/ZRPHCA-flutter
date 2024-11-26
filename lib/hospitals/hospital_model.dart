class HospitalModel {
  String name;
  String address;
  String city;

  HospitalModel({
    required this.name,
    required this.address,
    required this.city,
  });

  factory HospitalModel.fromJson(Map<String, dynamic> json) {
    return HospitalModel(
      name: json['name'],
      address: json['address'],
      city: json['city']['name'],
    );
  }
}