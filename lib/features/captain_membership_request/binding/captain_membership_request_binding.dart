import 'package:dazaha_app/features/captain_membership_request/controller/captain_membership_request_controller.dart';
import 'package:get/get.dart';

class CaptainMembershipRequestBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CaptainMembershipRequestController(),);
  }
}
