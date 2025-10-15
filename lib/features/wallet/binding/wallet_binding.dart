import '../../../features/wallet/controller/wallet_controller.dart';
import 'package:get/get.dart';

import '../../../core/network/utils/api_service.dart';
import '../controller/wallet_repo.dart';

class WalletBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WalletRepo>(() => WalletRepo(Get.find<ApiService>()));
    Get.lazyPut(() => WalletController());
  }
}
