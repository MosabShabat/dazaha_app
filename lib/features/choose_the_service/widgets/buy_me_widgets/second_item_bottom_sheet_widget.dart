import '../../../../core/constant/exports_libraries.dart';
import '../../../../core/constant/exports_widgets.dart';
import '../../../../core/widgets/progress_view_white.dart';
import '../../../../core/widgets/top_con_bot_sh_widget.dart';
import '../../controller/choose_the_service_controller.dart';
import '../dev_det_widget.dart';
import '../row_sheets_widget.dart';

Future<dynamic> SecondItemBottomSheetWidget(
  BuildContext context, {
  required String topTitle,
  required VoidCallback onTap,
  required ChooseTheServiceController controller,
}) {
  return showModalBottomSheet(
    isScrollControlled: true,
    context: context,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    clipBehavior: Clip.antiAliasWithSaveLayer,
    builder: (_) => SingleChildScrollView(
      child: SafeArea(
        child: Container(
          width: Width,
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
          color: context.colorsCustom.surfacePrimaryWhite,
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
                        topTitle,
                        style: context.textStyles.titleMedium.medium.copyWith(
                          color: context.colorsCustom.TextPrimary,
                          fontSize: 18.sp,
                        ),
                      ),
                      verticalSpace(20.h),
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
                      SafeArea(
                        child: GeneralBottomAppWidget(
                          context,
                          text: context.continuation,
                          onTap: onTap,
                        ),
                      ),
                    ],
                  );
          }),
        ),
      ),
    ),
  );
}
