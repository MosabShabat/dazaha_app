import 'package:json_annotation/json_annotation.dart';

import 'record_transactions_model.dart';

part 'wallet_model.g.dart';

@JsonSerializable()
class WalletModel {
  WalletModel({
    required this.wallet,
    required this.currency,
    required this.recordTransactionsModel,
  });

  @JsonKey(name: 'items')
  final List<RecordTransactionsModel>? recordTransactionsModel;
  final String? wallet;
  final String? currency;

  factory WalletModel.fromJson(Map<String, dynamic> json) =>
      _$WalletModelFromJson(json);

  Map<String, dynamic> toJson() => _$WalletModelToJson(this);
}
