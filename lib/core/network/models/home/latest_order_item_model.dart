import 'package:json_annotation/json_annotation.dart';

part 'latest_order_item_model.g.dart';

@JsonSerializable()
class LatestOrderItemModel {
  final String? uuid;

  @JsonKey(name: 'service_image')
  final String? serviceImage;

  final String? title;
  final String? image;

  @JsonKey(name: 'liked_price')
  final String? likedPrice;

  final String? currency;

  LatestOrderItemModel({
    this.uuid,
    this.serviceImage,
    this.title,
    this.image,
    this.likedPrice,
    this.currency,
  });

  factory LatestOrderItemModel.fromJson(Map<String, dynamic> json) =>
      _$LatestOrderItemModelFromJson(json);

  Map<String, dynamic> toJson() => _$LatestOrderItemModelToJson(this);
}
