import 'package:cached_network_image/cached_network_image.dart';
import '../../../../core/network/models/orders/my_orders.dart';
import '../../../../core/constant/exports_libraries.dart';
import '../../../../core/constant/exports_widgets.dart';
import '../../../../features/home_page/widgets/case_container_widget.dart';
import '../../choose_the_service/controller/order_data_controller.dart';

Widget RowDetCasWidget(
  BuildContext context, {
  required List<Order> controller,
}) {
  final orderDataController = Get.find<OrderDataController>();

  List<Color> _statusColors(String? status) {
    switch (status) {
      case 'receiving_offers':
        return [
          context.colorsCustom.LightBlue,
          context.colorsCustom.BluePrimary,
        ];
      case 'in_progress':
        return [context.colorsCustom.LightOrange, Colors.orange];
      default:
        return [Colors.green.withOpacity(0.2), Colors.green];
    }
  }

  return ListView.separated(
    shrinkWrap: true,
    physics: const NeverScrollableScrollPhysics(),
    itemCount: controller.length,
    separatorBuilder: (_, __) => verticalSpace(10.h),
    itemBuilder: (context, index) {
      final order = controller[index];
      final colors = _statusColors(order.status);

      return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8.r),
            child: CachedNetworkImage(
              imageUrl: order.image ?? '',
              width: 100.w,
              height: 100.w,
              fit: BoxFit.cover,
            ),
          ),
          horizontalSpace(5.w),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                order.title ?? '',
                style: context.textStyles.headlineSmall.medium.copyWith(
                  color: context.colorsCustom.TextPrimary,
                  fontSize: 14.sp,
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ).box.width(140.w).make(),
              Text(
                order.serviceTitle ?? '',
                style: context.textStyles.headlineSmall.regular.copyWith(
                  color: context.colorsCustom.TextPrimary,
                  fontSize: 12.sp,
                ),
              ),
              Row(
                children: [
                  SvgPicture.asset(
                    (order.text?.contains('Items') == true ||
                            order.text?.contains('عناصر') == true)
                        ? AppAssets.svgs.hashtagIcon
                        : AppAssets.svgs.moneyIcon,
                  ),
                  horizontalSpace(5.w),
                  Text(
                    order.text ?? '',
                    style: context.textStyles.headlineSmall.medium.copyWith(
                      color: context.colorsCustom.TextPrimary,
                      fontSize: 12.sp,
                    ),
                  ),
                ],
              ),
              Text(
                '${order.offersCount ?? 0} ${context.offerTextMp}',
                style: context.textStyles.headlineSmall.bold.copyWith(
                  color: context.colorsCustom.TealGreenSecondary,
                  fontSize: 14.sp,
                ),
              ),
            ],
          ).box.height(100.w).make(),
          Spacer(),
          CaseContainerWidget(
            context,
            BackGroundColor: colors[0],
            colorBorder: colors[0],
            textColor: colors[1],
            text: order.statusText ?? '',
            textSize: 12.sp,
            height: 30.h,
            horizontalPadding: 8.w,
            borderRadius: 20.r,
            onTap: () {},
          ).box.height(30.h).make(),
        ],
      ).paddingOnly(bottom: index == controller.lastIndex ? 15.h : 0.h).onTap(
        () {
          orderDataController.setItemUuid(order.uuid!);
          orderDataController.setItemStatus(order.status!);
          Get.toNamed(Routes.myAdsDetailsScreen);
        },
      );
    },
  );
}
