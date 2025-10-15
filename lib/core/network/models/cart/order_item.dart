import 'package:json_annotation/json_annotation.dart';
import 'order_user.dart';

part 'order_item.g.dart';

@JsonSerializable()
class OrderItem {
  final String uuid;
  final String title;
  final String image;
  @JsonKey(name: 'service_title')
  final String serviceTitle;
  final OrderUser user;
  final String price;
  final String currency;

  OrderItem({
    required this.uuid,
    required this.title,
    required this.image,
    required this.serviceTitle,
    required this.user,
    required this.price,
    required this.currency,
  });

  factory OrderItem.fromJson(Map<String, dynamic> json) =>
      _$OrderItemFromJson(json);

  Map<String, dynamic> toJson() => _$OrderItemToJson(this);
}
