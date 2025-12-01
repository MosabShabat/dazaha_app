// import '../../../../features/report_a_problem_chat_support/controller/chat_technical_support_controller.dart';
import 'package:get/get.dart';

import '../../../core/network/utils/api_service.dart';
import '../controller/chat_technical_support_repo.dart';

class ReportAProblemChatSupportBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ChatTechnicalSupportRepo>(
      () => ChatTechnicalSupportRepo(Get.find<ApiService>()),
    );
    // Get.lazyPut(() => ChatTechnicalSupportController());
  }
}
