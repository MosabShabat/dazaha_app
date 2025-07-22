import 'package:dazaha_app/features/report_a_problem_chat_support/controller/report_a_problem_chat_support_controller.dart';
import 'package:get/get.dart';

class ReportAProblemChatSupportBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ReportAProblemChatSupportController());
  }
}
