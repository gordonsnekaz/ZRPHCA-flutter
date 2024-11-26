class CityModel {
  final String name;
  final String id;

  CityModel({
    required this.name,
    required this.id,
  });

  factory CityModel.fromJson(Map<String, dynamic> json) {
    return CityModel(
      name: json['name'],
      id: json['id'],
    );
  }
}
