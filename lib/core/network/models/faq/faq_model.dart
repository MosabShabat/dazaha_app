import 'package:json_annotation/json_annotation.dart';

import 'faq_model_item.dart';

part 'faq_model.g.dart';

@JsonSerializable()
class FaqModel {
  @JsonKey(name: 'items')
  final List<FaqModelItem>? faqModelItem;

  FaqModel({
    this.faqModelItem,
  });

  factory FaqModel.fromJson(Map<String, dynamic> json) =>
      _$FaqModelFromJson(json);

  Map<String, dynamic> toJson() => _$FaqModelToJson(this);
}
