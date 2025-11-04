import '../../../../core/constant/exports_libraries.dart';
import '../../../../core/constant/exports_widgets.dart';
import '../../../../core/widgets/add_addresses_widget.dart';
import '../../../../core/widgets/latest_announcements_widget.dart';
import '../../../../features/pick_up_point/widgets/pick_up_point_list_view_widget.dart';

import '../../../core/widgets/app_empty_data/empty_addresses.dart';
import '../../../core/widgets/app_shimmers/addresses_shimmer_list.dart';
import '../../choose_the_service/controller/order_data_controller.dart';
import '../../saved_delivery_addresses/controller/saved_delivery_addresses_controller.dart';

Widget BottomSavedAddressesWidget(
  BuildContext context, {
  required GetScreen,
  required isAppBar,
  required SavedDeliveryAddressesController savedDeliveryAddressesController,
  required OrderDataController orderDataController,
}) {
  return Column(
    children: [
      LatestAnnouncementsRowWidget(
        context,
        text: context.savedAddresses,
        onPressed: () {},
        Widget: AddAddressesWidget(
          context,
          isBlack: false,
          onTap: () async {
            final result = await Get.toNamed(
              Routes.addADeliveryAddressScreen,
              arguments: {
                "isAppBar": isAppBar, "goBackAfterSave": true, // <-- أضف هذا
              },
            );

            if (result == true) {
              savedDeliveryAddressesController.fetchAddresses();
            }
          },
        ),
      ),
      Obx(() {
        return savedDeliveryAddressesController.isLoading.value
            ? addressListShimmer(context, false, isShow: true)
            : savedDeliveryAddressesController.addresses.isEmpty
            ? EmptyAddresses(context)
            : PickUpPointListViewWidget(
                context,
                orderDataController: orderDataController,
                onTap: GetScreen,
                isAppBar: isAppBar,
                savedDeliveryAddressesController:
                    savedDeliveryAddressesController,
              );

        // : AddLocListViewWidget(context, savedDeliveryAddressesController);
      }),
    ],
  );
}
