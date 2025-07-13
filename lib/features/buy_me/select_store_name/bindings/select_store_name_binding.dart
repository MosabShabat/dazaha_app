import 'package:dazaha_app/features/select_store_name/controller/select_store_name_controller.dart';
import 'package:get/get.dart';

class SelectStoreNameBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SelectStoreNameController());
  }
}
