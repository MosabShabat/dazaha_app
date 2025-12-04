import '../../../../core/constant/exports_libraries.dart';
import '../../../../core/constant/exports_widgets.dart';
import '../../../../features/my_ads_details/widgets/item_det_widget.dart';
import '../../../../features/my_ads_details/widgets/top_det_row_widget.dart';

Widget TobColumnWidget(
  BuildContext context, {
  required horizontalPadding,
  required orderIdCreatedAt,
  required status,
  required statusText,
  required image,
  required priceCurr,
  required serviceTitle,
  required title,
  required uuid,
}) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
    child: Column(
      children: [
        TopDetRowWidget(
          context,
          title: '${context.orderDetails}',
          subTitle: orderIdCreatedAt,
          isShow: false,
          status: status,
          statusText: statusText,
        ),
        verticalSpace(10.h),
        ItemDetWidget(
          context,
          image: image,
          priceCurr: priceCurr,
          serviceTitle: serviceTitle,
          title: title,
          uuid: uuid,
          status: status,
        ),
        verticalSpace(20.h),
      ],
    ),
  );
}
