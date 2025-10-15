import 'package:json_annotation/json_annotation.dart';

import '../home/latest_order_item_model.dart';

part 'order_service_model.g.dart';

@JsonSerializable()
class OrdersSerModel {
  OrdersSerModel({required this.items});

  final List<LatestOrderItemModel>? items;

  factory OrdersSerModel.fromJson(Map<String, dynamic> json) =>
      _$OrdersSerModelFromJson(json);

  Map<String, dynamic> toJson() => _$OrdersSerModelToJson(this);
}
