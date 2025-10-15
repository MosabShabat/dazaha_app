import '../../../../core/constant/exports_libraries.dart';
import '../../../../core/network/utils/api_service.dart';
import '../../../../core/widgets/app_delete_bottom_sheet/controller/app_delete_bottom_sheet_controller.dart';
import '../controller/app_delete_bottom_sheet_repo.dart';

class AppDeleteBottomSheetBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AppDeleteBottomSheetRepo>(
      () => AppDeleteBottomSheetRepo(Get.find<ApiService>()),
    );

    Get.lazyPut(() => AppDeleteBottomSheetController());
  }
}
