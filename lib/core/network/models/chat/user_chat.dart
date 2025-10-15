import 'package:json_annotation/json_annotation.dart';

part 'user_chat.g.dart';

@JsonSerializable()
class UserChat {
  final String? uuid;
  final String? image;
  final String? name;

  UserChat({
    this.uuid,
    this.image,
    this.name,
    this.isOnline,
    this.isVerified,
  });

  @JsonKey(name: 'is_online')
  final bool? isOnline;

  @JsonKey(name: 'is_verified')
  final bool? isVerified;

  factory UserChat.fromJson(Map<String, dynamic> json) =>
      _$UserChatFromJson(json);

  Map<String, dynamic> toJson() => _$UserChatToJson(this);
}
