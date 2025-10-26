import 'dart:developer';
import '../../../core/constant/exports_libraries.dart';
import '../../../core/widgets/app_snackbar.dart';
import '../../../core/network/utils/api_result.dart';
import '../../../core/network/utils/app_response.dart';
import '../../../core/network/models/addresses/addresses_model.dart';
import '../../../core/network/models/addresses/address_item_model.dart';
import 'saved_delivery_addresses_repo.dart';

class SavedDeliveryAddressesController extends GetxController {
  final SavedDeliveryAddressesRepo _repo =
      Get.find<SavedDeliveryAddressesRepo>();
  final RxString? index = '0'.obs;
  TextEditingController searchController = TextEditingController();

  var isLoading = true.obs;
  var addresses = <AddressItemModel>[].obs;
  var isLoadingDelete = false.obs;
  var deletingAddressUuid = ''.obs;

  @override
  void onInit() {
    super.onInit();
    addresses.clear();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      fetchAddresses(isStore: index!.value);
    });
  }

  Future<void> fetchAddresses({isStore}) async {
    isLoading.value = true;
    final ApiResult<AppResponse> result = await _repo.deliveryAddresses(
      isStore: isStore ?? '0',

      search: searchController.text.isNotEmpty ? searchController.text : null,
    );
    //0697331269
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
        log('${errorMessage}');
        //  showErrorSnackbar(Get.context!, '${errorMessage}');
      },
    );
  }

  Future<void> rerefreshData() async {
    addresses.clear();
    await fetchAddresses();
  }

  // حذف عنوان
  Future<void> deleteAddress(String addressUuid, {isStore}) async {
    deletingAddressUuid.value = addressUuid;
    isLoadingDelete.value = true;

    final ApiResult<AppResponse> result = await _repo.deleteAddress(
      addressUuid,
    );

    result.when(
      success: (response) {
        isLoadingDelete.value = false;
        if (response.status == true) {
          // showSnackbarWithButton(
          //   Get.context!,
          //   Get.context!.addressDeletedSuccessfully,
          //   AppConstants.success,
          //   showButton: false,
          // );
          fetchAddresses(isStore: isStore);
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
