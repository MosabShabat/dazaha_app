import 'package:dazaha_app/features/report_a_problem/controller/report_a_problem_controller.dart';
import 'package:get/get.dart';

class ReportAProblemBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ReportAProblemController(),);
  }
}
