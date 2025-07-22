import 'package:dazaha_app/core/constant/exports_libraries.dart';
import 'package:dazaha_app/core/constant/exports_widgets.dart';
import 'package:dazaha_app/features/profile/widgets/cur_lang_con_widget.dart';

Widget ProfileListTailWidget(
  int index,
  BuildContext context,
  List<String> titleText,
) {
  //wallet
  return SizedBox(
    height: 40.h,
    child: ListTile(
      contentPadding: EdgeInsets.all(0),
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
      trailing: SizedBox(
        width: 190.w,
        child: index == ListProfileIcons.lastIndex
            ? Container()
            : Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  if (index == 2) CurLangConWidget(context),
                  horizontalSpace(10.w),
                  Icon(
                    Icons.arrow_forward_ios,
                    size: 16.w,
                    color: context.colorsCustom.SecondaryElement,
                  ),
                ],
              ),
      ),
    ),
  );
}
