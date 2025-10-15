import 'package:json_annotation/json_annotation.dart';

part 'current_order.g.dart';

@JsonSerializable()
class CurrentOrder {
    CurrentOrder({
        required this.uuid,
        required this.title,
        required this.image,
        required this.serviceUuid,
        required this.orderId,
        required this.date,
        required this.time,
        required this.from,
        required this.to,
        required this.status,
        required this.statusText,
    });

    final String? uuid;
    @JsonKey(name: 'service_uuid')
    final String? serviceUuid;
    final String? title;
    final String? image;
    @JsonKey(name: 'order_id') 
    final String? orderId;
    final DateTime? date;
    final dynamic time;
    final String? from;
    final String? to;
    final String? status;

    @JsonKey(name: 'status_text') 
    final String? statusText;

    factory CurrentOrder.fromJson(Map<String, dynamic> json) => _$CurrentOrderFromJson(json);

    Map<String, dynamic> toJson() => _$CurrentOrderToJson(this);

}
