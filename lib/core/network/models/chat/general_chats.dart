import '../../../../core/network/models/chat/chats.dart';
import 'package:json_annotation/json_annotation.dart';

part 'general_chats.g.dart';

@JsonSerializable()
class GeneralChats {
  @JsonKey(name: 'items')
  final List<ChatItem>? chatItem;

  GeneralChats({this.chatItem});

  factory GeneralChats.fromJson(Map<String, dynamic> json) =>
      _$GeneralChatsFromJson(json);

  Map<String, dynamic> toJson() => _$GeneralChatsToJson(this);
}
