
import '../../../core/constant/exports_libraries.dart';
import '../../../core/network/utils/api_service.dart';
import '../../choose_the_service/controller/order_data_controller.dart';
import '../controller/price_details_controller.dart';
import '../controller/price_details_repo.dart';

class PriceDetailsBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PriceDetailsRepo>(
      () => PriceDetailsRepo(Get.find<ApiService>()),
    );
    Get.lazyPut(() => PriceDetailsController());
    Get.lazyPut(() => OrderDataController());
  }
}
