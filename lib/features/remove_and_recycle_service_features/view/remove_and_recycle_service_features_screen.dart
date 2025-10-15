import '../../../features/choose_the_service/controller/order_data_controller.dart';
import '../../../core/constant/exports_libraries.dart';
import '../../../core/constant/exports_widgets.dart';
// import '../../../features/choose_the_service/controller/choose_the_service_controller.dart';
import '../../../features/remove_and_recycle_service_features/widgets/page_view_widget.dart';
import '../../choose_the_service/widgets/custom_camera_screen.dart';

class RemoveAndRecycleServiceFeaturesScreen extends StatelessWidget {
  RemoveAndRecycleServiceFeaturesScreen({super.key});
  //notification_item
  @override
  Widget build(BuildContext context) {
    // final ChooseTheServiceController controller = Get.find();
    final OrderDataController orderDataController = Get.find();

    final buttonText =
        {
          '69fb5c27-11ef-4637-986f-ed484b388c7f': context.continuation,
          '9cc543c0-793c-43d9-88a6-6e3db6082ef5': context.continuation,
          '7f625412-ca00-431d-a7fd-12863fc851ef': context.createYourAd,
        }[orderDataController.serviceUuid.value] ??
        context.CreateYourDedication;

    void handleButtonTap() {
      final uuid = orderDataController.serviceUuid.value;

      if (uuid == '69fb5c27-11ef-4637-986f-ed484b388c7f') {
        Get.to(
          () => CustomCameraScreen(
            page: Routes.bookingDateScreen,
            arguments: {'page': Routes.pickUpMethodUpOnDeliveryScreen},
          ),
        );
        // CustomCameraScreen(
        //   page: Routes.bookingDateScreen,
        //   arguments: {'page': Routes.pickUpMethodUpOnDeliveryScreen},
        // );
        // controller.openCameraWithPermission(
        //   context,
        //   page: Routes.bookingDateScreen,
        //   arguments: {'page': Routes.pickUpMethodUpOnDeliveryScreen},
        // );
      } else if (uuid == '9cc543c0-793c-43d9-88a6-6e3db6082ef5') {
        Get.toNamed(
          Routes.bookingDateScreen,
          arguments: {'page': Routes.buyMeScreen},
        );
      } else {
        Get.to(
          () => CustomCameraScreen(
            page: Routes.bookingDateScreen,
            arguments: {
              'page': Routes.adDetailsScreen,
              'pageArgs': {
                'page': Routes.advertisementSummaryScreen,
                'isSwitchShow': true,
              },
            },
          ),
        );
        // CustomCameraScreen(
        //   page: Routes.bookingDateScreen,
        //   arguments: {
        //     'page': Routes.adDetailsScreen,
        //     'pageArgs': {
        //       'page': Routes.advertisementSummaryScreen,
        //       'isSwitchShow': true,
        //     },
        //   },
        // );
        // controller.openCameraWithPermission(
        //   context,
        //   page: Routes.bookingDateScreen,
        //   arguments: {
        //     'page': Routes.adDetailsScreen,
        //     'pageArgs': {
        //       'page': Routes.advertisementSummaryScreen,
        //       'isSwitchShow': true,
        //     },
        //   },
        // );
      }
    }

    return Scaffold(
      backgroundColor: context.colorsCustom.surfacePrimaryWhite,
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
        child: GeneralBottomAppWidget(
          context,
          text: buttonText,
          onTap: handleButtonTap,
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerRight,
                child: GestureDetector(
                  onTap: Get.back,
                  child: SvgPicture.asset(AppAssets.svgs.closeIcon),
                ),
              ),
              Expanded(child: PageViewWidget()),
            ],
          ),
        ),
      ),
    );
  }
}
