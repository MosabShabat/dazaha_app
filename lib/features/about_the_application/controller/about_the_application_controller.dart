import '../../../core/constant/exports_libraries.dart';
import '../../auth/terms_and_conditions/controller/terms_and_conditions_controller.dart';

class AboutTheApplicationController extends GetxController {
  final TermsAndConditionsController _controller = Get.find();
  @override
  void onInit() {
    super.onInit();
    _controller.aboutApp();
  }
}
