import 'package:dazaha_app/core/constant/exports_libraries.dart';
import 'package:dazaha_app/core/constant/exports_widgets.dart';

Widget CapInDetWidget(BuildContext context) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      CircleAvatar(
        radius: 55.w,
        backgroundImage: AssetImage(AppAssets.images.goku),
      ),
      verticalSpace(10.h),
      Text(
        'عباس الجبوري',
        style: context.textStyles.bodyLarge.bold.copyWith(
          color: context.colorsCustom.TextPrimary,
          fontSize: 18.sp,
        ),
      ),
      verticalSpace(10.h),
      Text(
        'توصيل كرسي مكتب',
        style: context.textStyles.bodySmall.medium.copyWith(
          color: context.colorsCustom.TextSecondary,
        ),
      ),
      verticalSpace(10.h),
      Text(
        '#159654',
        style: context.textStyles.bodySmall.regular.copyWith(
          color: context.colorsCustom.TextSecondary,
        ),
      ),
    ],
  );
}
