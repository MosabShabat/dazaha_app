import 'package:dazaha_app/features/personal_data/controller/personal_data_controller.dart';
import 'package:get/get.dart';

class PersonalDataBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() =>PersonalDataController(),);
  }
}
