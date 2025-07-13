import 'package:dazaha_app/core/constant/exports_libraries.dart';
import 'package:dazaha_app/core/constant/exports_widgets.dart';
import 'package:dazaha_app/core/widgets/general_screen_widget.dart';
import 'package:dazaha_app/features/home_page/widgets/main_bottom_widget.dart';
import 'package:dazaha_app/features/home_page/widgets/personla_info_row_widget.dart';
import 'package:dazaha_app/features/home_page/widgets/stack_ads_text_widget.dart';
import 'package:dazaha_app/features/home_page/widgets/bottom_custom_widget.dart';
import 'package:dazaha_app/features/home_page/widgets/custom_home_page_widget.dart';

class HomePageScreen extends StatelessWidget {
  const HomePageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colorsCustom.surfacePrimaryWhite,
      body: SafeArea(
        child: GeneralScreenWidget(
          context,
          wid: [
            personalInfoRow(context),
            SizeBox20H,
            stackAdsText(context),
            verticalSpace(20.h),
            mainBottomWidget(
              context,
              CircleAvatarRadius: 35.0.w,
              backGroundColor: context.colorsCustom.BlueBlue,
              fontFamily: context.textStyles.bodySmall.medium.fontFamily,
              fontSize: 12.0.sp,
              textColor: context.colorsCustom.TextPrimary,
              img: ListImagesHome,
              text: [
                context.transportationAndDelivery,
                context.buyForMe,
                context.removal,
                context.dedication,
              ],
              fontWeight: FontWeight.w500,
            ),
            verticalSpace(10.h),
            CustomHomePageWidget(context),
            verticalSpace(20.h),
            BottomCustomWidget(context),
          ],
        ),
      ),
    );
  }
}
