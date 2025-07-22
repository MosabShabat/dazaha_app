import 'package:dazaha_app/core/constant/exports_libraries.dart';
import 'package:dazaha_app/core/constant/exports_widgets.dart';

Widget CapCustomListTailWidget(
  BuildContext context, {
  required title,
  required subTitle,
}) {
  return ListTile(
    // minLeadingWidth: 50.w,
    contentPadding: EdgeInsets.all(0),
    leading:
        CircleAvatar(
              backgroundColor: context.colorsCustom.surfacePrimaryWhite,
              radius: 12.r,
              child: Icon(
                Icons.done,
                color: context.colorsCustom.TealGreenSecondary,
                size: 16.sp,
              ),
            ).box
            .border(color: context.colorsCustom.TealGreenSecondary, width: 1.w)
            .customRounded(BorderRadiusGeometry.circular(20.r))
            .make(),

    title: Text(
      title,
      style: context.textStyles.titleSmall.medium.copyWith(
        color: context.colorsCustom.TextPrimary,
      ),
    ),
    subtitle: Text(
      subTitle,
      style: context.textStyles.titleSmall.regular.copyWith(
        color: context.colorsCustom.TextSecondary,
      ),
    ),
  );
}
