import '../../../features/captain_joins/controller/captain_joins_controller.dart';
import 'package:get/get.dart';

import '../../../core/network/utils/api_service.dart';
import '../controller/captain_joins_repo.dart';

class CaptainJoinsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CaptainJoinsRepo>(
      () => CaptainJoinsRepo(Get.find<ApiService>()),
    );
    Get.lazyPut(() => CaptainJoinsController());
  }
}
