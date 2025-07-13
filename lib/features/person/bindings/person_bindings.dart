import 'package:dazaha_app/features/person/controller/person_controller.dart';
import 'package:get/get.dart';

class PersonBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PersonController());
  }
}
