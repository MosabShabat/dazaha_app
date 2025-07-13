import 'package:dazaha_app/core/constant/exports_libraries.dart';
import 'package:dazaha_app/core/helpers/app_assets.dart';
import 'package:dazaha_app/core/helpers/theme_exports.dart';
import 'package:dazaha_app/features/choose_the_service/widgets/choose_service_list_view_widget.dart';
import 'package:dazaha_app/core/widgets/general_screen_widget.dart';
import 'package:dazaha_app/features/choose_the_service/widgets/text_service_widget.dart';

class ChooseTheServiceScreen extends StatelessWidget {
  const ChooseTheServiceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colorsCustom.surfacePrimaryWhite,
      body: SafeArea(
        child: GeneralScreenWidget(
          context,
          wid: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: SvgPicture.asset(AppAssets.svgs.closeIcon),
                ),
              ],
            ),
            SizedBox(height: 20.h),
            TextServiceWidget(
              context,
              color1: context.colorsCustom.TextPrimary,
              text1: context.needSomethingDontWorry,
              size1: 20.0.sp,
              fontFamily1: context.textStyles.titleLarge.bold.fontFamily,
              color2: context.colorsCustom.TextSecondary,
              text2: context.weDeliverBuyAndHandleEverythingForYou,
              size2: 14.0.sp,
              fontFamily2: context.textStyles.titleSmall.regular.fontFamily,
            ),

            //context.weDeliverYourItemsQuicklyAndSafely,
            SizedBox(height: 20.h),
            ChooseServiceListViewWidget(context),
          ],
        ),
      ),
    );
  }
}
