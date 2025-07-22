import 'package:dazaha_app/core/constant/exports_libraries.dart';
import 'package:dazaha_app/core/constant/exports_widgets.dart';

Widget ShadowConWidget(BuildContext context) {
  return Align(
    alignment: Alignment.bottomCenter,
    child: Container(
      width: 170.w,
      height: 80.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.r),
        gradient: LinearGradient(
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
          colors: [
            context.colorsCustom.surfacePrimaryBlack.withOpacity(
              0.9,
            ), // Bottom: semi-black
            context.colorsCustom.surfacePrimaryBlack.withOpacity(
              0.0,
            ), // Top: fully transparent
          ],
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              'نقل طقم كنب',
              style: context.textStyles.bodySmall.medium.copyWith(
                color: context.colorsCustom.ButtonLabelPrimary,
              ),
            ),
            Text(
              '300.0 د.ع',
              style: context.textStyles.bodySmall.bold.copyWith(
                color: context.colorsCustom.ButtonLabelPrimary,
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
