import 'package:dazaha_app/core/constant/exports_libraries.dart';
import 'package:dazaha_app/core/constant/exports_widgets.dart';

Widget CusListTailWidget(
  BuildContext context, {
  required iconImg,
  required title,
  required onTap,
}) {
  return Padding(
    padding: EdgeInsets.only(left: 16.w, right: 16.w, bottom: 20.h),
    child: SizedBox(
      height: 40.h,
      child: ListTile(
        onTap: onTap,
        contentPadding: EdgeInsets.all(0),
        leading: CircleAvatar(
          radius: 20.w,
          backgroundColor: context.colorsCustom.CardBackgroundLightGray,
          child: SvgPicture.asset(
            iconImg,
            color: context.colorsCustom.surfacePrimaryBlack,
          ),
        ),
        title: Text(
          title,
          style: context.textStyles.bodySmall.medium.copyWith(
            color: context.colorsCustom.TextPrimary,
          ),
        ),
        trailing: Icon(
          Icons.arrow_forward_ios,
          size: 16.w,
          color: context.colorsCustom.SecondaryElement,
        ),
      ),
    ),
  );
}
