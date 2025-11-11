import '../../../../features/captain_joins/controller/captain_joins_repo.dart';
import '../../../../features/captain_membership_request/controller/captain_membership_request_controller.dart';

import '../../../../features/document/controller/document_controller.dart';
import 'package:get/get.dart';
import '../../../core/network/utils/api_service.dart';
import '../../captain_joins/controller/captain_joins_controller.dart';
import '../../choose_the_service/controller/order_data_controller.dart';
import '../../my_ads/controller/my_ads_repo.dart';
import '../../my_ads/controller/transportation_and_delivery_controller.dart';
import '../controller/document_repo.dart';

class DocumentBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DocumentRepo(Get.find<ApiService>()));
    Get.lazyPut(() => MyAdsRepo(Get.find<ApiService>()));
    Get.lazyPut(() => CaptainJoinsRepo(Get.find<ApiService>()));

    Get.lazyPut(() => TransportationAndDeliveryController());
    Get.lazyPut(() => OrderDataController());
    Get.lazyPut(() => DocumentController());
    Get.lazyPut(() => CaptainJoinsController());
    Get.lazyPut(() => CaptainMembershipRequestController());
  }
}
