import 'package:json_annotation/json_annotation.dart';

import 'notification_item.dart';

part 'notifications.g.dart';

@JsonSerializable()
class Notifications {
  @JsonKey(name: 'items')
  final List<NotificationItem>? notification;
  Notifications({
    this.notification,
  });

  factory Notifications.fromJson(Map<String, dynamic> json) =>
      _$NotificationsFromJson(json);

  Map<String, dynamic> toJson() => _$NotificationsToJson(this);
}
