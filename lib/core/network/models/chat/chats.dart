import '../../../../core/network/models/chat/user_chat.dart';
import 'package:json_annotation/json_annotation.dart';

part 'chats.g.dart';

@JsonSerializable()
class ChatItem {
  ChatItem({
    this.user,
    this.latestMessageTime,
    this.latestMessageContent,
    this.latestMessageContentType,
    this.unreadCount,
  });

  final UserChat? user;

  @JsonKey(name: 'latest_message_time')
  final String? latestMessageTime;

  @JsonKey(name: 'latest_message_content')
  final String? latestMessageContent;

  @JsonKey(name: 'latest_message_content_type')
  final String? latestMessageContentType;

  @JsonKey(name: 'unread_count')
  final int? unreadCount;

  factory ChatItem.fromJson(Map<String, dynamic> json) =>
      _$ChatItemFromJson(json);

  Map<String, dynamic> toJson() => _$ChatItemToJson(this);
}
