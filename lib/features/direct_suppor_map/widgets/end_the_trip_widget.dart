import 'package:dazaha_app/core/constant/exports_libraries.dart';
import 'package:dazaha_app/core/constant/exports_widgets.dart';
import 'package:dazaha_app/core/widgets/top_con_bot_sh_widget.dart';

Future<dynamic> EndTheTripWidget(BuildContext context) {
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
              GeneralBottomAppWidget(
                context,
                text: '${context.yes}, ${context.endTheTrip}',
                onTap: () {
                  Get.toNamed(
                    Routes.priceDetailsReviewScreen,
                    arguments: {
                      'page': () => Get.toNamed(
                        Routes.myOfferAdDetailsScreen,
                        arguments: {'isShow': false},
                      ),
                    },
                  );
                  // Get.toNamed(Routes.priceDetailsReviewScreen);
                  // Get.back();
                  // Get.back();
                  // MyOfferToCustomerWidget(
                  //   context,
                  //   IsShowRow: false,
                  //   title: context
                  //       .theQuoteHasBeenSuccessfullyDeleted,
                  // );
                },
                backgroundColorB: context.colorsCustom.surfacePrimaryBlack,
                fontWeight: FontWeight.w500,
                textColorB: context.colorsCustom.CardBackgroundWhite,
              ),
              verticalSpace(20.h),
              GeneralBottomAppWidget(
                context,
                text: context.no,
                onTap: () => Get.back(),
                backgroundColorB: context.colorsCustom.CardBackgroundLightGray,
                fontWeight: FontWeight.w500,
                textColorB: context.colorsCustom.TextPrimary,
              ),
              verticalSpace(20.h),
            ],
          ),
        ),
      );
    },
  );
}
