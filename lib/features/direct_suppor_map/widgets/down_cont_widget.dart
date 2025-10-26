import '../../../../core/constant/exports_libraries.dart';
import '../../../../core/constant/exports_widgets.dart';
import '../../../../features/direct_suppor_map/controller/direct_support_map_controller.dart';
import '../../../../features/direct_suppor_map/widgets/cap_pr_row_widget.dart';
import '../../../../features/direct_suppor_map/widgets/end_the_trip_widget.dart';
import '../../my_ads_details/widgets/from_to_cou_widget.dart';
import '../../choose_the_service/controller/order_data_controller.dart';

Widget DownContWidget(
  BuildContext context, {
  required bool isShow,
  required VoidCallback page,
  required DirectSupportMapController controller,
  required OrderDataController orderDataController,
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
          ),
          if (isShow)
            Obx(() {
              switch (controller.selectedCase.value) {
                case 0: // started
                  return GeneralBottomAppWidget(
                    context,
                    text: context.startTheJourney,
                    onTap: () async {
                      await controller.openGoogleMaps();
                    },//0598699787
                  );

                case 1: // delivered
                  return GeneralBottomAppWidget(
                    context,
                    text: context.iArrivedHome,
                    onTap: () => controller.putState('completed'),
                  );
                case 2: // completed
                default:
                  return GeneralBottomAppWidget(
                    context,
                    text: context.endTheTrip,
                    backgroundColorB: context.colorsCustom.surfacePrimaryBlack,
                    textColorB: context.colorsCustom.surfacePrimaryWhite,
                    fontWeight: FontWeight.w500,
                    onTap: () => EndTheTripWidget(context),
                  );
              }
            }),
        ],
      ),
    ),
  );
}
