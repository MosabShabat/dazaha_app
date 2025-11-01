import '../../../core/constant/exports_libraries.dart';
import '../../../core/helpers/theme_exports.dart';
import '../../../core/network/models/orders/order_uuid.dart';
import '../../../core/network/utils/api_result.dart';
import '../../../core/widgets/app_snackbar.dart';
import '../../../core/helpers/constants.dart';
import '../../../core/network/utils/api_error_model.dart';
import '../../../core/network/utils/app_response.dart';
import '../../../core/routes/routes.dart';
import '../../../core/widgets/app_snackbar_with_button.dart';
import 'advertisement_summary_repo.dart';

class AdvertisementSummaryController extends GetxController {
  final AdvertisementSummaryRepo _repo = Get.find<AdvertisementSummaryRepo>();

  RxBool isButtonPressed = false.obs;
  Rxn<OrderUuid> orderUuidModel = Rxn<OrderUuid>();

  /// تأكيد الطلبات
  Future<void> confirmOrders() async {
    _setButtonPressed(true);
    final result = await _repo.confirmOrders();
    _handleResponse(result);
  }

  /// التعامل مع نتيجة الطلب
  void _handleResponse(ApiResult<AppResponse> result) {
    result.when(
      success: (response) {
        _setButtonPressed(false);
        if (response.status == true) {
          _setOrderUuid(response.data);
          _showSuccessAndNavigate();
        } else {
          _showError(response.message);
        }
      },
      failure: (error) {
        _setButtonPressed(false);
        _showApiErrors([error]);
      },
    );
  }

  void _setOrderUuid(dynamic data) {
    if (data != null && data is Map<String, dynamic>) {
      orderUuidModel.value = OrderUuid.fromJson(data);
    } else {
      orderUuidModel.value = null;
    }
  }

  void _showSuccessAndNavigate() {
    showSnackbarWithButton(
      Get.context!,
      Get.context!.successOrder,
      AppConstants.success,
      showButton: false,
    );
    Get.toNamed(Routes.reviewDetailsScreen);
  }

  void _showError(String? message) {
    showErrorSnackbar(
      Get.context!,
      message ?? '${Get.context!.error}',
      FirstColor: Colors.red,
    );
  }

  void _showApiErrors(List<ApiErrorModel> errors) {
    showSnackbarErrorApi(Get.context!, errors, null);
  }

  void _setButtonPressed(bool value) => isButtonPressed.value = value;
}
