import 'package:dazaha_app/core/constant/exports_libraries.dart';
import 'package:dazaha_app/core/constant/exports_widgets.dart';
import 'package:dazaha_app/core/widgets/top_con_bot_sh_widget.dart';
import 'package:dazaha_app/features/choose_the_service/controller/choose_the_service_controller.dart';
import 'package:dazaha_app/features/choose_the_service/widgets/transportation_and_delivery_widgets/info_column_widget.dart';
import 'package:dazaha_app/features/home_page/widgets/main_bottom_widget.dart';

Future<dynamic> FirstItemBottomSheetWidget(BuildContext context) {
  ChooseTheServiceController controller = ChooseTheServiceController();
  return showModalBottomSheet(
    isScrollControlled: true,
    context: context,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    clipBehavior: Clip.antiAliasWithSaveLayer,
    builder: (context) {
      return SingleChildScrollView(
        child: Container(
          width: Width,
          color: context.colorsCustom.surfacePrimaryWhite,
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TopConBotShWidget(context),
              verticalSpace(10.h),
              Text(
                context.transportationAndDelivery,
                maxLines: 1,
                textAlign: TextAlign.center,
                style: context.textStyles.titleMedium.medium.copyWith(
                  color: context.colorsCustom.TextPrimary,
                  fontSize: 18.sp,
                ),
              ),
              SizedBox(height: 20.h),
              mainBottomWidget(
                context,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                fontWeight: FontWeight.w400,
                CircleAvatarRadius: 20.0.w,
                backGroundColor: context.colorsCustom.surfacePrimaryWhite,
                fontFamily: context.textStyles.labelSmall.regular.fontFamily,
                fontSize: 10.0.sp,
                textColor: context.colorsCustom.TextSecondary,
                img: ListImagesBottomSheet,
                text: [
                  context.returnLostItems,
                  context.pickUpFromMarket,
                  context.deliverPurchases,
                  context.transportOfSmallItems,
                ],
                onTapList: [
                  () => print('Tapped 1'),
                  () => print('Tapped 2'),
                  () => print('Tapped 3'),
                  () => print('Tapped 4'),
                ],
              ),
              FirstInfoColumnWidget(context),
              verticalSpace(50.h),
              GeneralBottomAppWidget(
                context,
                text: context.continuation,
                onTap: () => controller.openCameraWithPermission(
                  context,
                  // page: Get.toNamed(
                  //   Routes.bookingDateScreen,
                  //   arguments: {'page': Routes.pickUpMethodUpOnDeliveryScreen},
                  // ),
                  page: Routes.bookingDateScreen,
                  arguments: {
                    'page': Routes.pickUpMethodUpOnDeliveryScreen,
                    // 'pageArgs': {
                    //   'page': Routes.advertisementSummaryScreen,
                    //   'isSwitchShow': true,
                    // },
                  },
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}
