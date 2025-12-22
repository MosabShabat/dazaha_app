import 'package:json_annotation/json_annotation.dart';
import '../../helpers/constants.dart';
import 'api_error_model.dart';
import 'pages.dart';
part 'app_response.g.dart';

@JsonSerializable()
class AppResponse {
  bool? status;
  String? message;
  @JsonKey(name: 'unread_notifications_count')
  int? unreadNotificationsCount;
  @JsonKey(name: 'unread_messages_count')
  int? unreadMessagesCount;
  @JsonKey(name: 'cart_count')
  int? cartCount;
  dynamic data;
  Pages? pages;
  List<ApiErrorModel>? errors;

  AppResponse({
    this.status,
    this.message,
    this.unreadNotificationsCount,
    this.cartCount,
    this.unreadMessagesCount,
    this.data,
    this.pages,
    this.errors,
  }) {
    AppConstants.setUnreadNotificationsCount(unreadNotificationsCount);
    // AppConstants.setCartCount(cartCount);
    // AppConstants.setUnreadChatsCount(unreadMessagesCount);
  }

  factory AppResponse.fromJson(Map<String, dynamic> json) =>
      _$AppResponseFromJson(json);

  Map<String, dynamic> toJson() => _$AppResponseToJson(this);

  @override
  String toString() {
    return 'AppResponse(status: $status, data: $data)';
  }
}
