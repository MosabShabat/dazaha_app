import '../../../../core/constant/exports_libraries.dart';
import '../../../../features/direct_suppor_map/controller/direct_support_map_controller.dart';
import '../../../core/network/utils/api_service.dart';
import '../../choose_the_service/controller/order_data_controller.dart';
import '../controller/direct_support_map_repo.dart';

class DirectSupportMapBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DirectSupportMapRepo(Get.find<ApiService>()));
    Get.lazyPut(() => DirectSupportMapController());
    Get.lazyPut(() => OrderDataController());
  }
}
