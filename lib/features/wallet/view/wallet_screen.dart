import 'package:dazaha_app/core/constant/exports_libraries.dart';
import 'package:dazaha_app/core/constant/exports_widgets.dart';
import 'package:dazaha_app/features/my_ads/widgets/top_row_widget.dart';
import 'package:dazaha_app/features/wallet/widgets/top_box_widget.dart';
import 'package:dazaha_app/features/wallet/widgets/wallet_move_ment_list_widget.dart';

class WalletScreen extends StatelessWidget {
  const WalletScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colorsCustom.surfacePrimaryWhite,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TopBoxWidget(context),
          Column(
            children: [
              verticalSpace(10.h),
              TopRowWidget(
                context,
                title: context.recordMovements,
                size: 14.sp,
                fontWeight: FontWeight.w700,
                style: context.textStyles.titleSmall.bold.fontFamily,
                GridList: [
                  context.income,
                  context.withdrawABalance,
                  context.successful,
                  context.failed,
                ],
                subTitle: '${context.selectTheTransactionTypeAndStatus}',
              ),
              WalletMoveMentListWidget(context),
            ],
          ).paddingSymmetric(horizontal: 16.w),
        ],
      ),
    );
  }
}
