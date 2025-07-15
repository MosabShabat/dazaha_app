import 'package:dazaha_app/core/constant/exports_libraries.dart';
import 'package:dazaha_app/core/constant/exports_widgets.dart';
import 'package:dazaha_app/features/profile/widgets/cur_lang_con_widget.dart';

Widget ProfileListTailWidget(
  int index,
  BuildContext context,
  List<String> titleText,
) {
  return ListTile(
    leading: CircleAvatar(
      radius: 20.w,
      backgroundColor: index == ListProfileIcons.lastIndex
          ? context.colorsCustom.surfacePrimaryWhite
          : context.colorsCustom.CardBackgroundLightGray,
      child: SvgPicture.asset(
        ListProfileIcons[index],
        color: index == ListProfileIcons.lastIndex
            ? context.colorsCustom.redColor
            : context.colorsCustom.surfacePrimaryBlack,
      ),
    ),
    title: Text(
      titleText[index],
      style: context.textStyles.bodySmall.medium.copyWith(
        color: index == ListProfileIcons.lastIndex
            ? context.colorsCustom.redColor
            : context.colorsCustom.TextPrimary,
      ),
    ),
    trailing: Row(
      children: [
        index == 2 ? CurLangConWidget(context) : Container(),
        Icon(Icons.arrow_forward_ios),
      ],
    ),
  );
}
