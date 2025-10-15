import '../../../features/home_page/controller/home_page_controller.dart';
import 'package:get/get.dart';
import '../../../core/network/utils/api_service.dart';
import '../../choose_the_service/controller/order_data_controller.dart';
import '../controller/home_repo.dart';

class HomePageBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeRepo(Get.find<ApiService>()));
    Get.lazyPut(() => HomePageController());
    Get.lazyPut(() => OrderDataController());
  }
}
