import '../../../core/constant/exports_libraries.dart';
import '../../../core/constant/exports_widgets.dart';

import '../../../core/network/models/orders/order_uuid.dart';

Widget InfoColumnWidget(
  BuildContext context, {
  required title,
  required subTitle,
  required isShow,
  OrderUuid? orderDataController,
}) {
  return Column(
    children: [
      verticalSpace(20.h),
      Text(
        textAlign: TextAlign.center,
        maxLines: 5,
        title,
        style: context.textStyles.titleLarge.bold.copyWith(
          color: context.colorsCustom.TextPrimary,
          fontSize: 20.sp,
        ),
      ),

      verticalSpace(20.h),
      Text(
        textAlign: TextAlign.center,
        maxLines: 5,
        subTitle,
        style: context.textStyles.bodyMedium.medium.copyWith(
          color: context.colorsCustom.TextSecondary,
        ),
      ),
      verticalSpace(20.h),
      isShow
          ? Text(
              textAlign: TextAlign.center,
              maxLines: 1,
              '${context.orderID}  ${orderDataController!.orderId ?? ''}',
              style: context.textStyles.bodySmall.medium.copyWith(
                color: context.colorsCustom.TextSecondary,
              ),
            )
          : Container(),
      verticalSpace(20.h),
    ],
  );
}
