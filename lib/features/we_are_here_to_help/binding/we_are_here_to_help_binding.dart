import '../../../core/constant/exports_libraries.dart';
import '../../../core/network/utils/api_service.dart';
import '../../../features/we_are_here_to_help/controller/faq_controller.dart';
import '../../../features/we_are_here_to_help/controller/faq_repo.dart';
import '../../../features/we_are_here_to_help/controller/we_are_here_to_help_controller.dart';

class WeAreHereToHelpBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FaqRepo>(() => FaqRepo(Get.find<ApiService>()));
    Get.lazyPut(() => WeAreHereToHelpController());
    Get.lazyPut(() => FAQController());
  }
}
