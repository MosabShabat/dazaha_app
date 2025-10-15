import 'package:json_annotation/json_annotation.dart';

part 'address_item_model.g.dart';

@JsonSerializable()
class AddressItemModel {
    AddressItemModel({
        required this.uuid,
        required this.name,
        required this.cityUuid,
        required this.areaUuid,
        required this.street,
        required this.address,
        required this.mobile,
        required this.lat,
        required this.lng,
    });

    final String? uuid;
    final String? name;

    @JsonKey(name: 'city_uuid') 
    final String? cityUuid;

    @JsonKey(name: 'area_uuid') 
    final String? areaUuid;
    final String? street;
    final String? address;
    final String? mobile;
    final String? lat;
    final String? lng;

    factory AddressItemModel.fromJson(Map<String, dynamic> json) => _$AddressItemModelFromJson(json);

    Map<String, dynamic> toJson() => _$AddressItemModelToJson(this);

}
