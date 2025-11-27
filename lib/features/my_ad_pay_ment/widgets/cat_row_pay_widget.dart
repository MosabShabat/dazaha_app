import 'package:cached_network_image/cached_network_image.dart';
import '../../../core/helpers/constants.dart';
import '../../../features/choose_the_service/controller/order_data_controller.dart';
import '../../../core/constant/exports_libraries.dart';
import '../../../core/constant/exports_widgets.dart';
import '../controller/my_ad_pay_ment_controller.dart';

class CatRowPayWidget extends StatelessWidget {
  final MyAdPayMentController controller;

  const CatRowPayWidget({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    final model = controller.orderPaymentModel;
    if (model == null) return const SizedBox.shrink();
    final orderController = Get.find<OrderDataController>();
    //80f350d7-09ab-4135-87e6-13320dc525ac
    return InkWell(
      onTap: () {
        orderController.itemUuid.value = '${AppConstants.orderUuid}';
        orderController.offerItemUuid.value = '${AppConstants.offerUuid}';

        // AppConstants.offerUuid = AppConstants.offerUuid;
        //
        Get.toNamed(Routes.itemAdDetailsScreen);
      },
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8.r),
            child: CachedNetworkImage(
              imageUrl: model.item.image,
              width: 100.w,
              height: 100.w,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(width: 5.w),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                model.item.title,
                style: context.textStyles.headlineSmall.medium.copyWith(
                  color: context.colorsCustom.TextPrimary,
                  fontSize: 16.sp,
                ),
              ),
              Text(
                model.item.serviceTitle,
                style: context.textStyles.headlineSmall.regular.copyWith(
                  color: context.colorsCustom.TextPrimary,
                  fontSize: 12.sp,
                ),
              ),
              Row(
                children: [
                  CircleAvatar(
                    radius: 18.w,
                    backgroundImage: CachedNetworkImageProvider(
                      model.item.user.image,
                    ),
                  ),
                  SizedBox(width: 5.w),
                  Expanded(
                    child: Text(
                      model.item.user.name,
                      style: context.textStyles.headlineSmall.medium.copyWith(
                        color: context.colorsCustom.TextPrimary,
                        fontSize: 12.sp,
                      ),
                    ),
                  ),
                  Text(
                    "${model.item.price} ${model.item.currency}",
                    style: context.textStyles.headlineSmall.medium.copyWith(
                      color: context.colorsCustom.TextPrimary,
                      fontSize: 14.sp,
                    ),
                  ),
                ],
              ),
            ],
          ).box.width(255.w).height(90.w).make(),
        ],
      ),
    );
  }
}
