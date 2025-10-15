import 'package:json_annotation/json_annotation.dart';

part 'faq_model_item.g.dart';

@JsonSerializable()
class FaqModelItem {
  final String? question;
  final String? answer;

  FaqModelItem({
    this.question,
    this.answer,
  });

  factory FaqModelItem.fromJson(Map<String, dynamic> json) =>
      _$FaqModelItemFromJson(json);

  Map<String, dynamic> toJson() => _$FaqModelItemToJson(this);
}
