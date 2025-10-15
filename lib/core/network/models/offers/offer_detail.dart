import 'package:json_annotation/json_annotation.dart';
import '../orders/my_order_details.dart';
import '../orders/order_details.dart';
part 'offer_detail.g.dart';

@JsonSerializable()
class OfferDetail {
  OfferDetail({
    required this.uuid,
    required this.price,
    required this.currency,
    required this.time,
    required this.status,
    required this.statusText,
    required this.addedAt,
    required this.rating,
    required this.order,
  });

  final String? uuid;
  final String? price;
  final String? currency;
  final String? time;
  final String? status;

  @JsonKey(name: 'status_text')
  final String? statusText;

  @JsonKey(name: 'added_at')
  final String? addedAt;

  final String? rating;

  final Order? order;

  factory OfferDetail.fromJson(Map<String, dynamic> json) =>
      _$OfferDetailFromJson(json);

  Map<String, dynamic> toJson() => _$OfferDetailToJson(this);
}

@JsonSerializable()
class Order {
  Order({
    required this.uuid,
    required this.orderId,
    required this.title,
    required this.serviceUuid,
    required this.serviceTitle,
    required this.description,
    required this.items,
    required this.date,
    required this.times,
    required this.from,
    required this.fromAddress,
    required this.fromLat,
    required this.fromLng,
    required this.to,
    required this.toAddress,
    required this.toLat,
    required this.toLng,
    required this.receiptMethod,
    required this.size,
    required this.helpers,
    required this.images,
    required this.likedPrice,
    required this.currency,
    required this.distance,
    required this.image,
    required this.user,
    required this.payment,
    required this.time,
    required this.rating,
  });

  final String? uuid;

  @JsonKey(name: 'order_id')
  final String? orderId;
  final String? title;

  @JsonKey(name: 'service_uuid')
  final String? serviceUuid;

  @JsonKey(name: 'service_title')
  final String? serviceTitle;
  final String? description;
  final List<OrderItem>? items;
  final String? date; // JSON يحتوي على التاريخ كـ String
  final List<Time>? times;
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

  @JsonKey(name: 'receipt_method')
  final ReceiptMethod? receiptMethod;

  final Size? size;
  final int? helpers;
  final List<Image>? images;

  @JsonKey(name: 'liked_price')
  final String? likedPrice;
  final String? currency;
  final String? distance;
  final String? image;
  final User? user;

  final Payment? payment;
  final String? time;
  final String? rating;

  factory Order.fromJson(Map<String, dynamic> json) => _$OrderFromJson(json);

  Map<String, dynamic> toJson() => _$OrderToJson(this);
}

@JsonSerializable()
class Time {
  Time({required this.uuid, required this.time});

  final String? uuid;
  final String? time;

  factory Time.fromJson(Map<String, dynamic> json) => _$TimeFromJson(json);

  Map<String, dynamic> toJson() => _$TimeToJson(this);
}

@JsonSerializable()
class Image {
  Image({required this.uuid, required this.image});

  final String? uuid;
  final String? image;

  factory Image.fromJson(Map<String, dynamic> json) => _$ImageFromJson(json);

  Map<String, dynamic> toJson() => _$ImageToJson(this);
}

@JsonSerializable()
class ReceiptMethod {
  ReceiptMethod({
    required this.uuid,
    required this.title,
    required this.description,
    required this.image,
  });

  final String? uuid;
  final String? title;
  final String? description;
  final String? image;

  factory ReceiptMethod.fromJson(Map<String, dynamic> json) =>
      _$ReceiptMethodFromJson(json);

  Map<String, dynamic> toJson() => _$ReceiptMethodToJson(this);
}

@JsonSerializable()
class Size {
  Size({required this.uuid, required this.title, required this.image});

  final String? uuid;
  final String? title;
  final String? image;

  factory Size.fromJson(Map<String, dynamic> json) => _$SizeFromJson(json);

  Map<String, dynamic> toJson() => _$SizeToJson(this);
}

@JsonSerializable()
class User {
  User({
    required this.uuid,
    required this.fullName,
    required this.image,
    required this.ordersCount,
    required this.ratingPercentage,
  });

  final String? uuid;

  @JsonKey(name: 'full_name')
  final String? fullName;
  final String? image;

  @JsonKey(name: 'orders_count')
  final int? ordersCount;

  @JsonKey(name: 'rating_percentage')
  final int? ratingPercentage;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
