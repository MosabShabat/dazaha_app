import 'package:get/get.dart';

import '../../../core/network/utils/api_service.dart';
import '../controller/notifications_controller.dart';
import '../controller/notifications_repo.dart';

class NotificationsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => NotificationsRepo(Get.find<ApiService>()));
    Get.lazyPut(() => NotificationsController());
  }
}
