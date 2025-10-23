import '../../../../core/constant/exports_libraries.dart';
import '../../../../core/constant/exports_widgets.dart';
import '../../../core/helpers/constants.dart';
import '../../add_a_delivery_address/controller/add_a_delivery_address_controller.dart';
import '../../choose_the_service/controller/order_data_controller.dart';

Widget StoreNameRowWidget(
  BuildContext context, {
  required String text,
  Widget? widget,
  required AddADeliveryAddressController controller,
  required OrderDataController orderDataController,
}) {
  String _truncateWords(String text, int maxWords) {
    final words = text.trim().split(RegExp(r'\s+'));
    if (words.length <= maxWords) return text;
    return '${words.take(maxWords).join(' ')}...';
  }

  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        _truncateWords(text, 3),
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: context.textStyles.titleLarge.bold.copyWith(
          color: context.colorsCustom.TextPrimary,
          fontSize: 16.sp,
        ),
      ),

      if (widget != null)
        TextButton(
          onPressed: () async {
            final result = await Get.toNamed(
              Routes.selectALocationOnTheMapScreen,
            );
            if (result != null) {
              final lat = result[AppConstants.lat];
              final lng = result[AppConstants.lng];
              final placeName = result[AppConstants.placeName];

              controller.updateLocation(lat, lng, placeName);

              orderDataController
                ..setFromLat('$lat')
                ..setFromLng('$lng')
                ..setFromAddress('$placeName')
                ..setServiceUuid(orderDataController.serviceUuid.value)
                ..setData(orderDataController.data.value)
                ..setFromDeliveryAddressUuid(
                  orderDataController.fromDeliveryAddressUuid.value,
                );
            }
          },
          child: Row(
            children: [
              SvgPicture.asset(AppAssets.svgs.map_icon),
              horizontalSpace(5.w),
              Text(
                context.chooseFromMap,
                style: context.textStyles.bodyMedium.medium.copyWith(
                  color: context.colorsCustom.BluePrimary,
                ),
              ),
            ],
          ),
        ),
    ],
  );
}
