import 'package:dazaha_app/core/constant/exports_libraries.dart';
import 'package:dazaha_app/core/constant/exports_widgets.dart';
import 'package:dazaha_app/features/ad_details/widgets/list_view_ad_details_widget.dart';

Widget MiddleCustomWidget(BuildContext context) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        context.whatAreTheSizesOfTheItems,
        textAlign: TextAlign.start,
        maxLines: 1,
        style: context.textStyles.bodyMedium.medium.copyWith(
          color: context.colorsCustom.TextPrimary,
        ),
      ),
      verticalSpace(5.h),
      ListViewAdDetailsWidget(context: context),
      verticalSpace(20.h),
    ],
  );
}
