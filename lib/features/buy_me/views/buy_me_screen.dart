import '../../../core/constant/exports_widgets.dart';
import '../../../core/constant/exports_libraries.dart';
import '../../../core/helpers/constants.dart';
import '../../../core/widgets/app_shimmers/addresses_shimmer_list.dart';
import '../../../core/widgets/custom_app_bar_widget.dart';
import '../../../core/widgets/general_screen_widget.dart';
import '../../../core/widgets/latest_announcements_widget.dart';
import '../../add_a_delivery_address/controller/add_a_delivery_address_controller.dart';
import '../../choose_the_service/controller/order_data_controller.dart';
import '../../saved_delivery_addresses/controller/saved_delivery_addresses_controller.dart';
import '../../select_a_location_on_the_map_store/widgets/enter_store_name_widget.dart';
import '../controller/buy_me_controller.dart';
import '../widgets/addresses_using_widget.dart';
import '../widgets/empty_tag_widget.dart';
import '../widgets/note_widget.dart';
import '../widgets/store_name_row_widget.dart';

class buyMeScreen extends StatelessWidget {
  const buyMeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final BuyMeController buyController = Get.find<BuyMeController>();
    final AddADeliveryAddressController addressController =
        Get.find<AddADeliveryAddressController>();
    final OrderDataController orderController = Get.find<OrderDataController>();
    final SavedDeliveryAddressesController savedAddressesController =
        Get.find<SavedDeliveryAddressesController>();

    // Listener محسن لتجنب الاستدعاءات المتكررة
    addressController.locationName.listen((location) async {
      if (location.isEmpty) return;

      final result = await Get.toNamed(Routes.selectStoreNameScreen);
      if (result == null) return;

      orderController
        ..setFromLat(AppConstants.lat)
        ..setFromLng(AppConstants.lng)
        ..setFromAddress(AppConstants.placeName);

      addressController.updateLocation(
        result[AppConstants.lat],
        result[AppConstants.lng],
        result[AppConstants.placeName],
      );
      print('+++++++++++++++++++++++++++++++');
      print("setFromLat : ${orderController.fromLat}");
      print("setFromLng: ${orderController.fromLng}");
      print("setFromAddress: ${orderController.fromAddress}");
      print('+++++++++++++++++++++++++++++++');

      debugPrint(
        'Updated location: ${orderController.fromLat.value}, '
        '${orderController.fromLng.value}, ${orderController.fromAddress.value}',
      );
    });
    savedAddressesController.fetchAddresses(isStore: '1');

    return Scaffold(
      backgroundColor: context.colorsCustom.surfacePrimaryWhite,
      appBar: CustomAppBarWidget(
        context,
        indexColor1: 0,
        indexColor2: 1,
        indexColor3: 0,
        indexColor4: 0,
        indexColor5: 0,
      ),
      body: Obx(() {
        final isNoteClosed = buyController.isCloseNote.value;

        return GeneralScreenWidget(
          context,
          wid: [
            StoreNameRowWidget(
              context,
              controller: addressController,
              orderDataController: orderController,
              text: context.storeName,
              widget: const SizedBox.shrink(),
            ),
            verticalSpace(10.h),
            EnterStoreNameWidget(
              context,
              controller: savedAddressesController.searchController,
              onSubmitted: (_) => savedAddressesController.rerefreshData(),
            ),
            verticalSpace(15.h),
            if (!isNoteClosed)
              NoteWidget(context, onTap: buyController.toggleIsColes),
            verticalSpace(10.h),
            Obx(
              () => savedAddressesController.isLoading.value
                  ? addressListShimmer(context, false, isShow: false)
                  : savedAddressesController.addresses.isEmpty
                  ? EmptyTagWidget(context)
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        LatestAnnouncementsRowWidget(
                          size: 14.sp,
                          context,
                          text: context.recentAddresses,
                          onPressed: () {
                            for (
                              var i = 0;
                              i < savedAddressesController.addresses.length;
                              i++
                            ) {
                              savedAddressesController.deleteAddress(
                                '${savedAddressesController.addresses[i].uuid!}',
                                isStore: '1',
                              );
                              // savedAddressesController.index!.value = '1';
                              // savedAddressesController.fetchAddresses(
                              //   isStore: '1',
                              // );
                            }
                          },
                          Widget: savedAddressesController.addresses.isEmpty
                              ? const SizedBox.shrink()
                              : "${context.deleteAddress}".text
                                    .size(12.sp)
                                    .fontWeight(FontWeight.w400)
                                    .color(context.colorsCustom.TextSecondary)
                                    .make(),
                        ),
                        verticalSpace(20.h),
                        AddressesUsingWidget(
                          savedAddressesController,
                          orderController,
                        ),
                      ],
                    ),
            ),
          ],
        );
      }),
    );
  }
}
