import '../../../../features/summary/controller/summary_controller.dart';
import 'package:get/get.dart';

import '../../../core/network/utils/api_service.dart';
import '../../advertisement_summary/controller/advertisement_summary_controller.dart';
import '../../advertisement_summary/controller/advertisement_summary_repo.dart';
import '../../choose_the_service/controller/order_data_controller.dart';
import '../../price_details/controller/price_details_controller.dart';

class SummaryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AdvertisementSummaryRepo>(
      () => AdvertisementSummaryRepo(Get.find<ApiService>()),
    );
    Get.lazyPut(() => AdvertisementSummaryController());

    Get.lazyPut(() => PriceDetailsController());

    Get.lazyPut(() => OrderDataController());
    Get.lazyPut(() => SummaryController());
  }
}//summary