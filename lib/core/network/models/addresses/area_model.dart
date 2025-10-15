import 'package:json_annotation/json_annotation.dart';

part 'area_model.g.dart';

@JsonSerializable()
class AreaModel {
  final String? uuid;
  final String? name;

  AreaModel({
    this.uuid,
    this.name,
  });

  factory AreaModel.fromJson(Map<String, dynamic> json) =>
      _$AreaModelFromJson(json);

  Map<String, dynamic> toJson() => _$AreaModelToJson(this);
}
