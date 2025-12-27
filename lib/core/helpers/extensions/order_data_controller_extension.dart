import '../../../features/choose_the_service/controller/order_data_controller.dart';
import '../../constant/exports_libraries.dart';
import '../../constant/exports_widgets.dart';
import '../constants.dart';

extension OrderDataControllerExtension on OrderDataController {
  // =========================
  // ✅ أنواع الخدمات
  bool get isDeliveryService =>
      serviceNumber.value == '0' || serviceNumber.value == '1';

  bool get isShippingService => serviceNumber.value == '2';

  bool get isGiftService => serviceNumber.value == '3';

  // =========================
  // ✅ خدمة العناصر (Items)
  bool get isItemsService => serviceNumber.value == '1';

  // =========================
  // ✅ تحديد النص للوقت حسب نوع الخدمة
  String getTimeTitle(BuildContext context) {
    if (isDeliveryService) return context.convenientTimeForMoving;
    if (isShippingService) return context.whenIsItAppropriate;
    if (isGiftService) return context.theAppropriateTimeForGifting;
    return '';
  }

  // =========================
  // ✅ حالات العرض
  bool get shouldShowAddress => isDeliveryService || isItemsService;

  bool get shouldShowHelpers => !isItemsService;

  bool get shouldShowReceiptMethod => isDeliveryService && isItemsService;

  bool get isSingleImage => isItemsService;

  // =========================
  // ✅ منطق السائق (المصدر الصحيح)
  UserStateController get _userState => Get.find<UserStateController>();

  bool get isDriver => _userState.isDriver.value == 1;

  bool get isNotDriver => _userState.isDriver.value == 0;

  bool get isDriverUnderReview => _userState.isDriver.value == 2;
}
