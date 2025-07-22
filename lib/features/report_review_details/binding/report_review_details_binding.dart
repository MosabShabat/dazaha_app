import 'package:dazaha_app/features/report_review_details/controller/report_review_details_controller.dart';
import 'package:get/get.dart';

class ReportReviewDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ReportReviewDetailsController());
  }
}
