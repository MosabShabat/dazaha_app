import '../../../features/wallet/controller/wallet_controller.dart';
import 'package:get/get.dart';

import '../../../core/network/utils/api_service.dart';
import '../../document/controller/document_controller.dart';
import '../../document/controller/document_repo.dart';
import '../../my_ads/controller/my_ads_repo.dart';
import '../../my_ads/controller/transportation_and_delivery_controller.dart';
import '../controller/wallet_repo.dart';

class WalletBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WalletRepo>(() => WalletRepo(Get.find<ApiService>()));
    Get.lazyPut(() => DocumentRepo(Get.find<ApiService>()));
    Get.lazyPut(() => MyAdsRepo(Get.find<ApiService>()));
    Get.lazyPut(() => TransportationAndDeliveryController());
    Get.lazyPut(() => DocumentController());
    Get.lazyPut(() => WalletController());
  }
}
