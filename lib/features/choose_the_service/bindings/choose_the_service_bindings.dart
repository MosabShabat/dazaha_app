import '../../../core/constant/exports_libraries.dart';
import '../../../core/network/utils/api_service.dart';
import '../../home/controller/home_controller.dart';
import '../../home_page/controller/home_page_controller.dart';
import '../../home_page/controller/home_repo.dart';
import '../controller/choose_the_service_controller.dart';
import '../controller/choose_the_service_repo.dart';
import '../controller/order_data_controller.dart';

class ChooseTheServiceBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => OrderDataController());
    Get.lazyPut(() => ChooseTheServiceController());
    Get.lazyPut(() => HomeRepo(Get.find<ApiService>()));
    Get.lazyPut(() => ChooseTheServiceRepo(Get.find<ApiService>()));
    Get.lazyPut(() => HomePageController());
    Get.lazyPut(() => HomeController(initialTabIndex: 0));

    //ChooseTheServiceRepo
  }
}
