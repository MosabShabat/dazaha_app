import 'package:json_annotation/json_annotation.dart';

part 'receipt_methods.g.dart';

@JsonSerializable()
class ReceiptMethods {
    ReceiptMethods({
        required this.uuid,
        required this.title,
        required this.description,
        required this.image,
    });

    final String? uuid;
    final String? title;
    final dynamic description;
    final String? image;

    factory ReceiptMethods.fromJson(Map<String, dynamic> json) => _$ReceiptMethodsFromJson(json);

    Map<String, dynamic> toJson() => _$ReceiptMethodsToJson(this);

}
