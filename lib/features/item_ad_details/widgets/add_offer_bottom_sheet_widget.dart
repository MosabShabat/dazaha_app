import '../../../core/constant/exports_libraries.dart';
import '../../../core/constant/exports_widgets.dart';
import '../../../core/widgets/app_loading_button.dart';
import '../../../core/widgets/top_con_bot_sh_widget.dart';
import '../../../features/item_ad_details/widgets/asking_price_widget.dart';
import '../../../features/item_ad_details/widgets/my_price_widget.dart';
import '../../choose_the_service/controller/order_data_controller.dart';
import '../../my_offer_ad_details/controller/my_offer_ad_details_controller.dart';
import '../controller/item_ad_details_controller.dart';
import 'list_time_widget.dart';

/// BottomSheet لإضافة أو تعديل عرض السعر
Future<dynamic> AddOfferBottomSheetWidget(
  BuildContext context, {
  required int timeLen,
  required List<dynamic> timeItem,
  required dynamic price,
  required String curr,
  required bool isUpdate,
}) {
  final OrderDataController orderDataController = Get.find();

  return showModalBottomSheet(
    isScrollControlled: true,
    context: context,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    clipBehavior: Clip.antiAliasWithSaveLayer,
    builder: (context) {
      // اختيار الـ Controller المناسب حسب نوع العملية
      final controller = isUpdate
          ? Get.find<MyOfferAdDetailsController>()
          : Get.find<ItemAdDetailsController>();

      return SingleChildScrollView(
        padding: EdgeInsets.only(
          left: 16.w,
          right: 16.w,
          top: 10,
          bottom:
              MediaQuery.of(context).viewInsets.bottom + 10, // <-- هذا هو الحل
        ),
        child: Container(
          width: Width,
          color: context.colorsCustom.surfacePrimaryWhite,
          // padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              // شريط أعلى BottomSheet
              TopConBotShWidget(context),
              verticalSpace(10.h),

              // عنوان BottomSheet
              Text(
                    context.addAnOffer,
                    style: context.textStyles.titleSmall.medium.copyWith(
                      color: context.colorsCustom.TextPrimary,
                    ),
                  ).box
                  .alignment(
                    Localizations.localeOf(context).languageCode == "ar"
                        ? Alignment.centerRight
                        : Alignment.centerLeft,
                  )
                  .make(),
              verticalSpace(15.h),

              // حقل السعر المطلوب
              AskingPriceWidget(context, price: price, curr: curr),

              // حقل السعر الخاص بالمستخدم
              MyPriceWidget(
                context,
                initialValue: "${price}",
                isUpdate
                    ? (controller as MyOfferAdDetailsController).priceController
                    : (controller as ItemAdDetailsController).priceController,
              ),
              verticalSpace(20.h),

              // عنوان الوقت حسب نوع الخدمة
              Text(
                orderDataController.serviceNumber.value == '0' ||
                        orderDataController.serviceNumber.value == '1'
                    ? context.convenientTimeForMoving
                    : orderDataController.serviceNumber.value == '2'
                    ? context.whenIsItAppropriate
                    : context.theAppropriateTimeForGifting,
                textAlign: TextAlign.start,
                maxLines: 1,
                style: context.textStyles.bodyLarge.medium.copyWith(
                  color: context.colorsCustom.TextPrimary,
                ),
              ),
              verticalSpace(10.h),

              // اختيار الوقت
              ListTimeWidget(
                context,
                img: AppAssets.svgs.clock_icon,
                imgText: context.time,
                timeLen: timeLen,
                timeItem: timeItem,
                isUpdate: isUpdate,
              ),
              verticalSpace(50.h),

              // زر الإرسال (موحد سواء تحديث أو إضافة)
              _buildSaveButton(
                context,
                controller: controller,
                isUpdate: isUpdate,
              ),
              verticalSpace(20.h),
            ],
          ),
        ),
      );
    },
  );
}

/// زر الحفظ الموحد
Widget _buildSaveButton(
  BuildContext context, {
  required dynamic controller,
  required bool isUpdate,
}) {
  return Obx(() {
    return AppLoadingButton(
      text: context.send,
      onPressed: () async {
        if (isUpdate) {
          (controller as MyOfferAdDetailsController).validationInputData(
            context,
          );
        } else {
          (controller as ItemAdDetailsController).validationInputData(context);
        }
      },
      isLoading: controller.isButtonPressed.value,
      isEnabled: !controller.isButtonPressed.value,
      isWhiteProgress: true,
      buttonColor: context.colorsCustom.surfacePrimaryBlack,
    );
  });
}
