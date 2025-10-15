import '../../../core/constant/exports_libraries.dart';
import '../../../core/constant/exports_widgets.dart';

Widget LanListTailWidget(
  BuildContext context, {
  required bool isArabic,
  required Widget img,
  required String text,
  required Function(bool?) changeLang,
  required bool value,
}) {
  return GestureDetector(
    onTap: () => changeLang(value),
    child: ListTile(
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
    ),
  );
}