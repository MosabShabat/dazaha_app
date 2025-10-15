import 'package:json_annotation/json_annotation.dart';

part 'coupon.g.dart';

@JsonSerializable()
class Coupon {
  final bool exists;
  final String? code;

  Coupon({
    required this.exists,
    this.code,
  });

  factory Coupon.fromJson(Map<String, dynamic> json) =>
      _$CouponFromJson(json);

  Map<String, dynamic> toJson() => _$CouponToJson(this);
}
