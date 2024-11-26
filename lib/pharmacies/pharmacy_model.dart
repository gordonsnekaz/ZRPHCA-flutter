class PharmacyModel {
  String name;
  String address;
  String city;

  PharmacyModel({
    required this.name,
    required this.address,
    required this.city,
  });

  factory PharmacyModel.fromJson(Map<String, dynamic> json) {
    return PharmacyModel(
      name: json['name'],
      address: json['address'],
      city: json['city']['name'],
    );
  }
}