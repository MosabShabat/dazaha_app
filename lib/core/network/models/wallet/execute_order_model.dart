import 'package:json_annotation/json_annotation.dart';

part 'execute_order_model.g.dart';

@JsonSerializable()
class ExecuteOrderModel {
  @JsonKey(name: 'payment_uuid')
  final String? paymentUuid;
  final String? status;

  @JsonKey(name: 'payment_way_uuid')
  final String? paymentWayUuid;

  final int? amount;

  final String? currency;
  final String? description;

  @JsonKey(name: 'api_key')
  final String? apiKey;

  @JsonKey(name: 'merchant_id')
  final String? merchantId;

  ExecuteOrderModel({
    this.paymentUuid,
    this.status,
    this.paymentWayUuid,
    this.amount,
    this.currency,
    this.description,
    this.apiKey,
    this.merchantId,
  });

  factory ExecuteOrderModel.fromJson(Map<String, dynamic> json) =>
      _$ExecuteOrderModelFromJson(json);

  Map<String, dynamic> toJson() => _$ExecuteOrderModelToJson(this);
}
