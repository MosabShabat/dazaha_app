import 'package:cached_network_image/cached_network_image.dart';
import '../../../../core/constant/exports_libraries.dart';
import '../../../../core/constant/exports_widgets.dart';
import '../controller/home_page_controller.dart';

Widget ReqInfoWidget(
  BuildContext context, {
  required HomePageController controller,
  required bool isOrder,
}) {
  final currentOrder = isOrder
      ? controller.homeModel.value?.currentOrder!
      : controller.homeModel.value?.currentOffer!;

  return Row(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      // صورة الطلب
      CircleAvatar(
            radius: 22.5.w,
            backgroundImage:
                (currentOrder!.image != null && currentOrder.image!.isNotEmpty)
                ? CachedNetworkImageProvider(currentOrder.image!)
                : null,
          ).box
          .border(color: context.colorsCustom.BluePrimary, width: 1.5)
          .customRounded(BorderRadius.circular(55.r))
          .make(),

      horizontalSpace(16.w),

      // عنوان الطلب ورقم الطلب
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            currentOrder.title ?? '',
            maxLines: 2,
            style: context.textStyles.bodyLarge.medium.copyWith(
              color: context.colorsCustom.TextPrimary,
              fontSize: 16.sp,
            ),
          ),
          verticalSpace(2.h),
          Text(
            '${context.orderID} ${currentOrder.orderId ?? ''}',
            maxLines: 1,
            style: context.textStyles.labelMedium.regular.copyWith(
              color: context.colorsCustom.TextSecondary,
              fontSize: 12.sp,
            ),
          ),
        ],
      ),
    ],
  );
}
