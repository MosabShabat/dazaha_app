import '../../../../features/report_review_details/controller/report_review_details_controller.dart';
import 'package:get/get.dart';
import '../../../core/network/utils/api_service.dart';
import '../../profile/controller/profile_controller.dart';
import '../../profile/controller/profile_repo.dart';

class ReportReviewDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProfileRepo>(() => ProfileRepo(Get.find<ApiService>()));

    Get.lazyPut(() => ProfileController());

    Get.lazyPut(() => ReportReviewDetailsController());
  }
}
