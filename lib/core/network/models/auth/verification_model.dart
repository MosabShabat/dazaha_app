import 'package:json_annotation/json_annotation.dart';

import 'user_data.dart';

part 'verification_model.g.dart';

@JsonSerializable()
class VerificationModel {
  @JsonKey(name: 'user_exists')
  final bool? userExists;
  final UserData? user;
  final String? code;

  VerificationModel({this.userExists, this.user, this.code});

  factory VerificationModel.fromJson(Map<String, dynamic> json) =>
      _$VerificationModelFromJson(json);

  Map<String, dynamic> toJson() => _$VerificationModelToJson(this);
}
