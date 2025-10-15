import 'package:json_annotation/json_annotation.dart';

import 'address_item_model.dart';

part 'addresses_model.g.dart';

@JsonSerializable()
class AddressesModel {
  @JsonKey(name: 'items')
  final List<AddressItemModel>? addressItem;

  AddressesModel({
    this.addressItem,
  });

  factory AddressesModel.fromJson(Map<String, dynamic> json) =>
      _$AddressesModelFromJson(json);

  Map<String, dynamic> toJson() => _$AddressesModelToJson(this);
}
//address_item_model