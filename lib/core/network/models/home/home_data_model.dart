import '../../../../core/network/models/home/current_order.dart';
import 'package:json_annotation/json_annotation.dart';
import '../auth/user_data.dart';
import 'service_item_model.dart';
import 'latest_order_item_model.dart';
import 'slider_item_model.dart';

part 'home_data_model.g.dart';

@JsonSerializable()
class HomeDataModel {
  final UserData? user;

  final List<ServiceItemModel>? services;

  @JsonKey(name: 'latest_orders')
  final List<LatestOrderItemModel>? latestOrders;

  @JsonKey(name: 'current_order')
  final CurrentOrder? currentOrder;
  @JsonKey(name: 'current_offer')
  final CurrentOrder? currentOffer;

  @JsonKey(name: 'sliders')
  final List<SliderItemModel>? sliders;

  HomeDataModel({
    this.user,
    this.services,
    this.latestOrders,
    this.currentOrder,
    this.sliders,
    this.currentOffer,
  });

  factory HomeDataModel.fromJson(Map<String, dynamic> json) =>
      _$HomeDataModelFromJson(json);

  Map<String, dynamic> toJson() => _$HomeDataModelToJson(this);
}
