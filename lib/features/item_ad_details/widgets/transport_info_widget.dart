import '../../../core/constant/exports_libraries.dart';
import '../../../core/constant/exports_widgets.dart';

Widget TransportInfoWidget(
  BuildContext context, {
  required title,
  required serviceName,
  required description,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        title,
        style: context.textStyles.titleMedium.bold.copyWith(
          color: context.colorsCustom.TextPrimary,
        ),
      ),
      verticalSpace(10.h),
      Text(
        serviceName,
        style: context.textStyles.labelMedium.medium.copyWith(
          color: context.colorsCustom.TextSecondary,
        ),
      ),
      verticalSpace(10.h),
      Text(
        description,
        style: context.textStyles.labelMedium.medium.copyWith(
          color: context.colorsCustom.TextSecondary,
        ),
      ),
    ],
  );
}
