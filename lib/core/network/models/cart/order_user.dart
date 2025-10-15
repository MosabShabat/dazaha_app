import 'package:json_annotation/json_annotation.dart';

part 'order_user.g.dart';

@JsonSerializable()
class OrderUser {
  final String uuid;
  final String image;
  final String name;
  final String rate;

  OrderUser({
    required this.uuid,
    required this.image,
    required this.name,
    required this.rate,
  });

  factory OrderUser.fromJson(Map<String, dynamic> json) =>
      _$OrderUserFromJson(json);

  Map<String, dynamic> toJson() => _$OrderUserToJson(this);
}
