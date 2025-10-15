import '../../../core/network/utils/api_result.dart';
import 'package:get/get.dart';

import '../../../core/helpers/constants.dart';
import '../../../core/network/models/offers/offer_detail.dart';
import '../../../core/widgets/app_snackbar.dart';
import '../../choose_the_service/controller/order_data_controller.dart';
import 'direct_support_map_repo.dart';

class DirectSupportMapController extends GetxController {
  final DirectSupportMapRepo _directSupportMapRepo =
      Get.find<DirectSupportMapRepo>();
  final OrderDataController _orderDataController = Get.find();

  final selectedCase = 0.obs; // 0: started, 1: delivered, 2: completed
  Rx<OfferDetail>? offerDetailsItem;
  RxBool isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    AppConstants.orderUuid = _orderDataController.itemUuid.value;
    putState('started'); // البداية: الرحلة بدأت
  }

  Future<void> putState(String state) async {
    isLoading.value = true;
    final result = await _directSupportMapRepo.putState(state);

    result.when(
      success: (response) {
        isLoading.value = false;

        if (response.status == true) {
          if (response.data != null) {
            // تحديث تفاصيل العرض
            offerDetailsItem = OfferDetail.fromJson(response.data).obs;

            // تحديث الحالة حسب state اللي رجع
            if (state == 'started') {
              selectedCase.value = 0;
            } else if (state == 'delivered') {
              selectedCase.value = 1;
            } else if (state == 'completed') {
              selectedCase.value = 2;
            }
          } else {
            showSnackbarErrorApi(Get.context!, response.errors ?? [], null);
          }
        } else {
          showErrorSnackbar(Get.context!, response.message ?? '');
        }
      },
      failure: (error) {
        isLoading.value = false;
        showSnackbarErrorApi(Get.context!, [error], null);
      },
    );
  }
}
