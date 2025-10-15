import '../../../core/constant/exports_libraries.dart';
import '../../choose_the_service/controller/order_data_controller.dart';
import '../controller/add_cus_loac_controller.dart';

class AddCusLoacBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AddCusLoacController());
    Get.lazyPut(() => OrderDataController());

    //OrderDataController
  }
}
