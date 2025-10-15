import '../../../../core/constant/exports_libraries.dart';
import '../../../../core/constant/exports_widgets.dart';
import '../../../../features/choose_the_service/widgets/text_service_widget.dart';
import '../../choose_the_service/controller/order_data_controller.dart';
import '../../saved_delivery_addresses/controller/saved_delivery_addresses_controller.dart';

Widget PickUpPointListViewWidget(
  BuildContext context, {
  required void Function() onTap,
  required bool isAppBar,
  required SavedDeliveryAddressesController savedDeliveryAddressesController,
  required OrderDataController orderDataController,
}) {
  return Obx(() {
    final addresses = savedDeliveryAddressesController.addresses;
    if (addresses.isEmpty) {
      return Center(
        child: Text(
          context.dataEmpty,
          style: context.textStyles.bodyMedium.bold.copyWith(
            color: context.colorsCustom.TextSecondary,
          ),
        ),
      );
    }

    return ListView.separated(
      shrinkWrap: true,
      itemCount: addresses.length,
      separatorBuilder: (_, __) => verticalSpace(10.h),
      itemBuilder: (context, index) {
        final address = addresses[index];

        return GestureDetector(
          onTap: () {
            if (isAppBar) {
              orderDataController
                ..setFromAddress(address.name!)
                ..setFromLat(address.lat!)
                ..setFromLng(address.lng!);
            } else {
              orderDataController
                ..setToAddress(address.name!)
                ..setToLat(address.lat!)
                ..setToLng(address.lng!);
            }
            onTap(); // تنفيذ الدالة المرسلة من الخارج
          },
          child:
              Row(
                    children: [
                      CircleAvatar(
                        radius: 30.w,
                        backgroundColor:
                            context.colorsCustom.CardBackgroundLightGray,
                        child: SvgPicture.asset(
                          AppAssets.svgs.location_icon,
                          width: 25.w,
                          height: 25.w,
                        ),
                      ),
                      horizontalSpace(10.w),
                      Expanded(
                        child: TextServiceWidget(
                          context,
                          color1: context.colorsCustom.TextPrimary,
                          text1: address.name ?? '',
                          size1: 14.sp,
                          fontFamily1:
                              context.textStyles.bodyMedium.bold.fontFamily!,
                          color2: context.colorsCustom.TextSecondary,
                          text2: address.address ?? '',
                          size2: 12.sp,
                          fontFamily2:
                              context.textStyles.bodySmall.regular.fontFamily,
                        ),
                      ),
                    ],
                  ).box.rounded
                  .padding(
                    EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
                  )
                  .make(),
        );
      },
    ).box.width(Width).height(Height / 1.6).make();
  });
}
