import 'package:json_annotation/json_annotation.dart';

part 'current_order.g.dart';

@JsonSerializable()
class CurrentOrder {
  final String? uuid;
  final String? title;
  @JsonKey(name: 'service_uuid')
  final String? serviceUuid;
  final String? image;

  @JsonKey(name: 'order_id')
  final String? orderId;

  final String? date;
  final String? time;
  final String? from;
  final String? to;
  final String? status;

  @JsonKey(name: 'status_text')
  final String? statusText;

  @JsonKey(name: 'time_ago')
  final String? timeAgo;

  CurrentOrder({
    this.uuid,
    this.title,
    this.serviceUuid,
    this.image,
    this.orderId,
    this.date,
    this.time,
    this.from,
    this.to,
    this.status,
    this.statusText,
    this.timeAgo,
  });

  factory CurrentOrder.fromJson(Map<String, dynamic> json) =>
      _$CurrentOrderFromJson(json);

  Map<String, dynamic> toJson() => _$CurrentOrderToJson(this);
}
