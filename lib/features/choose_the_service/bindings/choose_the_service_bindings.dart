import 'package:dazaha_app/core/constant/exports_libraries.dart';
import 'package:dazaha_app/features/choose_the_service/controller/choose_the_service_controller.dart';

class ChooseTheServiceBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ChooseTheServiceController());
  }
}
