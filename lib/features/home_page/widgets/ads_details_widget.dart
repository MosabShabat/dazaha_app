import 'package:cached_network_image/cached_network_image.dart';
import '../../../core/constant/exports_libraries.dart';
import '../../../core/constant/exports_widgets.dart';
import '../../../core/widgets/app_shimmers/custom_shimmer.dart';
import '../../choose_the_service/controller/order_data_controller.dart';
import '../controller/home_page_controller.dart';

Widget AdsDetailsWidget(
  BuildContext context, {
  required HomePageController controller,
}) {
  final OrderDataController orderDataController =
      Get.find<OrderDataController>();

  return Obx(() {
    final isLoading = controller.isLoading.value;
    final latestOrders = controller.homeModel.value?.latestOrders ?? [];
    final itemCount = isLoading ? 3 : latestOrders.length;

    return SizedBox(
      height: Width * 0.43,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemCount: itemCount,
        padding: EdgeInsets.symmetric(horizontal: 5.w),
        separatorBuilder: (_, __) => SizedBox(width: 5.w),
        itemBuilder: (context, index) {
          if (isLoading) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomShimmer(
                  height: Width * 0.3,
                  width: Width * 0.3,
                  borderRadius: 8.r,
                ),
                CustomShimmer(height: 6.h, width: 50.w, borderRadius: 8.r),
                CustomShimmer(height: 6.h, width: 35.w, borderRadius: 8.r),
              ],
            );
          }

          final serData = latestOrders[index];
          String limitWords(String? text, int maxWords) {
            if (text == null || text.isEmpty) return '';
            final words = text.split(' ');
            if (words.length <= maxWords) return text;
            return words.take(maxWords).join(' ') + '...';
          }

          return Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8.r),
                child: CachedNetworkImage(
                  imageUrl: serData.image ?? '',
                  fit: BoxFit.fill,
                  height: Width * 0.3,
                  width: Width * 0.3,
                ),
              ),
              Text(
                limitWords(serData.title, 3),
                style: context.textStyles.bodySmall.medium.copyWith(
                  color: context.colorsCustom.TextPrimary,
                  fontSize: 12.sp,
                ),
              ),

              Text(
                '${serData.likedPrice ?? 0} ${serData.currency ?? ''}',
                style: context.textStyles.bodySmall.bold.copyWith(
                  color: context.colorsCustom.TealGreenSecondary,
                  fontSize: 12.sp,
                ),
              ),
            ],
          ).onTap(() {
            orderDataController.setItemUuid(serData.uuid ?? '');
            Get.toNamed(
              Routes.itemAdDetailsScreen,
              arguments: {'isShow': true},
            );
          });
        },
      ),
    );
  });
}
