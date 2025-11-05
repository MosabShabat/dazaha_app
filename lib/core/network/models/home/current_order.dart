import 'package:json_annotation/json_annotation.dart';

part 'current_order.g.dart';

@JsonSerializable()
class CurrentOrder {
  CurrentOrder({
    this.uuid,
    this.serviceUuid,
    this.title,
    this.image,
    this.orderId,
    this.date,
    this.time,
    this.timeAgo,
    this.from,
    this.to,
    this.status,
    this.statusText,
  });

  final String? uuid;
  final String? serviceUuid;
  final String? title;
  final String? image;
  final String? orderId;
  final String? date;
  final String? time; // الوقت الحقيقي قد يكون null
  @JsonKey(name: 'time_ago')
  final String? timeAgo; // الوقت بشكل نسبي مثل "2 months ago"
  final String? from;
  final String? to;
  final String? status;
  final String? statusText;

  factory CurrentOrder.fromJson(Map<String, dynamic> json) =>
      _$CurrentOrderFromJson(json);

  Map<String, dynamic> toJson() => _$CurrentOrderToJson(this);
}
