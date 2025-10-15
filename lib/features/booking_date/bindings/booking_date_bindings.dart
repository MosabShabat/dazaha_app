import '../../../core/constant/exports_libraries.dart';
import '../../../features/booking_date/controller/booking_date_controller.dart';
import '../../../features/choose_the_service/controller/order_data_controller.dart';

import '../../../core/network/utils/api_service.dart';
import '../controller/booking_data_repo.dart';

class BookingDateBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BookingDataRepo>(() => BookingDataRepo(Get.find<ApiService>()));
    Get.lazyPut(() => OrderDataController());
    Get.lazyPut(() => BookingDateController());
  }
}
