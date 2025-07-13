import 'package:dazaha_app/core/constant/exports_libraries.dart';
import 'package:dazaha_app/core/constant/exports_widgets.dart';
import 'package:dazaha_app/core/widgets/latest_announcements_widget.dart';
import 'package:dazaha_app/features/my_ads_details/widgets/accept_cat_bottom_sheet/custom_price_box_widget.dart';
import 'package:dazaha_app/features/my_ads_details/widgets/accept_cat_bottom_sheet/mid_info_col_widget.dart';

Future<dynamic> AcceptBottomSheetWidget(BuildContext context) {
  return showModalBottomSheet(
    isScrollControlled: true,
    context: context,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    clipBehavior: Clip.antiAliasWithSaveLayer,
    builder: (context) {
      return SingleChildScrollView(
        child:
            Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    LatestAnnouncementsRowWidget(
                      context,
                      text: context.acceptTheOffer,
                      size: 12.sp,
                      fontFamily:
                          context.textStyles.bodySmall.medium.fontFamily,
                      onPressed: () {
                        print(context.reset);
                      },
                      Widget: Container(),
                    ),
                    Text(
                      '${context.doYouWantToAcceptTheOffer}',
                      style: context.textStyles.titleMedium.bold.copyWith(
                        color: context.colorsCustom.TextPrimary,
                        fontSize: 18.sp,
                      ),
                    ).box.alignCenter.make(),
                    verticalSpace(10.h),
                    CustomPriceBoxWidget(context),
                    verticalSpace(10.h),
                    MidInfoColWidget(context),
                    Text(
                      context.ifYouAcceptTheOfferTheOrder,
                      style: context.textStyles.bodySmall.regular.copyWith(
                        color: context.colorsCustom.TextPrimary,
                      ),
                    ),
                    verticalSpace(Width * 0.1),
                    GeneralBottomAppWidget(
                      context,
                      text: context.acceptTheOffer,
                      onTap: () {
                        Get.toNamed(Routes.myAdPayMentScreen);
                      },
                    ),
                    verticalSpace(10.h),
                    GeneralBottomAppWidget(
                      context,
                      text: context.no,
                      backgroundColorB:
                          context.colorsCustom.CardBackgroundLightGray,
                      textColorB: context.colorsCustom.TextPrimary,
                      onTap: () {
                        Get.back();
                      },
                    ),
                  ],
                ).box
                .color(context.colorsCustom.surfacePrimaryWhite)
                .padding(EdgeInsets.symmetric(horizontal: 20.w, vertical: 20))
                .width(Width)
                .make(),
      );
    },
  );
}
