import 'package:json_annotation/json_annotation.dart';

part 'bill_item.g.dart';

@JsonSerializable()
class BillItem {
  final String title;
  final String value;

  BillItem({
    required this.title,
    required this.value,
  });

  factory BillItem.fromJson(Map<String, dynamic> json) =>
      _$BillItemFromJson(json);

  Map<String, dynamic> toJson() => _$BillItemToJson(this);
}
