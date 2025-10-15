import '../../../../features/document/controller/document_controller.dart';
import 'package:get/get.dart';
import '../../../core/network/utils/api_service.dart';
import '../../choose_the_service/controller/order_data_controller.dart';
import '../../my_ads/controller/my_ads_repo.dart';
import '../../my_ads/controller/transportation_and_delivery_controller.dart';
import '../controller/document_repo.dart';

class DocumentBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DocumentRepo(Get.find<ApiService>()));
    Get.lazyPut(() => MyAdsRepo(Get.find<ApiService>()));
    Get.lazyPut(() => TransportationAndDeliveryController());
    Get.lazyPut(() => OrderDataController());
    Get.lazyPut(() => DocumentController());
  }
}
