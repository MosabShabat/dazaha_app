import '../../../features/choose_the_service/controller/order_data_controller.dart';
import '../../constant/exports_libraries.dart';
import '../../constant/exports_widgets.dart';
import '../constants.dart';

extension OrderDataControllerExtension on OrderDataController {
  // ✅ أنواع الخدمات
  bool get isDeliveryService =>
      serviceNumber.value == '0' || serviceNumber.value == '1';
  bool get isShippingService => serviceNumber.value == '2';
  bool get isGiftService => serviceNumber.value == '3';

  // ✅ خدمة العناصر (Items)
  bool get isItemsService => serviceNumber.value == '1';

  // ✅ تحديد النص للوقت حسب نوع الخدمة
  String getTimeTitle(BuildContext context) {
    if (isDeliveryService) return context.convenientTimeForMoving;
    if (isShippingService) return context.whenIsItAppropriate;
    if (isGiftService) return context.theAppropriateTimeForGifting;
    return '';
  }

  // ✅ حالة عرض العنوان (AddressWidget)
  bool get shouldShowAddress => isDeliveryService || isItemsService;

  // ✅ حالة عرض المساعدين (Helpers)
  bool get shouldShowHelpers => !isItemsService;

  // ✅ حالة عرض Receipt Method
  bool get shouldShowReceiptMethod => isDeliveryService && isItemsService;

  // ✅ اختصار لتحديد نوع الصورة للعرض الواحد أو متعدد
  bool get isSingleImage => isItemsService;

  // ------------------------------------------
  // ✅ منطق السائق (Driver)
  bool get isDriver => AppConstants.isDriver == '1';
  bool get isNotDriver =>
      AppConstants.isDriver == '0' || AppConstants.isDriver.isEmpty;
  bool get isDriverUnderReview => AppConstants.isDriver == '2';
}
