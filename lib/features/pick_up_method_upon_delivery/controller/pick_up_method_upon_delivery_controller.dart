import '../../../core/constant/exports_libraries.dart';
import '../../../core/network/models/receipt_methods.dart';
import '../../../core/network/utils/api_result.dart';
import 'package:get/get.dart';

import '../../../core/widgets/app_snackbar.dart';
import '../../add_a_delivery_address/controller/add_a_delivery_repo.dart';

class PickUpMethodUponDeliveryController extends GetxController {
  final AddADeliveryRepo _addADeliveryRepo = Get.find<AddADeliveryRepo>();

  var selectedIndex = 0.obs;
  var switchValue = false.obs;
  RxBool isDataLoading = true.obs;

  RxList<ReceiptMethods> receiptMethods = <ReceiptMethods>[].obs;

  void changeSelect(int index) {
    selectedIndex.value = index;
  }

  void setSwitch(bool value) {
    switchValue.value = value;
  }

  void toggleSwitch() {
    switchValue.value = !switchValue.value;
  }

  @override
  void onInit() {
    super.onInit();

    getReceiptMethods();
  }

  void getReceiptMethods() async {
    isDataLoading.value = true;

    final result = await _addADeliveryRepo.requirements(
      requirements: ['receipt_methods'],
    );

    result.when(
      success: (response) {
        if (response.status == true && response.data != null) {
          final data = response.data as Map<String, dynamic>;
          final receiptMethodsRow = data['receipt_methods'] as List<dynamic>;
          receiptMethods.assignAll(
            receiptMethodsRow.map((e) => ReceiptMethods.fromJson(e)).toList(),
          );
        } else {
          showErrorSnackbar(
            Get.context!,
            response.message ?? '',
            FirstColor: Colors.red,
          );
        }
        isDataLoading.value = false;
      },
      failure: (error) {
        isDataLoading.value = false;
        showSnackbarErrorApi(Get.context!, [error], null);
      },
    );
  }
}
