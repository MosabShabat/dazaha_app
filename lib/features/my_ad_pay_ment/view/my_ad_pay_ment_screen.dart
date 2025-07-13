import 'package:dazaha_app/core/constant/exports_libraries.dart';
import 'package:dazaha_app/core/constant/exports_widgets.dart';
import 'package:dazaha_app/core/widgets/general_screen_widget.dart';
import 'package:dazaha_app/features/my_ad_pay_ment/widgets/cat_row_pay_widget.dart';
import 'package:dazaha_app/features/my_ad_pay_ment/widgets/dis_coupon_widget.dart';
import 'package:dazaha_app/features/my_ad_pay_ment/widgets/final_pay_info_widget.dart';
import 'package:dazaha_app/features/my_ad_pay_ment/widgets/pay_button_widget.dart';
import 'package:dazaha_app/features/my_ad_pay_ment/widgets/pay_met_widget.dart';
import '../../../core/widgets/custom_scroll_app_bar_widget.dart';

class MyAdPayMentScreen extends StatelessWidget {
  const MyAdPayMentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: PayButtonWidget(context),
      backgroundColor: context.colorsCustom.surfacePrimaryWhite,
      appBar: CustomScrollAppBarWidget(context, text: context.payment),
      body: GeneralScreenWidget(
        context,
        wid: [
          CatRowPayWidget(context),
          verticalSpace(25.h),
          DisCouponWidget(context),
          verticalSpace(25.h),
          PayMetWidget(context),
          verticalSpace(20.h),
          FinalPayInfoWidget(context),
          verticalSpace(25.h),
        ],
      ),
    );
  }
}
