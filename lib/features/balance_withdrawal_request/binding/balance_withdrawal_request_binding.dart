import 'package:dazaha_app/features/balance_withdrawal_request/controller/balance_withdrawal_request_controller.dart';
import 'package:get/get.dart';

class BalanceWithdrawalRequestBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => BalanceWithdrawalRequestController(),);
  }
}
