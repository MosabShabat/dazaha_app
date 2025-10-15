import '../../../../core/constant/exports_libraries.dart';
import '../../../../core/constant/exports_widgets.dart';
import '../../../../features/saved_delivery_addresses/widgets/edit_delete_widget.dart';
import '../controller/saved_delivery_addresses_controller.dart';

Widget AddLocListViewWidget(
  BuildContext context,
  SavedDeliveryAddressesController _savedDeliveryAddressesController,
) {
  return Obx(() {
    return ListView.builder(
      itemCount: _savedDeliveryAddressesController.addresses.length,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        var address = _savedDeliveryAddressesController.addresses[index];

        return Padding(
          padding: EdgeInsets.symmetric(vertical: 20.h),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                radius: 32.r,
                backgroundColor: context.colorsCustom.CardBackgroundLightGray,
                child: SvgPicture.asset(
                  AppAssets.svgs.location_icon,
                  color: context.colorsCustom.surfacePrimaryBlack,
                ),
              ),
              horizontalSpace(10.w),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    '${address.name}',
                    style: context.textStyles.bodyMedium.medium.copyWith(
                      color: context.colorsCustom.TextPrimary,
                    ),
                  ),
                  verticalSpace(5.h),
                  Text(
                    '${address.address}',
                    style: context.textStyles.bodySmall.regular.copyWith(
                      color: context.colorsCustom.TextSecondary,
                    ),
                  ),
                  verticalSpace(20.h),
                  EditDeleteWidget(context, addressUuid: address.uuid!),
                ],
              ),
            ],
          ),
        );
      },
    );
  });
}
