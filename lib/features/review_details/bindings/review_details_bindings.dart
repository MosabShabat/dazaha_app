import 'package:dazaha_app/core/constant/exports_libraries.dart';
import 'package:dazaha_app/features/review_details/controller/review_details_controller.dart';

class ReviewDetailsBindings extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(()=> ReviewDetailsController());
  }
}