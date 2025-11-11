import '../../../../features/choose_the_service/controller/order_data_controller.dart';
import '../../../../core/constant/exports_libraries.dart';
import '../../../../core/constant/exports_widgets.dart';
import '../../../../core/widgets/progress_view_white.dart';
import '../../../../core/widgets/top_con_bot_sh_widget.dart';
import '../../../../features/choose_the_service/controller/choose_the_service_controller.dart';
import '../custom_camera_screen.dart';
import '../dev_det_widget.dart';
import '../row_sheets_widget.dart';

Future<dynamic> FirstItemBottomSheetWidget(
  BuildContext context, {
  required ChooseTheServiceController controller,
}) {
  OrderDataController orderController = Get.find();
  return showModalBottomSheet(
    isScrollControlled: true,
    useSafeArea: true,
    context: context,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    clipBehavior: Clip.antiAliasWithSaveLayer,
    builder: (_) => SingleChildScrollView(
      child: SafeArea(
        child: Container(
          width: Width,
          color: context.colorsCustom.surfacePrimaryWhite,
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
          child: Obx(() {
            return controller.isLoading.isTrue
                ? Container(
                    height: Width,
                    child: Center(child: ProgressViewWhite(context, false)),
                  )
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
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
                      RowSheetWidget(
                        context,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        fontWeight: FontWeight.w400,
                        CircleAvatarRadius: 20.w,
                        width: 50.w,
                        maxLines: 3,
                        backGroundColor:
                            context.colorsCustom.surfacePrimaryWhite,
                        fontFamily:
                            context.textStyles.labelSmall.regular.fontFamily!,
                        fontSize: 10.sp,
                        textColor: context.colorsCustom.TextSecondary,
                        controller: controller,
                        onTapList: List.generate(
                          controller.serviceModel!.value.subServices!.length,
                          (i) =>
                              () => print('Tapped ${i + 1}'),
                        ),
                      ),
                      verticalSpace(50.h),
                      DevDetWidget(context, controller: controller),
                      verticalSpace(50.h),
                      GeneralBottomAppWidget(
                        context,
                        text: context.continuation,
                        onTap: () {
                          orderController.setSrvType('2');

                          if (controller.serviceModel!.value.intros!.isEmpty) {
                            Get.to(
                              () => CustomCameraScreen(
                                page: Routes.bookingDateScreen,
                                arguments: {
                                  'page': Routes.pickUpMethodUpOnDeliveryScreen,
                                },
                              ),
                            );
                          } else if (controller
                              .serviceModel!
                              .value
                              .intros!
                              .isNotEmpty) {
                            Get.toNamed(
                              Routes.removeAndRecycleServiceFeaturesScreen,
                            );
                          }
                        },
                      ),
                    ],
                  );
          }),
        ),
      ),
    ),
  );
}
