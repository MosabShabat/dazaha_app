import '../../../../features/choose_the_service/controller/order_data_controller.dart';

import '../../../core/constant/exports_libraries.dart';
import '../../../core/helpers/spacing.dart';
import '../../../core/helpers/theme_exports.dart';
import '../../my_offer_ad_details/controller/my_offer_ad_details_controller.dart';
import '../controller/item_ad_details_controller.dart';

Widget ListTimeWidget(
  BuildContext context, {
  required img,
  required imgText,
  required timeLen,
  required timeItem,
  required isUpdate,
}) {
  // final ItemAdDetailsController controller = Get.find();
  final OrderDataController orderDataController = Get.find();

  final controller = isUpdate
      ? Get.find<MyOfferAdDetailsController>()
      : Get.find<ItemAdDetailsController>();

  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SvgPicture.asset(img, color: context.colorsCustom.TextSecondary),
          5.widthBox,
          Text(
            '${imgText}',
            textAlign: TextAlign.center,
            maxLines: 1,
            style: context.textStyles.labelMedium.medium.copyWith(
              color: context.colorsCustom.TextSecondary,
            ),
          ),
        ],
      ),
      verticalSpace(10.h),
      SizedBox(
        height: Width * 0.1,
        child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: timeLen,
          itemBuilder: (context, index) {
            return Obx(() {
              final isSelected = isUpdate
                  ? (controller as MyOfferAdDetailsController)
                            .selectedIndex
                            .value ==
                        index
                  : (controller as ItemAdDetailsController)
                            .selectedIndex
                            .value ==
                        index;

              orderDataController.setTimeUuid(timeItem[0].uuid);

              // print('ZZZZZZZZZZZZZZZZZZZZZZZZZ');
              // print(controller.orderDetailsItem!.value.times![index].uuid);
              // print(controller.orderDetailsItem!.value.times![index].time);

              // print('ZZZZZZZZZZZZZZZZZZZZZZZZZ');
              return Container(
                    child: Center(
                      child: Text(
                        '${timeItem[index].time}',
                        textAlign: TextAlign.center,
                        maxLines: 1,
                        style: context.textStyles.labelMedium.medium.copyWith(
                          color: isSelected
                              ? context.colorsCustom.TealGreenSecondary
                              : context.colorsCustom.TextPrimary,
                        ),
                      ),
                    ),
                  ).box
                  .padding(EdgeInsetsGeometry.symmetric(horizontal: 5.w))
                  .margin(EdgeInsetsGeometry.symmetric(horizontal: 5.w))
                  .customRounded(BorderRadiusGeometry.all(Radius.circular(8.r)))
                  .color(context.colorsCustom.surfacePrimaryWhite)
                  .border(
                    color: isSelected
                        ? context.colorsCustom.TealGreenSecondary
                        : context.colorsCustom.TextPrimary,
                    width: 1.5.w,
                  )
                  .make()
                  .onTap(() {
                    if (isUpdate) {
                      (controller as MyOfferAdDetailsController).changeSelect(
                        index,
                      );
                    } else {
                      (controller as ItemAdDetailsController).changeSelect(
                        index,
                      );
                    }
                    orderDataController.setTimeUuid(timeItem[index].uuid);
                    print('GGGGGGGGGGGGGGGGGGGGGGGGGGGG');
                    print(orderDataController.timeUuid);
                    print('GGGGGGGGGGGGGGGGGGGGGGGGGGGG');
                  });
            });
          },
        ),
      ),
    ],
  );
}
