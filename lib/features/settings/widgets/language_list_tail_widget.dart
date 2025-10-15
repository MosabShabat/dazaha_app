import '../../../core/constant/exports_widgets.dart';
import '../../../core/constant/exports_libraries.dart';
import '../../profile/controller/profile_controller.dart';
import '../../profile/widgets/cur_lang_con_widget.dart';
import '../../profile/widgets/lang_bottom_sheet_widget.dart';

Widget LanguageListTailWidget(
  BuildContext context, {
  required ProfileController profileController,
}) {
  return SizedBox(
    height: 40.h,
    child: ListTile(
      onTap: () {
        LangBottomSheetWidget(context, controller: profileController);
      },
      contentPadding: EdgeInsets.all(0),
      leading: CircleAvatar(
        radius: 20.w,
        backgroundColor: context.colorsCustom.CardBackgroundLightGray,
        child: SvgPicture.asset(
          AppAssets.svgs.global_icon,
          color: context.colorsCustom.surfacePrimaryBlack,
        ),
      ),
      title: Text(
        context.theLanguage,
        style: context.textStyles.bodySmall.medium.copyWith(
          color: context.colorsCustom.TextPrimary,
        ),
      ),
      trailing: SizedBox(
        width: 190.w,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            CurLangConWidget(context),
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
