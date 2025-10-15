import 'package:json_annotation/json_annotation.dart';

part 'my_orders.g.dart';

@JsonSerializable()
class MyOrders {
  MyOrders({required this.items});

  final List<ItemMyOrders>? items;

  factory MyOrders.fromJson(Map<String, dynamic> json) =>
      _$MyOrdersFromJson(json);

  Map<String, dynamic> toJson() => _$MyOrdersToJson(this);
}

@JsonSerializable()
class ItemMyOrders {
  ItemMyOrders({required this.orders, required this.date});

  final List<Order>? orders;
  final String? date;

  factory ItemMyOrders.fromJson(Map<String, dynamic> json) =>
      _$ItemMyOrdersFromJson(json);

  Map<String, dynamic> toJson() => _$ItemMyOrdersToJson(this);
}

@JsonSerializable()
class Order {
  Order({
    required this.uuid,
    required this.title,
    required this.image,
    required this.serviceTitle,
    required this.text,
    required this.status,
    required this.statusText,
    required this.offersCount,
  });

  final String? uuid;
  final String? title;
  final String? image;

  @JsonKey(name: 'service_title')
  final String? serviceTitle;
  final String? text;
  final String? status;

  @JsonKey(name: 'status_text')
  final String? statusText;

  @JsonKey(name: 'offers_count')
  final int? offersCount;

  factory Order.fromJson(Map<String, dynamic> json) => _$OrderFromJson(json);

  Map<String, dynamic> toJson() => _$OrderToJson(this);
}
