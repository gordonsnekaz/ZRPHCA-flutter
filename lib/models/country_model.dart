import 'package:health_care_advisor/models/city_model.dart';

class CountryModel {
  final String name;
  final String id;
  final String code;
  final List<CityModel> cities;

  CountryModel({
    required this.name,
    required this.id,
    required this.code,
    required this.cities,
  });

  factory CountryModel.fromJson(Map<String, dynamic> json) {
    var citiesFromJson = json['cities'] as List;
    List<CityModel> citiesList = citiesFromJson.map((cityJson) => CityModel.fromJson(cityJson)).toList();

    return CountryModel(
      name: json['name'],
      id: json['id'],
      code: json['code'],
      cities: citiesList,
    );
  }
}
