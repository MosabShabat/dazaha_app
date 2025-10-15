import 'package:json_annotation/json_annotation.dart';

part 'service_item_model.g.dart';

@JsonSerializable()
class ServiceItemModel {
  final String? uuid;
  final String? title;
  final String? description;
  final String? image;

  ServiceItemModel({
    this.uuid,
    this.title,
    this.description,
    this.image,
  });

  factory ServiceItemModel.fromJson(Map<String, dynamic> json) =>
      _$ServiceItemModelFromJson(json);

  Map<String, dynamic> toJson() => _$ServiceItemModelToJson(this);
}
