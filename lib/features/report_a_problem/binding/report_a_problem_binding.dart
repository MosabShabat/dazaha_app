import '../../../../features/report_a_problem/controller/report_a_problem_controller.dart';
import 'package:get/get.dart';

import '../../../core/network/utils/api_service.dart';
import '../controller/report_problem_repo.dart';

class ReportAProblemBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ReportProblemRepo>(
      () => ReportProblemRepo(Get.find<ApiService>()),
    );

    Get.lazyPut(() => ReportAProblemController());
  }
}
