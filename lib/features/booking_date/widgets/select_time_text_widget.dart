import '../../../core/constant/exports_widgets.dart';
import '../../../core/constant/exports_libraries.dart';

Widget SelectTimeTextWidget(BuildContext context) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        context.chooseTheAppropriateTimeForTransportation,
        style: context.textStyles.titleMedium.medium.copyWith(
          color: context.colorsCustom.TextPrimary,
        ),
      ),
      verticalSpace(5.h),
      Text(
        context.youCanChooseSpecificTimesDuringTheDay,
        style: context.textStyles.bodyMedium.regular.copyWith(
          color: context.colorsCustom.TextPrimary,
        ),
      ),
      verticalSpace(20.h),
    ],
  );
}
