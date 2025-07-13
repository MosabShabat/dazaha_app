import 'package:dazaha_app/core/constant/exports_libraries.dart';
import 'package:dazaha_app/core/helpers/theme_exports.dart';

Widget CaseReqWidget(BuildContext context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        '04:11 /25/04/2025',
        textAlign: TextAlign.start,
        style: context.textStyles.bodySmall.regular.copyWith(
          color: context.colorsCustom.TextSecondary,
          fontSize: 12.sp,
        ),
      ),

      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 0.04.sh,
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            decoration: BoxDecoration(
              color: context.colorsCustom.LightBlue,
              borderRadius: BorderRadius.all(Radius.circular(20.r)),
            ),
            child: Center(
              child: Text(
                'قيد الإنتظار',
                textAlign: TextAlign.center,
                style: context.textStyles.bodySmall.medium.copyWith(
                  color: context.colorsCustom.BluePrimary,
                  fontSize: 12.sp,
                ),
              ),
            ),
          ),
        ],
      ),
    ],
  );
}
