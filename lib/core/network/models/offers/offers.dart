import 'package:json_annotation/json_annotation.dart';

part 'offers.g.dart';

@JsonSerializable()
class Offers {
    Offers({
        required this.items,
    });

    final List<Item>? items;

    factory Offers.fromJson(Map<String, dynamic> json) => _$OffersFromJson(json);

    Map<String, dynamic> toJson() => _$OffersToJson(this);

}

@JsonSerializable()
class Item {
    Item({
        required this.offers,
        required this.date,
    });

    final List<Offer>? offers;
    final String? date;

    factory Item.fromJson(Map<String, dynamic> json) => _$ItemFromJson(json);

    Map<String, dynamic> toJson() => _$ItemToJson(this);

}

@JsonSerializable()
class Offer {
    Offer({
        required this.uuid,
        required this.order,
        required this.price,
        required this.currency,
        required this.status,
        required this.statusText,
        required this.addedAt,
    });

    final String? uuid;
    final Order? order;
    final String? price;
    final String? currency;
    final String? status;

    @JsonKey(name: 'status_text') 
    final String? statusText;

    @JsonKey(name: 'added_at') 
    final String? addedAt;

    factory Offer.fromJson(Map<String, dynamic> json) => _$OfferFromJson(json);

    Map<String, dynamic> toJson() => _$OfferToJson(this);

}

@JsonSerializable()
class Order {
    Order({
        required this.uuid,
        required this.title,
        required this.image,
        required this.serviceTitle,
    });

    final String? uuid;
    final String? title;
    final String? image;

    @JsonKey(name: 'service_title') 
    final String? serviceTitle;

    factory Order.fromJson(Map<String, dynamic> json) => _$OrderFromJson(json);

    Map<String, dynamic> toJson() => _$OrderToJson(this);

}
