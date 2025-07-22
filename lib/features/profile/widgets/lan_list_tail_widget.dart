import 'package:dazaha_app/core/constant/exports_libraries.dart';
import 'package:dazaha_app/core/constant/exports_widgets.dart';

Widget LanListTailWidget(
  BuildContext context, {
  required bool isArabic,
  required img,
  required text,
  required changeLang,
  required value,
}) {
  return ListTile(
    leading: img,
    title: Text(
      text,
      style: context.textStyles.bodySmall.medium.copyWith(
        color: context.colorsCustom.TextPrimary,
      ),
    ),
    trailing: Radio<bool>(
      value: value,
      groupValue: isArabic,
      activeColor: context.colorsCustom.TealGreenSecondary,
      onChanged: changeLang,
    ),
  );
}
