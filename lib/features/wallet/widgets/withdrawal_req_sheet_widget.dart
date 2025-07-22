import 'package:dazaha_app/core/constant/exports_libraries.dart';
import 'package:dazaha_app/core/constant/exports_widgets.dart';
import 'package:dazaha_app/core/widgets/top_con_bot_sh_widget.dart';
import 'package:dazaha_app/features/price_details/widgets/in_put_price_widget.dart';

Future<dynamic> WithdrawalReqSheetWidget(BuildContext context) {
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
                    context.withdrawABalance,
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
              verticalSpace(20.h),
              Text(
                context.howMuchDoYouWantToWithdraw,
                style: context.textStyles.bodyLarge.bold.copyWith(
                  color: context.colorsCustom.TextPrimary,
                  fontSize: 18.sp,
                ),
              ),
              verticalSpace(15.h),
              Text(
                context.weWillPrepareTheAmount,
                style: context.textStyles.bodySmall.medium.copyWith(
                  color: context.colorsCustom.TextSecondary,
                ),
              ),
              verticalSpace(20.h),
              InPutPriceWidget(context, isShow: false),
              // verticalSpace(20.h),
              verticalSpace(100.h),
              GeneralBottomAppWidget(
                context,
                text: context.withdrawalRequest,
                onTap: () {
                  Get.back();
                  Get.toNamed(Routes.balanceWithdrawalRequestScreen);
                },
              ),
            ],
          ),
        ),
      );
    },
  );
}
