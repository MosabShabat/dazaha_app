import 'package:json_annotation/json_annotation.dart';

import 'times_order.dart';

part 'order_details.g.dart';

@JsonSerializable()
class OrderDetails {
  OrderDetails({
    required this.uuid,
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
    required this.items,
    required this.title,
    required this.description,
    required this.sizeTitle,
    required this.helpers,
    required this.likedPrice,
    required this.currency,
    required this.image,
    required this.images,
  });

  final String? uuid;
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

  final List<OrderItem>? items;
  final String? title;
  final String? description;

  @JsonKey(name: 'size_title')
  final String? sizeTitle;

  final int? helpers;

  @JsonKey(name: 'liked_price')
  final String? likedPrice;

  final String? currency;
  final String? image;
  final List<ImageItem>? images;

  factory OrderDetails.fromJson(Map<String, dynamic> json) =>
      _$OrderDetailsFromJson(json);

  Map<String, dynamic> toJson() => _$OrderDetailsToJson(this);
}

@JsonSerializable()
class OrderItem {
  OrderItem({
    required this.name,
    required this.quantity,
    required this.type,
  });

  final String? name;
  final String? quantity;
  final String? type;

  factory OrderItem.fromJson(Map<String, dynamic> json) =>
      _$OrderItemFromJson(json);

  Map<String, dynamic> toJson() => _$OrderItemToJson(this);
}

@JsonSerializable()
class ImageItem {
  ImageItem({
    required this.uuid,
    required this.image,
  });

  final String? uuid;
  final String? image;

  factory ImageItem.fromJson(Map<String, dynamic> json) =>
      _$ImageItemFromJson(json);

  Map<String, dynamic> toJson() => _$ImageItemToJson(this);
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
