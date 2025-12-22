import 'package:json_annotation/json_annotation.dart';

part 'message.g.dart';

@JsonSerializable()
class Message {
  @JsonKey(name: 'content')
  final String? content;

  @JsonKey(name: 'content_type')
  final String? contentType;
  @JsonKey(name: 'time_age')
  final String? timeAge;
  @JsonKey(name: 'is_me')
  final bool? isMe;

  Message({this.content, this.contentType, this.timeAge, this.isMe});

  factory Message.fromJson(Map<String, dynamic> json) =>
      _$MessageFromJson(json);

  Map<String, dynamic> toJson() => _$MessageToJson(this);
}
