import '../../../../core/network/models/chat/message.dart';
import 'package:json_annotation/json_annotation.dart';

part 'general_message.g.dart';

@JsonSerializable()
class GeneralMessage {
  @JsonKey(name: "items")
  final List<Message>? message;

  GeneralMessage({this.message});

  factory GeneralMessage.fromJson(Map<String, dynamic> json) =>
      _$GeneralMessageFromJson(json);

  Map<String, dynamic> toJson() => _$GeneralMessageToJson(this);
}
