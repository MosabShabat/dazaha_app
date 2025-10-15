import '../../../../features/delete_my_account/controller/delete_my_account_controller.dart';
import 'package:get/get.dart';

import '../../../core/network/utils/api_service.dart';
import '../../../core/widgets/app_delete_bottom_sheet/controller/app_delete_bottom_sheet_controller.dart';
import '../../../core/widgets/app_delete_bottom_sheet/controller/app_delete_bottom_sheet_repo.dart';
import '../controller/delete_account_repo.dart';

class DeleteMyAccountBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DeleteAccountRepo>(
      () => DeleteAccountRepo(Get.find<ApiService>()),
    );
    Get.lazyPut<AppDeleteBottomSheetRepo>(
      () => AppDeleteBottomSheetRepo(Get.find<ApiService>()),
    );

    Get.lazyPut(() => AppDeleteBottomSheetController());
    Get.lazyPut(() => DeleteMyAccountController());
  }
}
