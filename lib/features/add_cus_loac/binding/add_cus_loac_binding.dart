import 'package:dazaha_app/core/constant/exports_libraries.dart';
import 'package:dazaha_app/features/add_cus_loac/controller/add_cus_loac_controller.dart';

class AddCusLoacBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AddCusLoacController(),);
  }
}
