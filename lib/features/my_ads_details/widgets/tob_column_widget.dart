import 'package:dazaha_app/core/constant/exports_libraries.dart';
import 'package:dazaha_app/core/constant/exports_widgets.dart';
import 'package:dazaha_app/features/my_ads_details/widgets/item_det_widget.dart';
import 'package:dazaha_app/features/my_ads_details/widgets/top_det_row_widget.dart';

Widget TobColumnWidget(
  BuildContext context, {
  required horizontalPadding,
  required caseItem,
}) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
    child: Column(
      children: [
        TopDetRowWidget(
          context,
          title: '${context.orderDetails}',
          subTitle: '#159654',
          isShow: true,
        ),
        verticalSpace(10.h),
        ItemDetWidget(context, caseItem: caseItem),
        verticalSpace(20.h),
      ],
    ),
  );
}
