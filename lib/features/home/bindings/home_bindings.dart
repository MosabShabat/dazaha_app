import 'package:dazaha_app/features/home/controller/home_controller.dart';
import 'package:get/get.dart';

class HomeBindings extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(()=> HomeController());
  }
}