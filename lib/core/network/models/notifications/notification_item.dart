import 'package:json_annotation/json_annotation.dart';

part 'notification_item.g.dart';

@JsonSerializable()
class NotificationItem {
    NotificationItem({
        required this.uuid,
        required this.image,
        required this.title,
        required this.body,
        required this.type,
        required this.isSeen,
        required this.referenceUuid,
        required this.referenceType,
        required this.timeAgo,
    });

    final String? uuid;
    final String? image;
    final String? title;
    final String? body;
    final String? type;

    @JsonKey(name: 'is_seen') 
    final bool? isSeen;

    @JsonKey(name: 'reference_uuid') 
    final dynamic referenceUuid;

    @JsonKey(name: 'reference_type') 
    final dynamic referenceType;

    @JsonKey(name: 'time_ago') 
    final String? timeAgo;

    factory NotificationItem.fromJson(Map<String, dynamic> json) => _$NotificationItemFromJson(json);

    Map<String, dynamic> toJson() => _$NotificationItemToJson(this);

}
