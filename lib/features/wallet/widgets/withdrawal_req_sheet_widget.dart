import '../../../core/constant/exports_libraries.dart';
import '../../../core/constant/exports_widgets.dart';
import '../../../core/helpers/constants.dart';
import '../../../core/widgets/app_loading_button.dart';
import '../../../core/widgets/top_con_bot_sh_widget.dart';
import '../../../features/price_details/widgets/in_put_price_widget.dart';
import '../controller/wallet_controller.dart';

Future<dynamic> WithdrawalReqSheetWidget(
  BuildContext context, {
  required WalletController walletController,
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
        padding: EdgeInsets.only(
          left: 16.w,
          right: 16.w,
          top: 10,
          bottom:
              MediaQuery.of(context).viewInsets.bottom + 10, // <-- هذا هو الحل
        ),
        child: Container(
          width: Width,
          color: context.colorsCustom.surfacePrimaryWhite,
          // padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10),
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
              InPutPriceWidget(
                context,
                isShow: false,
                controller: walletController.amountController,
              ),
              verticalSpace(100.h),
              _sendAmount(context, walletController),
            ],
          ),
        ),
      );
    },
  );
}

Widget _sendAmount(BuildContext context, WalletController controller) {
  return Obx(
    () => AppLoadingButton(
      text: context.withdrawalRequest,
      onPressed: () async {
        controller.validateInput(AppConstants.withdraw);
      },
      isLoading: controller.isButtonPressed.value,
      isWhiteProgress: true,
    ),
  );
}
