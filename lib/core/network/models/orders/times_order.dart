//times_order

import 'package:json_annotation/json_annotation.dart';

part 'times_order.g.dart';

@JsonSerializable()
class TimesOrder {
    TimesOrder({
        required this.uuid,
        required this.time,
    });

    final String? uuid;
    final String? time;

    factory TimesOrder.fromJson(Map<String, dynamic> json) => _$TimesOrderFromJson(json);

    Map<String, dynamic> toJson() => _$TimesOrderToJson(this);

}
