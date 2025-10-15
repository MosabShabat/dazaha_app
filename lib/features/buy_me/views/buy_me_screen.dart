import '../../../core/constant/exports_widgets.dart';
import '../../../core/constant/exports_libraries.dart';
import '../../../core/helpers/constants.dart';
import '../../../core/widgets/custom_app_bar_widget.dart';
import '../../../core/widgets/general_screen_widget.dart';
import '../../../core/widgets/latest_announcements_widget.dart';
import '../../add_a_delivery_address/controller/add_a_delivery_address_controller.dart';
import '../../choose_the_service/controller/order_data_controller.dart';
import '../../select_a_location_on_the_map_store/widgets/enter_store_name_widget.dart';
import '../controller/buy_me_controller.dart';
import '../widgets/empty_tag_widget.dart';
import '../widgets/note_widget.dart';
import '../widgets/store_name_row_widget.dart';

class buyMeScreen extends StatelessWidget {
  const buyMeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final buyController = Get.find<BuyMeController>();
    final addressController = Get.find<AddADeliveryAddressController>();
    final orderController = Get.find<OrderDataController>();

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

      debugPrint(
        'Updated location: ${orderController.fromLat.value}, '
        '${orderController.fromLng.value}, ${orderController.fromAddress.value}',
      );
    });

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
            EnterStoreNameWidget(context),
            verticalSpace(15.h),
            if (!isNoteClosed)
              NoteWidget(
                context,
                onTap: buyController.toggleIsColes,
              ),
            verticalSpace(10.h),
            LatestAnnouncementsRowWidget(
              size: 14.sp,
              context,
              text: context.recentAddresses,
              onPressed: () {},
              Widget: const SizedBox.shrink(),
            ),
            verticalSpace(80.h),
            EmptyTagWidget(context),
          ],
        );
      }),
    );
  }
}
