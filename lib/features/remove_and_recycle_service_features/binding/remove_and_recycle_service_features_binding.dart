import 'package:dazaha_app/features/remove_and_recycle_service_features/controller/remove_and_recycle_service_features_controller.dart';
import 'package:get/get.dart';

class RemoveAndRecycleServiceFeaturesBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => RemoveAndRecycleServiceFeaturesController(),);
  }
}