import '../../../core/widgets/app_progress_loading/progress_controller.dart';
import 'package:get/get.dart';
import '../../features/choose_the_service/controller/order_data_controller.dart';
import '../controllers/theme_controller.dart';
import '../helpers/app_shared_methods.dart';

class AppBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(AppSharedMethods());
    Get.put(ProgressController());
    Get.put(OrderDataController());
    Get.lazyPut(() => ThemeController());
  }
}
