import 'dart:developer';
import '../../../../core/helpers/theme_exports.dart';
import 'package:get/get.dart';
import '../../../core/helpers/constants.dart';
import '../../../core/widgets/app_snackbar.dart';
import '../../../core/widgets/app_snackbar_with_button.dart';
import '../../../core/network/utils/api_result.dart';
import '../../../core/network/utils/app_response.dart';
import '../../../core/network/models/addresses/addresses_model.dart';
import '../../../core/network/models/addresses/address_item_model.dart';
import 'saved_delivery_addresses_repo.dart';

class SavedDeliveryAddressesController extends GetxController {
  final SavedDeliveryAddressesRepo _repo =
      Get.find<SavedDeliveryAddressesRepo>();

  var isLoading = true.obs;
  var addresses = <AddressItemModel>[].obs;
  var isLoadingDelete = false.obs;
  var deletingAddressUuid = ''.obs;

  // جلب العناوين
  Future<void> fetchAddresses() async {
    isLoading.value = true;
    final ApiResult<AppResponse> result = await _repo.deliveryAddresses();

    result.when(
      success: (response) {
        isLoading.value = false;
        if (response.status == true && response.data != null) {
          final model = AddressesModel.fromJson(
            response.data as Map<String, dynamic>,
          );
          addresses.assignAll(model.addressItem ?? []);
          log('عدد العناوين: ${addresses.length}');
        } else {
          showErrorSnackbar(Get.context!, response.message ?? '');
        }
      },
      failure: (errorMessage) {
        isLoading.value = false;
        showErrorSnackbar(Get.context!, '${errorMessage}');
      },
    );
  }

  // حذف عنوان
  Future<void> deleteAddress(String addressUuid) async {
    deletingAddressUuid.value = addressUuid;
    isLoadingDelete.value = true;

    final ApiResult<AppResponse> result = await _repo.deleteAddress(
      addressUuid,
    );

    result.when(
      success: (response) {
        isLoadingDelete.value = false;
        if (response.status == true) {
          showSnackbarWithButton(
            Get.context!,
            Get.context!.addressDeletedSuccessfully,
            AppConstants.success,
            showButton: false,
          );
          fetchAddresses();
        } else {
          showErrorSnackbar(Get.context!, response.message ?? '');
        }
      },
      failure: (errorMessage) {
        isLoadingDelete.value = false;
        showErrorSnackbar(Get.context!, '${errorMessage}');
      },
    );
  }
}
