import 'package:dazaha_app/core/constant/exports_libraries.dart';
import 'package:dazaha_app/features/we_are_here_to_help/controller/we_are_here_to_help_controller.dart';

class WeAreHereToHelpBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => WeAreHereToHelpController(),);
  }
}
