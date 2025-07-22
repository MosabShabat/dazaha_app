import 'package:dazaha_app/core/constant/exports_libraries.dart';
import 'package:dazaha_app/core/constant/exports_widgets.dart';
import 'package:dazaha_app/features/document/widgets/tap_row_det_widget.dart';
import 'package:dazaha_app/features/my_ads/widgets/search_text_field_widget.dart';

Widget TabBarMyOfferWidget(BuildContext context) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      verticalSpace(20.h),
      SearchTextFieldWidget(context),
      verticalSpace(20.h),
      Text(
        '${context.today}',
        style: context.textStyles.headlineSmall.medium.copyWith(
          color: context.colorsCustom.TextPrimary,
          fontSize: 16.sp,
        ),
      ),
      verticalSpace(20.h),
      Expanded(child: TapRowDetWidget(context)),
    ],
  );
}
