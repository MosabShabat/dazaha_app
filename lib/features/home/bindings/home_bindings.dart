import '../../../../features/home_page/controller/home_repo.dart';
import '../../../../features/choose_the_service/controller/choose_the_service_controller.dart';
import '../../../features/home/controller/home_controller.dart';
import 'package:get/get.dart';
import '../../../core/network/utils/api_service.dart';
import '../../home_page/controller/home_page_controller.dart';
import '../../profile/controller/profile_controller.dart';
import '../../profile/controller/profile_repo.dart';

class HomeBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController(initialTabIndex: 0));
    Get.lazyPut<HomeRepo>(() => HomeRepo(Get.find<ApiService>()));
    Get.lazyPut(() => HomePageController());

    Get.lazyPut(() => ProfileController());
    Get.lazyPut(() => ChooseTheServiceController());
    Get.lazyPut<ProfileRepo>(() => ProfileRepo(Get.find<ApiService>()));
  }
}
