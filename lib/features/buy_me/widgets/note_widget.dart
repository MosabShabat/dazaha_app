import '../../../../core/constant/exports_widgets.dart';
import '../../../../core/constant/exports_libraries.dart';

Widget NoteWidget(BuildContext context, {required VoidCallback onTap}) {
  return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(AppAssets.svgs.info_circle_icon),
          SizedBox(
            width: 265.w,
            child: Text(
              context.writeAnyStore,
              maxLines: 100,
              style: context.textStyles.labelSmall.regular.copyWith(
                color: context.colorsCustom.TextPrimary,
              ),
            ),
          ),
          GestureDetector(
            onTap: onTap,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(
                  Icons.close,
                  color: context.colorsCustom.surfacePrimaryBlack,
                  size: 16,
                ),
                SizedBox(height: 35.h),
              ],
            ),
          ),
        ],
      ).box
      .customRounded(BorderRadius.circular(8.w))
      .padding(EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h))
      .color(context.colorsCustom.LightBlue)
      .make();
}
