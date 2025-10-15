import '../../../core/constant/exports_libraries.dart';
import '../../../core/constant/exports_widgets.dart';

Widget MidTextColWidget(BuildContext context, {required TitleText}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      verticalSpace(20.h),
      Text(
        TitleText,
        style: context.textStyles.bodyLarge.bold.copyWith(
          color: context.colorsCustom.TextPrimary,
          fontSize: 20.sp,
        ),
      ).box.alignCenter.make(),
    ],
  );
}
