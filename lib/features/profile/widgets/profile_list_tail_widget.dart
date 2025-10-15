import '../../../core/constant/exports_libraries.dart';
import '../../../core/constant/exports_widgets.dart';

Widget ProfileListTailWidget(
  int index,
  BuildContext context,
  String titleText, // <-- change
) {
  final isLast = index == ListProfileIcons.lastIndex;

  return SizedBox(
    height: 40.h,
    child: ListTile(
      contentPadding: EdgeInsets.zero,
      leading: CircleAvatar(
        radius: 20.w,
        backgroundColor: isLast
            ? context.colorsCustom.surfacePrimaryWhite
            : context.colorsCustom.CardBackgroundLightGray,
        child: SvgPicture.asset(
          ListProfileIcons[index],
          color: isLast
              ? context.colorsCustom.redColor
              : context.colorsCustom.surfacePrimaryBlack,
        ),
      ),
      title: Text(
        titleText, // <-- use directly
        style: context.textStyles.bodySmall.medium.copyWith(
          color: isLast
              ? context.colorsCustom.redColor
              : context.colorsCustom.TextPrimary,
        ),
      ),
      trailing: isLast
          ? const SizedBox(width: 18)
          : Icon(
              Icons.arrow_forward_ios,
              size: 16.w,
              color: context.colorsCustom.SecondaryElement,
            ),
    ),
  );
}
