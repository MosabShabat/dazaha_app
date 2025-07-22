import 'package:dazaha_app/features/captain_joins/controller/captain_joins_controller.dart';
import 'package:get/get.dart';

class CaptainJoinsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CaptainJoinsController(),);
  }
}
