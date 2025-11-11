import '../../../../core/constant/exports_libraries.dart';
import '../../../../core/constant/exports_widgets.dart';
import '../../../../core/widgets/top_con_bot_sh_widget.dart';
import '../../../core/helpers/constants.dart';
import '../../../core/widgets/app_loading_button.dart';
import '../controller/direct_support_map_controller.dart';

Future<dynamic> EndTheTripWidget(
  BuildContext context, {
  required DirectSupportMapController controller,
}) {
  return showModalBottomSheet(
    isScrollControlled: true,
    context: context,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    clipBehavior: Clip.antiAliasWithSaveLayer,
    builder: (context) {
      return SingleChildScrollView(
        child: SafeArea(
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
                      context.endTheTrip,
                      style: context.textStyles.titleSmall.medium.copyWith(
                        color: context.colorsCustom.TextPrimary,
                      ),
                    ).box
                    .alignment(
                      Localizations.localeOf(context).languageCode == "ar"
                          ? Alignment.centerRight
                          : Alignment.centerLeft,
                    )
                    .make(),
                verticalSpace(15.h),
                Text(
                  context.doYouWantToEndTheTrip,
                  style: context.textStyles.titleSmall.bold.copyWith(
                    color: context.colorsCustom.TextPrimary,
                    fontSize: 18.sp,
                  ),
                ),
                verticalSpace(20.h),
                Text(
                  context.makeSureYouHave,
                  style: context.textStyles.titleSmall.medium.copyWith(
                    color: context.colorsCustom.TextSecondary,
                  ),
                ),
                verticalSpace(60.h),

                AppLoadingButton(
                  text: context.endTheTrip,
                  isEnabled: !controller.isButtonPressed.value,
                  buttonColor: context.colorsCustom.surfacePrimaryBlack,
                  onPressed: () async {
                    controller.putState('completed');
                    AppConstants.typeReq = 'offer';
                    Get.toNamed(Routes.priceDetailsReviewScreen);
                  },
                  isLoading: controller.isButtonPressed.value,
                  isWhiteProgress: true,
                ),
                verticalSpace(20.h),
                GeneralBottomAppWidget(
                  context,
                  text: context.no,
                  onTap: () => Get.back(),
                  backgroundColorB:
                      context.colorsCustom.CardBackgroundLightGray,
                  fontWeight: FontWeight.w500,
                  textColorB: context.colorsCustom.TextPrimary,
                ),
                verticalSpace(20.h),
              ],
            ),
          ),
        ),
      );
    },
  );
}
