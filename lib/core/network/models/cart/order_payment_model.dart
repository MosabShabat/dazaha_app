import 'package:json_annotation/json_annotation.dart';
import 'order_item.dart';
import 'payment_way.dart';
import 'coupon.dart';
import 'bill_item.dart';

part 'order_payment_model.g.dart';

@JsonSerializable()
class OrderPaymentModel {
  final OrderItem item;
  @JsonKey(name: 'payment_ways')
  final List<PaymentWay> paymentWays;
  final Coupon coupon;
  final List<BillItem> bill;
  final String total;
  final String currency;

  OrderPaymentModel({
    required this.item,
    required this.paymentWays,
    required this.coupon,
    required this.bill,
    required this.total,
    required this.currency,
  });

  factory OrderPaymentModel.fromJson(Map<String, dynamic> json) =>
      _$OrderPaymentModelFromJson(json);

  Map<String, dynamic> toJson() => _$OrderPaymentModelToJson(this);
}
