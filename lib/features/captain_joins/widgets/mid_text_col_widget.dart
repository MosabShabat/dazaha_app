import 'package:dazaha_app/core/constant/exports_libraries.dart';
import 'package:dazaha_app/core/constant/exports_widgets.dart';

Widget MidTextColWidget(BuildContext context) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      verticalSpace(20.h),
      Text(
        context.startYourJourneyAsACaptain,
        style: context.textStyles.bodyLarge.bold.copyWith(
          color: context.colorsCustom.TextPrimary,
          fontSize: 20.sp,
        ),
      ).box.alignCenter.make(),
      verticalSpace(10.h),
      Text(
        context.offerDeliveryServicesAndEarn,
        style: context.textStyles.bodyMedium.regular.copyWith(
          color: context.colorsCustom.TextSecondary,
        ),
      ).box.alignCenter.make(),
      verticalSpace(20.h),
    ],
  );
}
