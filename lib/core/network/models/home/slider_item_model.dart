import 'package:json_annotation/json_annotation.dart';

part 'slider_item_model.g.dart';

@JsonSerializable()
class SliderItemModel {
  final String? uuid;
  final String? title;
  final String? subtitle;
  final String? image;
  final String? link;

  SliderItemModel({
    this.uuid,
    this.title,
    this.subtitle,
    this.image,
    this.link,
  });

  factory SliderItemModel.fromJson(Map<String, dynamic> json) =>
      _$SliderItemModelFromJson(json);

  Map<String, dynamic> toJson() => _$SliderItemModelToJson(this);
}
