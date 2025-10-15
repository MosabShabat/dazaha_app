import 'package:json_annotation/json_annotation.dart';

part 'user_data.g.dart';

@JsonSerializable()
class UserData {
  UserData({
    required this.uuid,
    required this.firstName,
    required this.lastName,
    required this.name,
    required this.mobile,
    required this.mobilePrefix,
    required this.mobileNumber,
    required this.isDriver,
    required this.email,
    required this.image,
    required this.token,
  });

  final String? uuid;

  @JsonKey(name: 'first_name')
  final String? firstName;

  @JsonKey(name: 'last_name')
  final String? lastName;
  final String? name;
  final String? mobile;

  @JsonKey(name: 'mobile_prefix')
  final String? mobilePrefix;

  @JsonKey(name: 'mobile_number')
  final String? mobileNumber;

  @JsonKey(name: 'is_driver')
  final dynamic isDriver;
  final String? email;
  final String? image;
  final String? token;

  factory UserData.fromJson(Map<String, dynamic> json) =>
      _$UserDataFromJson(json);

  Map<String, dynamic> toJson() => _$UserDataToJson(this);
}
