import 'package:dazaha_app/features/summary/controller/summary_controller.dart';
import 'package:get/get.dart';

class SummaryBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => SummaryController());
  }
}//summary