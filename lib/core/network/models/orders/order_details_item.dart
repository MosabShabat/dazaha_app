//order_details_item
import 'package:json_annotation/json_annotation.dart';

import 'order_details.dart';
import 'times_order.dart';

part 'order_details_item.g.dart';

@JsonSerializable()
class OrdersDetailsItem {
  OrdersDetailsItem({
    required this.uuid,
    required this.serviceUuid,
    required this.title,
    required this.serviceTitle,
    required this.description,
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
    required this.items,
    required this.likedPrice,
    required this.currency,
    required this.distance,
    required this.image,
    required this.user,
  });

  final String? uuid;
  @JsonKey(name: 'service_uuid')
  final String? serviceUuid;

  final String? title;

  @JsonKey(name: 'service_title')
  final String? serviceTitle;
  final String? description;
  final String? date;
  final List<TimesOrder>? times;
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
  final ReceiptMethod? size;
  final int? helpers;
  final List<OrderItem>? items;
  final List<Image>? images;

  @JsonKey(name: 'liked_price')
  final String? likedPrice;
  final String? currency;
  final String? distance;
  final String? image;
  final User? user;

  factory OrdersDetailsItem.fromJson(Map<String, dynamic> json) =>
      _$OrdersDetailsItemFromJson(json);

  Map<String, dynamic> toJson() => _$OrdersDetailsItemToJson(this);
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
  final dynamic description;
  final String? image;

  factory ReceiptMethod.fromJson(Map<String, dynamic> json) =>
      _$ReceiptMethodFromJson(json);

  Map<String, dynamic> toJson() => _$ReceiptMethodToJson(this);
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
