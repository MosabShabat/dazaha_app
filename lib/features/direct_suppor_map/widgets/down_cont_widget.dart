import 'package:dazaha_app/core/constant/exports_libraries.dart';
import 'package:dazaha_app/core/constant/exports_widgets.dart';
import 'package:dazaha_app/features/direct_suppor_map/controller/direct_support_map_controller.dart';
import 'package:dazaha_app/features/direct_suppor_map/widgets/cap_pr_row_widget.dart';
import 'package:dazaha_app/features/direct_suppor_map/widgets/end_the_trip_widget.dart';
import 'package:dazaha_app/features/price_cat_details/widgets/from_to_cou_widget.dart';

Widget DownContWidget(BuildContext context, {required isShow,required VoidCallback  page}) {
  DirectSupportMapController controller = Get.put(DirectSupportMapController());
  return Container(
    // height: 290.h,
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
          CapPrRowWidget(context,page: page),
          verticalSpace(20.h),
          FromToCouWidget(
            context,
            CircleSize: 8.w,
            LineHight: 56.h,
            horSpa: 7.w,
            DelText1: 'بغداد - الكرادة، شارع السعدون، مبنى 25',
            DetText1: '',
            DelText2: 'البصرة - العشار، شارع الكويت، مبنى 10',
            DetText2: '',
            verticalSpaceItems: 15.h,
          ),
          isShow
              ? Obx(
                  () => controller.selectedCase.value == 0
                      ? GeneralBottomAppWidget(
                          context,
                          onTap: () {
                            if (controller.selectedCase == 0) {
                              controller.selectedCase.value = 1;
                            }
                          },
                          text: context.startTheJourney,
                        )
                      : controller.selectedCase.value == 1
                      ? GeneralBottomAppWidget(
                          context,
                          onTap: () {
                            if (controller.selectedCase == 1) {
                              controller.selectedCase.value = 2;
                            }
                          },
                          text: context.iArrivedHome,
                        )
                      : GeneralBottomAppWidget(
                          context,
                          text: context.endTheTrip,
                          onTap: () {
                            EndTheTripWidget(context);
                          },
                          backgroundColorB:
                              context.colorsCustom.surfacePrimaryBlack,
                          fontWeight: FontWeight.w500,
                          textColorB: context.colorsCustom.surfacePrimaryWhite,
                        ),
                )
              : Container(),
        ],
      ),
    ),
  );
}
