import 'package:json_annotation/json_annotation.dart';

part 'user_not.g.dart';

@JsonSerializable()
class UserNot {
  UserNot({
    required this.uuid,
    required this.image,
    required this.name,
    required this.rate,
    required this.mobile,
  });

  final String? uuid;
  final String? image;
  final String? name;
  final String? rate;
  final String? mobile;

  factory UserNot.fromJson(Map<String, dynamic> json) =>
      _$UserNotFromJson(json);

  Map<String, dynamic> toJson() => _$UserNotToJson(this);
}
