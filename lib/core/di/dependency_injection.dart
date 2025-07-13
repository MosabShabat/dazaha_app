import 'package:get/get.dart';
import '../controllers/theme_controller.dart';
import '../helpers/app_shared_methods.dart';

class AppBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(AppSharedMethods());
    Get.lazyPut(() => ThemeController());
  }
}
