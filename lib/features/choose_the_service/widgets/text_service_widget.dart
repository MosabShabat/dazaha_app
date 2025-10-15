import '../../../../core/constant/exports_libraries.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/helpers/theme_exports.dart';

Widget TextServiceWidget(
  BuildContext context, {
  required String text1,
  String? text2,
  required Color color1,
  Color? color2,
  required double size1,
  double? size2,
  required String fontFamily1,
  String? fontFamily2,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      SizedBox(
        width: 250.w,
        height: 20.h,
        child: Text(
          text1,
          textAlign: TextAlign.start,
          maxLines: 3,
          style: context.textStyles.titleLarge.bold.copyWith(
            color: color1,
            fontFamily: fontFamily1,
            fontSize: size1,
          ),
        ),
      ),
      verticalSpace(5.h),
      if (text2 != null && text2.isNotEmpty)
        Text(
          text2,
          textAlign: TextAlign.start,
          maxLines: 3,
          style: context.textStyles.labelLarge.regular.copyWith(
            color: color2 ?? context.colorsCustom.TextSecondary,
            fontFamily:
                fontFamily2 ?? context.textStyles.labelLarge.regular.fontFamily,
            fontSize: size2 ?? 12.sp,
          ),
        ),
    ],
  );
}
