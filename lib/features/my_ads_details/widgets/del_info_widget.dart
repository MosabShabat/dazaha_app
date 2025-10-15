import '../../../core/constant/exports_libraries.dart';
import '../../../core/constant/exports_widgets.dart';

Widget DelInfoWidget(
  BuildContext context, {
  required title,
  required DelText,
  required DetText,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        title,
        textAlign: TextAlign.start,
        maxLines: 5,
        style: context.textStyles.labelMedium.regular.copyWith(
          color: context.colorsCustom.TextSecondary,
          fontSize: 12.sp,
        ),
      ),
      verticalSpace(5.h),
      Text(
        DelText,
        textAlign: TextAlign.start,
        maxLines: 5,
        style: context.textStyles.labelMedium.medium.copyWith(
          color: context.colorsCustom.TextPrimary,
        ),
      ).box.width(200.w).make(),
      verticalSpace(5.h),
      Text(
        DetText,
        textAlign: TextAlign.start,
        maxLines: 5,
        style: context.textStyles.labelMedium.regular.copyWith(
          color: context.colorsCustom.TextPrimary,
        ),
      ),
      //.box.width(120.w).height(val).make(),
      //.box.width(280.w).make(),
    ],
  );
}
