import 'package:dazaha_app/features/home_page/controller/home_page_controller.dart';
import 'package:get/get.dart';

class HomePageBindings extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(()=> HomePageController());
  }
}