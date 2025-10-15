import '../../../core/constant/exports_libraries.dart';
import '../../../core/network/utils/api_service.dart';
import '../../choose_the_service/controller/order_data_controller.dart';
import '../../price_details/controller/price_details_controller.dart';
import '../controller/advertisement_summary_controller.dart';
import '../controller/advertisement_summary_repo.dart';

class AdvertisementSummaryBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AdvertisementSummaryRepo>(
      () => AdvertisementSummaryRepo(Get.find<ApiService>()),
    );
    //PriceDetailsController
    Get.lazyPut(() => AdvertisementSummaryController());
    Get.lazyPut(() => PriceDetailsController());
    Get.lazyPut(() => OrderDataController());
  }
}
