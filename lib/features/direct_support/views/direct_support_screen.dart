import 'package:dazaha_app/core/constant/exports_libraries.dart';
import 'package:dazaha_app/core/constant/exports_widgets.dart';
import 'package:dazaha_app/core/widgets/general_screen_widget.dart';
import 'package:dazaha_app/features/direct_support/widgets/direct_support_app_bar_widget.dart';

class DirectSupportScreen extends StatelessWidget {
  const DirectSupportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colorsCustom.surfacePrimaryWhite,
      appBar: DirectSupportAppBarWidget(context, isPersonChat: true),
      resizeToAvoidBottomInset: true,
      body: Column(
        children: [
          Expanded(child: GeneralScreenWidget(context, wid: [])),
          SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
              child: MyTextField(
                BorderSideColor: context.colorsCustom.CardBorder,
                HintTextFontFamily:
                    context.textStyles.bodySmall.regular.fontFamily,
                HintTextFontSize: 12.0.sp,
                Radius: 28.r,
                enabledBorderColor: context.colorsCustom.CardBorder,
                fillColor: context.colorsCustom.CardBackgroundLightGray,
                hintStyleColor: context.colorsCustom.TextSecondary,
                hintText: context.message,
                prefixIcon: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12.w),
                  child: SvgPicture.asset(AppAssets.svgs.gallery_icon),
                ),
                suffixIcon: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12.w),
                  child: SvgPicture.asset(AppAssets.svgs.send_icon),
                ),
                readOnly: false,
                obscureText: false,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
