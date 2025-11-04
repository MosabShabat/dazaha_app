import '../../../core/constant/exports_widgets.dart';
import '../../../core/constant/exports_libraries.dart';
import '../../../core/network/models/orders/order_details.dart';
import '../../../core/network/utils/api_result.dart';
import '../../../core/widgets/app_snackbar.dart';
import '../../../features/choose_the_service/controller/order_data_controller.dart';
import 'price_details_repo.dart';

class PriceDetailsController extends GetxController {
  final TextEditingController priceController = TextEditingController();
  final PriceDetailsRepo _repo = Get.find<PriceDetailsRepo>();
  final OrderDataController _orderController = Get.find<OrderDataController>();
  //   orderController.serviceUuid.value ==            '153a7042-eb9e-42b8-9d5c-498623adb5da'
  Rxn<OrderDetails> summaryData = Rxn<OrderDetails>();
  RxBool isButtonPressed = false.obs;

  void submitPrice(BuildContext context, String page) {
    final isOptionalService =
        _orderController.serviceUuid.value ==
        '153a7042-eb9e-42b8-9d5c-498623adb5da';

    // ✅ إذا لم يكن السعر اختياري وتارك الحقل فارغ → أظهر رسالة خطأ
    if (!isOptionalService && priceController.text.isEmpty) {
      showErrorSnackbar(context, context.enterAmount, FirstColor: Colors.amber);
      return;
    }

    // ✅ فقط في حالة إدخال سعر (أو إذا الخدمة تتطلب سعر)
    if (priceController.text.isNotEmpty) {
      _orderController.setLikedPrice(priceController.text);
    }

    _orderController.setOrderUuid(_orderController.OrderUuid.value);

    _postSummary(context, page, _orderController.likedPrice.value);
  }

  Future<void> _postSummary(BuildContext context, String page, price) async {
    _setButtonPressed(true);
    try {
      final result = await _repo.summaryPostOrders(price: price);
      result.when(
        success: (response) {
          _setButtonPressed(false);
          if (response.status == true) {
            summaryData.value = response.data is Map<String, dynamic>
                ? OrderDetails.fromJson(response.data)
                : null;

            Get.toNamed(page);
          } else {
            showErrorSnackbar(
              Get.context!,
              response.message ?? '',
              FirstColor: Colors.red,
            );
          }
        },
        failure: (error) {
          _setButtonPressed(false);
          showSnackbarErrorApi(Get.context!, [error], null);
        },
      );
    } catch (_) {
      _setButtonPressed(false);
      showErrorSnackbar(context, context.error, FirstColor: Colors.red);
    }
  }

  void _setButtonPressed(bool value) => isButtonPressed.value = value;
}
