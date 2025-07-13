import 'package:dazaha_app/features/direct_support/controller/direct_support_controller.dart';
import 'package:get/get.dart';

class DirectSupportBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => DirectSupportController(),);
  }
}