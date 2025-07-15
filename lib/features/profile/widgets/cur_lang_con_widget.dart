import 'package:dazaha_app/core/constant/exports_libraries.dart';
import 'package:dazaha_app/core/constant/exports_widgets.dart';
import 'package:dazaha_app/features/home_page/widgets/cus_button_widget.dart';

Widget CurLangConWidget(BuildContext context) {
  return Row(
    children: [
      CusButtonWidget(
        context,
        H: 30.0.h,
        W: 70.0.w,
        backGroundColor: Localizations.localeOf(context).languageCode == "ar"
            ? context.colorsCustom.TealGreenSecondary
            : context.colorsCustom.CardBackgroundLightGray,
        radius: 20.0.r,
        widget: Text(
          context.arabic,
          style: context.textStyles.bodyMedium.regular.copyWith(
            color: Localizations.localeOf(context).languageCode == "ar"
                ? context.colorsCustom.ButtonLabelPrimary
                : context.colorsCustom.TextPrimary,
          ),
        ),
      ),
      horizontalSpace(10.w),
      CusButtonWidget(
        context,
        H: 30.0.h,
        W: 70.0.w,
        backGroundColor: Localizations.localeOf(context).languageCode == "ar"
            ? context.colorsCustom.TealGreenSecondary
            : context.colorsCustom.CardBackgroundLightGray,
        radius: 20.0.r,
        widget: Text(
          context.english,
          style: context.textStyles.bodyMedium.regular.copyWith(
            color: Localizations.localeOf(context).languageCode == "ar"
                ? context.colorsCustom.ButtonLabelPrimary
                : context.colorsCustom.TextPrimary,
          ),
        ),
      ),
    ],
  );
}
