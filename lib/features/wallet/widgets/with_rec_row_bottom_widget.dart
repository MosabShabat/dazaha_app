import 'package:dazaha_app/core/constant/exports_libraries.dart';
import 'package:dazaha_app/core/constant/exports_widgets.dart';
import 'package:dazaha_app/features/home_page/widgets/cus_button_widget.dart';
import 'package:dazaha_app/features/wallet/widgets/withdrawal_req_sheet_widget.dart';

Widget WithRecRowBottomWidget(BuildContext context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: [
      CusButtonWidget(
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
          WithdrawalReqSheetWidget(context);
        },
      ),
      CusButtonWidget(
        context,
        H: 38.0.h,
        W: 148.0.w,
        backGroundColor: context.colorsCustom.BluePrimary,
        radius: 19.5.r,
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

