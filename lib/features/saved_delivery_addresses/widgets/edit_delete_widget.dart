import '../../../../core/constant/exports_widgets.dart';
import '../../../../core/helpers/extensions/extensions_dialog.dart';
import '../../../core/constant/exports_libraries.dart';
import '../../../core/helpers/constants.dart';
import '../../home_page/widgets/cus_button_widget.dart';
import '../controller/saved_delivery_addresses_controller.dart';

Widget EditDeleteWidget(BuildContext context, {required String addressUuid}) {
  final SavedDeliveryAddressesController controller =
      Get.find<SavedDeliveryAddressesController>();

  return Row(
    children: [
      CusButtonWidget(
        context,
        H: 28.0.h,
        W: 88.0.w,
        backGroundColor: context.colorsCustom.CardBackgroundLightGray,
        radius: 16.0.r,
        onTap: () {
          Get.toNamed(
            Routes.addADeliveryAddressScreen,
            arguments: {
              AppConstants.isEdit: true,
              AppConstants.addressUuid: addressUuid,
            },
          );
        },
        widget: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              AppAssets.svgs.edit_icon,
              color: context.colorsCustom.surfacePrimaryBlack,
            ),
            SizedBox(width: 5.w),
            Text(
              context.edit,
              style: context.textStyles.bodySmall.medium.copyWith(
                color: context.colorsCustom.TextPrimary,
              ),
            ),
          ],
        ),
      ),
      SizedBox(width: 5.w),
      CusButtonWidget(
        context,
        H: 28.0.h,
        W: 88.0.w,
        backGroundColor: context.colorsCustom.LightRed,
        radius: 16.0.r,
        onTap: () {
          context.showDeleteDialog(
            title: context.deleteAddress,
            message: context.deleteAddressMessage,
            onConfirm: () {
              controller.deleteAddress(addressUuid);
            },
          );
        },
        widget: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              AppAssets.svgs.trash_icon,
              color: context.colorsCustom.surfacePrimaryBlack,
            ),
            SizedBox(width: 5.w),
            Text(
              context.delete,
              style: context.textStyles.bodySmall.medium.copyWith(
                color: context.colorsCustom.TextPrimary,
              ),
            ),
          ],
        ),
      ),
    ],
  );
}
