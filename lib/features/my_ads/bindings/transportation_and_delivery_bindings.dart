import '../../../../features/wallet/controller/wallet_repo.dart';
import '../../../../features/my_ads/controller/transportation_and_delivery_controller.dart';
import 'package:get/get.dart';
import '../../../core/network/utils/api_service.dart';
import '../../choose_the_service/controller/order_data_controller.dart';
import '../../document/controller/document_controller.dart';
import '../../document/controller/document_repo.dart';
import '../../wallet/controller/wallet_controller.dart';
import '../controller/my_ads_repo.dart';

class TransportationAndDeliveryBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DocumentRepo(Get.find<ApiService>()));
    Get.lazyPut(() => MyAdsRepo(Get.find<ApiService>()));
    Get.lazyPut(() => WalletRepo(Get.find<ApiService>()));
    Get.lazyPut(() => OrderDataController());
    Get.lazyPut(() => TransportationAndDeliveryController());
    Get.lazyPut(() => DocumentController());
    Get.lazyPut(() => WalletController());

    //WalletController
  }
}
