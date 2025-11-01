import '../../../core/constant/exports_libraries.dart';
import '../../../core/constant/exports_widgets.dart';
import '../../../core/helpers/constants.dart';
import '../../../features/home_page/widgets/cus_button_widget.dart';
import '../../../features/wallet/widgets/withdrawal_req_sheet_widget.dart';
import '../controller/wallet_controller.dart';

Widget WithRecRowBottomWidget(
  BuildContext context, {
  required WalletController walletController,
}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      AppConstants.isDriver == '1'
          ? CusButtonWidget(
              context,
              H: 38.0.h,
              W: 148.0.w,
              backGroundColor: context.colorsCustom.surfacePrimaryBlack,
              radius: 19.5.r,
              widget: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    context.withdrawABalance,
                    style: context.textStyles.bodySmall.medium.copyWith(
                      color: context.colorsCustom.ButtonLabelPrimary,
                    ),
                  ),
                  SvgPicture.asset(
                    AppAssets.svgs.import_arrow_up_icon,
                    color: context.colorsCustom.surfacePrimaryWhite,
                  ),
                ],
              ),
              onTap: () {
                WithdrawalReqSheetWidget(
                  context,
                  walletController: walletController,
                  type: AppConstants.withdraw,
                );
              },
            )
          : CusButtonWidget(
              context,
              H: 38.0.h,
              W: 148.0.w,
              backGroundColor: context.colorsCustom.BluePrimary,
              radius: 19.5.r,
              onTap: () {
                WithdrawalReqSheetWidget(
                  context,
                  walletController: walletController,
                  type: AppConstants.deposit,
                );
              },

              widget: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    context.rechargeBalance,
                    style: context.textStyles.bodySmall.medium.copyWith(
                      color: context.colorsCustom.ButtonLabelPrimary,
                    ),
                  ),
                  SvgPicture.asset(
                    AppAssets.svgs.import_arrow_down_icon,
                    color: context.colorsCustom.surfacePrimaryWhite,
                  ),
                ],
              ),
            ),
    ],
  );
}
