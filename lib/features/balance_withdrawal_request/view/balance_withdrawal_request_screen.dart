import 'package:dazaha_app/core/constant/exports_libraries.dart';
import 'package:dazaha_app/core/constant/exports_widgets.dart';
import 'package:dazaha_app/features/review_details/widgets/info_column_widget.dart';
import 'package:lottie/lottie.dart';

class BalanceWithdrawalRequestScreen extends StatelessWidget {
  const BalanceWithdrawalRequestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colorsCustom.surfacePrimaryWhite,
      body: SafeArea(
        child:
            Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // SizedBox(height: Height / 8),
                    Lottie.asset(
                      AppAssets.json.withdraw_money,
                      width: 165.w,
                      height: 165.w,
                    ),
                    InfoColumnWidget(
                      context,
                      isShow: false,
                      title: context.balanceWithdrawalRequest,
                      subTitle: context.youWillReceiveANotificationAsSoon,
                    ),
                    GeneralBottomAppWidget(
                      context,
                      text: context.doneText,
                      onTap: () {
                        Get.back();
                        Get.offNamed(Routes.walletScreen); //
                      },
                    ),
                    verticalSpace(Height / 3.5),
                  ],
                ).box
                .width(Width.w)
                .height(Height.h)
                .color(context.colorsCustom.surfacePrimaryWhite)
                .padding(EdgeInsetsGeometry.symmetric(horizontal: 16.w))
                .make(),
      ),
    );
  }
}
