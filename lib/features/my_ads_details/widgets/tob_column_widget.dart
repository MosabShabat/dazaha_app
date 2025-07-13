import 'package:dazaha_app/core/constant/exports_libraries.dart';
import 'package:dazaha_app/core/constant/exports_widgets.dart';
import 'package:dazaha_app/features/my_ads_details/widgets/item_det_widget.dart';
import 'package:dazaha_app/features/my_ads_details/widgets/top_det_row_widget.dart';

Widget TobColumnWidget(BuildContext context,
{required horizontalPadding}
) {
  return Column(
    children: [
      TopDetRowWidget(context),
      verticalSpace(10.h),
      ItemDetWidget(context),
      verticalSpace(20.h),
      
    ],
  ).box.padding(EdgeInsetsGeometry.symmetric(horizontal: horizontalPadding)).make();
}
