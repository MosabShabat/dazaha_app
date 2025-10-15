import 'package:json_annotation/json_annotation.dart';

part 'payment_way.g.dart';

@JsonSerializable()
class PaymentWay {
  final String uuid;
  final String name;
  final String image;
  final String? balance;

  PaymentWay({
    required this.uuid,
    required this.name,
    required this.image,
    this.balance,
  });

  factory PaymentWay.fromJson(Map<String, dynamic> json) =>
      _$PaymentWayFromJson(json);

  Map<String, dynamic> toJson() => _$PaymentWayToJson(this);
}
