import 'package:dazaha_app/core/constant/exports_libraries.dart';
import 'package:dazaha_app/features/advertisement_summary/controller/advertisement_summary_controller.dart';

class AdvertisementSummaryBindings extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(()=> AdvertisementSummaryController());
  }
}