import '../../../../core/constant/exports_libraries.dart';
import '../../../../core/constant/exports_widgets.dart';
import '../../../../features/direct_suppor_map/controller/direct_support_map_controller.dart';
import '../../../../features/direct_suppor_map/widgets/cap_pr_row_widget.dart';
import '../../../../features/direct_suppor_map/widgets/end_the_trip_widget.dart';
import '../../../core/widgets/app_loading_button.dart';
import '../../my_ads_details/widgets/from_to_cou_widget.dart';
import '../../choose_the_service/controller/order_data_controller.dart';

Widget DownContWidget(
  BuildContext context, {
  required bool isShow,
  required VoidCallback page,
  required DirectSupportMapController controller,
  required OrderDataController orderDataController,
  required fromLat,
  required fromLng,
  required toLat,
  required toLng,
}) {
  return Container(
    decoration: BoxDecoration(
      color: context.colorsCustom.surfacePrimaryWhite,
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(20.r),
        topRight: Radius.circular(20.r),
      ),
    ),
    child: Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
      child: Column(
        children: [
          CapPrRowWidget(context, page: page),
          verticalSpace(20.h),
          FromToCouWidget(
            context,
            CircleSize: 8.w,
            LineHight: 56.h,
            horSpa: 7.w,
            DelText1: '${orderDataController.from}',
            DetText1: '',
            DelText2: '${orderDataController.to}',
            DetText2: '',
            verticalSpaceItems: 15.h,
            fromLat: fromLat,
            fromLng: fromLng,
            conWidth: 338.w,
            toLat: toLat,
            toLng: toLng,
          ),
          if (isShow) //0599681024
            Obx(() {
              switch (controller.selectedCase.value) {
                case 0: // started
                  return AppLoadingButton(
                    text: context.startTheJourney,
                    isEnabled: !controller.isButtonPressed.value,
                    onPressed: () async {
                      controller.putState('started');
                      await controller.openGoogleMaps();
                      controller.selectedCase.value = 1;
                    },
                    isLoading: controller.isButtonPressed.value,
                    isWhiteProgress: true,
                  );

                case 1: // delivered
                  return AppLoadingButton(
                    text: context.iArrivedHome,
                    isEnabled: !controller.isButtonPressed.value,
                    onPressed: () async {
                      controller.putState('delivered');
                      controller.selectedCase.value = 2;
                    },
                    isLoading: controller.isButtonPressed.value,
                    isWhiteProgress: true,
                  );

                case 2: // completed
                default:
                  return GeneralBottomAppWidget(
                    context,
                    text: context.endTheTrip,
                    onTap: () async {
                      await EndTheTripWidget(context, controller: controller);
                    },
                    backgroundColorB: context.colorsCustom.surfacePrimaryBlack,
                    fontWeight: FontWeight.w500,
                    textColorB: context.colorsCustom.surfacePrimaryWhite,
                  );

                // AppLoadingButton(
                //   text: context.endTheTrip,
                //   isEnabled: !controller.isButtonPressed.value,
                //   buttonColor: context.colorsCustom.surfacePrimaryBlack,
                //   onPressed: () async {
                //     // controller.putState('completed');
                //     EndTheTripWidget(context, controller: controller);
                //   },
                //   isLoading: controller.isButtonPressed.value,
                //   isWhiteProgress: true,
                // );
              }
            }),
        ],
      ),
    ),
  );
}
