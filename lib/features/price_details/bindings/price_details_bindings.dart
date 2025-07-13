import 'package:dazaha_app/core/constant/exports_libraries.dart';
import 'package:dazaha_app/features/price_details/controller/price_details_controller.dart';

class PriceDetailsBindings extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(()=> PriceDetailsController());
  }
}