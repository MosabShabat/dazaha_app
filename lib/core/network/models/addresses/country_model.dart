import 'package:json_annotation/json_annotation.dart';
import 'city_model.dart';

part 'country_model.g.dart';

@JsonSerializable()
class CountryModel {
  final String? uuid;
  final String? name;
  final List<CityModel>? cities;

  CountryModel({
    this.uuid,
    this.name,
    this.cities,
  });

  factory CountryModel.fromJson(Map<String, dynamic> json) =>
      _$CountryModelFromJson(json);

  Map<String, dynamic> toJson() => _$CountryModelToJson(this);
}
