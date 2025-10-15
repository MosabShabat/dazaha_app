import 'package:json_annotation/json_annotation.dart';
import '../cart/bill_item.dart';

part 'my_order_details.g.dart';

@JsonSerializable()
class MyOrderDetails {
  MyOrderDetails({
    required this.uuid,
    required this.orderId,
    required this.title,
    required this.image,
    required this.serviceTitle,
    required this.likedPrice,
    required this.currency,
    required this.status,
    required this.statusText,
    required this.offersCount,
    required this.offers,
    required this.addedAt,
    required this.from,
    required this.fromAddress,
    required this.fromLat,
    required this.fromLng,
    required this.to,
    required this.toAddress,
    required this.toLat,
    required this.toLng,
    required this.driver,
    required this.date,
    required this.time,
    required this.rating,
    required this.payment,
  });

  final String? uuid;

  @JsonKey(name: 'order_id')
  final String? orderId;
  final String? title;
  final String? image;

  @JsonKey(name: 'service_title')
  final String? serviceTitle;

  @JsonKey(name: 'liked_price')
  final String? likedPrice;
  final String? currency;
  final String? status;

  @JsonKey(name: 'status_text')
  final String? statusText;

  @JsonKey(name: 'offers_count')
  final int? offersCount;

  @JsonKey(name: 'added_at')
  final String? addedAt;

  final List<Offer>? offers;

  // 🟢 الحقول الجديدة من JSON:
  final String? from;
  @JsonKey(name: 'from_address')
  final String? fromAddress;
  @JsonKey(name: 'from_lat')
  final String? fromLat;
  @JsonKey(name: 'from_lng')
  final String? fromLng;

  final String? to;
  @JsonKey(name: 'to_address')
  final String? toAddress;
  @JsonKey(name: 'to_lat')
  final String? toLat;
  @JsonKey(name: 'to_lng')
  final String? toLng;

  final Driver? driver;
  final String? date;
  final String? time;
  final String? rating;
  final Payment? payment;

  factory MyOrderDetails.fromJson(Map<String, dynamic> json) =>
      _$MyOrderDetailsFromJson(json);

  Map<String, dynamic> toJson() => _$MyOrderDetailsToJson(this);
}

@JsonSerializable()
class Offer {
  Offer({
    required this.uuid,
    required this.user,
    required this.price,
    required this.currency,
    required this.addedAt,
  });

  final String? uuid;
  final User? user;
  final String? price;
  final String? currency;

  @JsonKey(name: 'added_at')
  final String? addedAt;

  factory Offer.fromJson(Map<String, dynamic> json) => _$OfferFromJson(json);
  Map<String, dynamic> toJson() => _$OfferToJson(this);
}

@JsonSerializable()
class User {
  User({
    required this.uuid,
    required this.image,
    required this.name,
    required this.rate,
  });

  final String? uuid;
  final String? image;
  final String? name;
  final String? rate;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);
}

@JsonSerializable()
class Driver {
  Driver({
    required this.uuid,
    required this.image,
    required this.name,
    required this.rate,
  });

  final String? uuid;
  final String? image;
  final String? name;
  final String? rate;

  factory Driver.fromJson(Map<String, dynamic> json) => _$DriverFromJson(json);
  Map<String, dynamic> toJson() => _$DriverToJson(this);
}

@JsonSerializable()
class Payment {
  Payment({
    required this.paidAt,
    required this.billNo,
    required this.paymentWayText,
    required this.paymentCardNumber,
    required this.bill,
  });

  @JsonKey(name: 'paid_at')
  final String? paidAt;

  @JsonKey(name: 'bill_no')
  final String? billNo;

  @JsonKey(name: 'payment_way_text')
  final String? paymentWayText;

  @JsonKey(name: 'payment_card_number')
  final String? paymentCardNumber;

  final List<BillItem>? bill;

  factory Payment.fromJson(Map<String, dynamic> json) =>
      _$PaymentFromJson(json);

  Map<String, dynamic> toJson() => _$PaymentToJson(this);
}
