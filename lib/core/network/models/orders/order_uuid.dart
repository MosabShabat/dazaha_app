import 'package:json_annotation/json_annotation.dart';

part 'order_uuid.g.dart';

@JsonSerializable()
class OrderUuid {
    OrderUuid({
        required this.uuid,
        required this.exceptPrice,
        required this.currency,
        required this.orderId,
    });

    final String? uuid;

    @JsonKey(name: 'except_price') 
    final String? exceptPrice;
    final String? currency;

    @JsonKey(name: 'order_id') 
    final String? orderId;

    factory OrderUuid.fromJson(Map<String, dynamic> json) => _$OrderUuidFromJson(json);

    Map<String, dynamic> toJson() => _$OrderUuidToJson(this);

}
