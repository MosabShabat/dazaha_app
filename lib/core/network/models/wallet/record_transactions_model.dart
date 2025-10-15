import 'package:json_annotation/json_annotation.dart';

part 'record_transactions_model.g.dart';

@JsonSerializable()
class RecordTransactionsModel {
  final String? uuid;
  final String? image;
  final String? name;

  @JsonKey(name: 'date_time')
  final String? dateTime;
  final String? amount;
  final String? currency;
  final String? type;
  final String? status;

  @JsonKey(name: 'status_text')
  final String? statusText;

  RecordTransactionsModel({
    this.uuid,
    this.image,
    this.name,
    this.dateTime,
    this.amount,
    this.currency,
    this.type,
    this.status,
    this.statusText,
  });

  factory RecordTransactionsModel.fromJson(Map<String, dynamic> json) =>
      _$RecordTransactionsModelFromJson(json);

  Map<String, dynamic> toJson() => _$RecordTransactionsModelToJson(this);
}
