import '../../../../core/constant/exports_libraries.dart';
import '../../../../core/constant/exports_widgets.dart';
import '../../../../features/my_ads_details/widgets/fil_types_grid_view_widget.dart';

Widget MedCusWidget(BuildContext context, {required count}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        context.priceOffers,
        style: context.textStyles.headlineSmall.bold.copyWith(
          color: context.colorsCustom.TextPrimary,
          fontSize: 16.sp,
        ),
      ),
      verticalSpace(5.h),
      Text(
        '$count ${context.offerTextMp}',
        style: context.textStyles.headlineSmall.medium.copyWith(
          color: context.colorsCustom.TealGreenSecondary,
          fontSize: 12.sp,
        ),
      ),
      verticalSpace(20.h),
      FilTypesGridViewWidget(context),
    ],
  );
}
