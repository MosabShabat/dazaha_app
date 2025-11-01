import '../../../core/routes/routes.dart';

import '../../../core/constant/exports_libraries.dart';
import '../../../core/helpers/theme_exports.dart';
import '../../choose_the_service/controller/order_data_controller.dart';
import '../../saved_delivery_addresses/controller/saved_delivery_addresses_controller.dart';

Widget AddressesUsingWidget(
  SavedDeliveryAddressesController savedAddressesController,
  OrderDataController orderDataController,
) {
  return ListView.builder(
    itemCount: savedAddressesController.addresses.length,
    shrinkWrap: true,
    physics: NeverScrollableScrollPhysics(),
    itemBuilder: (context, index) {
      var address = savedAddressesController.addresses[index];
      return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '${address.name}',
            style: context.textStyles.bodyMedium.medium.copyWith(
              color: context.colorsCustom.TextPrimary,
              fontWeight: FontWeight.w500,
              fontSize: 14.sp,
            ),
          ).onTap(() {
            orderDataController
              ..setFromAddress(address.name!)
              ..setFromLat(address.lat!)
              ..setFromLng(address.lng!);
            orderDataController.setPlaceName(address.name!);
            print('+++++++++++++++++++++++++++++++');
            print("setFromLat : ${orderDataController.fromLat}");
            print("setFromLng: ${orderDataController.fromLng}");
            print("setFromAddress: ${orderDataController.fromAddress}");
            print('+++++++++++++++++++++++++++++++');

            Get.toNamed(Routes.selectStoreNameScreen);
          }),
          IconButton(
            onPressed: () {
              savedAddressesController.deleteAddress(address.uuid!, isStore: 1);
            },
            icon: Icon(
              Icons.close,
              color: context.colorsCustom.surfacePrimaryBlack,
              size: 14.sp,
            ),
          ),
        ],
      );
    },
  );
}
