import '../../../core/constant/exports_libraries.dart';
import '../../../core/constant/exports_widgets.dart';
import '../../../features/home_page/widgets/cus_button_widget.dart';

Widget CurLangConWidget(BuildContext context) {
  final currentLang = Localizations.localeOf(context).languageCode;

  Widget buildLangButton(String langCode, String label) {
    final isSelected = currentLang == langCode;
    return CusButtonWidget(
      context,
      H: 30.h,
      W: 70.w,
      backGroundColor: isSelected
          ? context.colorsCustom.TealGreenSecondary
          : context.colorsCustom.CardBackgroundLightGray,
      radius: 20.r,
      widget: Text(
        label,
        style: context.textStyles.bodyMedium.regular.copyWith(
          color: isSelected
              ? context.colorsCustom.ButtonLabelPrimary
              : context.colorsCustom.TextPrimary,
        ),
      ),
    );
  }

  return Row(
    children: [
      buildLangButton("ar", context.arabic),
      horizontalSpace(10.w),
      buildLangButton("en", context.english),
    ],
  );
}
