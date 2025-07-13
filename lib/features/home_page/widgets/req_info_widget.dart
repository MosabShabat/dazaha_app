import 'package:dazaha_app/core/constant/exports_libraries.dart';
import 'package:dazaha_app/core/constant/exports_widgets.dart';

Widget ReqInfoWidget(BuildContext context) {
  return SingleChildScrollView(
    physics: NeverScrollableScrollPhysics(),
    scrollDirection: Axis.horizontal,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              width: 1,
              color: context.colorsCustom.BluePrimary,
            ),
          ),
          child: CircleAvatar(
            backgroundImage: AssetImage(AppAssets.images.goku),
            radius: Width / 14, // Use radius instead of maxRadius here
          ),
        ),

        horizontalSpace(16.w),
        // 20.w,
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'توصيل كرسي مكتب',
              textAlign: TextAlign.start,
              maxLines: 2,
              style: context.textStyles.bodyLarge.medium.copyWith(
                color: context.colorsCustom.TextPrimary,
                fontSize: 16.sp,
              ),
            ),
            verticalSpace(2.h),
            Text(
              '#F32146 رقم الطلب :',
              textAlign: TextAlign.start,
              maxLines: 2,
              style: context.textStyles.labelMedium.regular.copyWith(
                color: context.colorsCustom.TextSecondary,
                fontSize: 12.sp,
              ),
            ),
          ],
        ),
      ],
    ),
  );
}
