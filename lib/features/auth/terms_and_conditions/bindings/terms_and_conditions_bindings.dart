import 'package:dazaha_app/core/constant/exports_libraries.dart';
import 'package:dazaha_app/features/auth/terms_and_conditions/controller/terms_and_conditions_controller.dart';

class TermsAndConditionsBindings extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(()=> TermsAndConditionsController());
  }
}