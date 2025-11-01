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
  required type,
}) {
  final typeIs = type == AppConstants.withdraw ? '0' : '1';
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TopConBotShWidget(context),
              verticalSpace(10.h),
              Text(
                    typeIs == '0'
                        ? context.withdrawABalance
                        : context.rechargeBalance,
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
                typeIs == '0'
                    ? context.howMuchDoYouWantToWithdraw
                    : context.howMuchDoYouWantToDis,
                style: context.textStyles.bodyLarge.bold.copyWith(
                  color: context.colorsCustom.TextPrimary,
                  fontSize: 18.sp,
                ),
              ),
              verticalSpace(15.h),
              Text(
                typeIs == '0' ? context.weWillPrepareTheAmount : '',
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
              _sendAmount(context, walletController, type),
            ],
          ),
        ),
      );
    },
  );
}

Widget _sendAmount(BuildContext context, WalletController controller, type) {
  return Obx(
    () => AppLoadingButton(
      text: type == AppConstants.withdraw
          ? context.withdrawalRequest
          : context.rechargeBalance,
      onPressed: () async {
        controller.validateInput(type);
      },
      isLoading: controller.isButtonPressed.value,
      isEnabled: !controller.isButtonPressed.value,

      isWhiteProgress: true,
    ),
  );
}
