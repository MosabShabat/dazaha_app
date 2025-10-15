import '../../../../core/constant/exports_libraries.dart';
import '../../../../features/choose_the_service/controller/order_data_controller.dart';
import '../../../../features/review_details/controller/review_details_controller.dart';
import '../../advertisement_summary/controller/advertisement_summary_controller.dart';
import '../../home/controller/home_controller.dart';

class ReviewDetailsBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ReviewDetailsController());
    Get.lazyPut(() => AdvertisementSummaryController());
    Get.lazyPut(() => HomeController(initialTabIndex: 1));
    Get.lazyPut(() => OrderDataController());

    //HomeController
  }
}
