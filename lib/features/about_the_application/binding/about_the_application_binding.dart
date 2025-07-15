import 'package:dazaha_app/features/about_the_application/controller/about_the_application_controller.dart';
import 'package:get/get.dart';

class AboutTheApplicationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AboutTheApplicationController());
  }
}
