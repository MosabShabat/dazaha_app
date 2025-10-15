import 'package:json_annotation/json_annotation.dart';
import 'area_model.dart';

part 'city_model.g.dart';

@JsonSerializable()
class CityModel {
  final String? uuid;
  final String? name;
  final List<AreaModel>? areas;

  CityModel({
    this.uuid,
    this.name,
    this.areas,
  });

  factory CityModel.fromJson(Map<String, dynamic> json) =>
      _$CityModelFromJson(json);

  Map<String, dynamic> toJson() => _$CityModelToJson(this);
}
