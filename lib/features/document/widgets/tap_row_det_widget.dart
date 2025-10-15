import 'package:cached_network_image/cached_network_image.dart';
import '../../../../core/constant/exports_libraries.dart';
import '../../../../core/constant/exports_widgets.dart';
import '../../../../features/home_page/widgets/case_container_widget.dart';
import '../../../core/network/models/offers/offers.dart';
import '../../choose_the_service/controller/order_data_controller.dart';

Widget TapRowDetWidget(
  BuildContext context, {
  required List<Offer> controller,
}) {
  final orderDataController = Get.find<OrderDataController>();

  Color getStatusBgColor(String? status) =>
      {
        'pending': context.colorsCustom.LightBlue,
        'in_progress': context.colorsCustom.LightOrange,
      }[status] ??
      Colors.green.withOpacity(0.2);

  Color getStatusTextColor(String? status) =>
      {
        'pending': context.colorsCustom.BluePrimary,
        'in_progress': Colors.orange,
      }[status] ??
      Colors.green;

  return ListView.separated(
    shrinkWrap: true,
    physics: const NeverScrollableScrollPhysics(),
    itemCount: controller.length,
    separatorBuilder: (_, __) => verticalSpace(10.h),
    itemBuilder: (context, index) {
      final offer = controller[index];
      final bgColor = getStatusBgColor(offer.status);
      final textColor = getStatusTextColor(offer.status);

      return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8.r),
            child: CachedNetworkImage(
              imageUrl: offer.order?.image ?? '',
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
              SizedBox(
                width: 140.w,
                child: Text(
                  offer.order?.title ?? '',
                  style: context.textStyles.headlineSmall.medium.copyWith(
                    color: context.colorsCustom.TextPrimary,
                    fontSize: 14.sp,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
              ),
              Text(
                offer.order?.serviceTitle ?? '',
                style: context.textStyles.headlineSmall.regular.copyWith(
                  color: context.colorsCustom.TextPrimary,
                  fontSize: 12.sp,
                ),
              ),
              Row(
                children: [
                  SvgPicture.asset(
                    AppAssets.svgs.moneyIcon,
                    width: 20.w,
                    height: 20.w,
                    color: context.colorsCustom.surfacePrimaryBlack,
                  ),
                  horizontalSpace(5.w),
                  Text(
                    '${offer.price} ${offer.currency}',
                    style: context.textStyles.bodySmall.medium.copyWith(
                      color: context.colorsCustom.TextPrimary,
                    ),
                  ),
                ],
              ),
            ],
          ).box.height(100.w).make(),
          Spacer(),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CaseContainerWidget(
                context,
                BackGroundColor: bgColor,
                textColor: textColor,
                text: offer.statusText ?? '',
                textSize: 12.sp,
                height: 30.h,
                horizontalPadding: 8.w,
                borderRadius: 20.r,
                onTap: () {},
              ),
              Text(
                offer.addedAt ?? '',
                style: context.textStyles.bodySmall.regular.copyWith(
                  color: context.colorsCustom.TextSecondary,
                ),
              ),
            ],
          ).box.height(100.w).make(),
        ],
      ).paddingOnly(bottom: index == controller.lastIndex ? 15.h : 0.h).onTap(
        () {
          orderDataController.setItemUuid(offer.uuid ?? '');
          Get.toNamed(Routes.myOfferAdDetailsScreen);
        },
      );
    },
  );
}
