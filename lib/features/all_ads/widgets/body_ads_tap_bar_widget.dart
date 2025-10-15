import 'package:cached_network_image/cached_network_image.dart';
import '../../../core/constant/exports_libraries.dart';
import '../../../core/constant/exports_widgets.dart';
import '../../choose_the_service/controller/order_data_controller.dart';
import '../controller/all_ads_controller.dart';
import 'ser_row_widget.dart';
import 'shadow_con_widget.dart';
import 'shimmer_grid_view_widget.dart';

Widget BodyAdsTapBarWidget(
  BuildContext context, {
  required AllAdsController controller,
}) {
  final OrderDataController orderDataController = Get.find();

  return SingleChildScrollView(
    padding: EdgeInsets.fromLTRB(16.w, 20.h, 16.w, 0),
    child: Column(
      children: [
        SerRowWidget(context,controller: controller),
        verticalSpace(20.h),
        Obx(() {
          final items = controller.ordersModel?.value.items ?? [];
          if (controller.isLoading.isTrue) return ShimmerGridViewWidget();

          return GridView.builder(
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            itemCount: items.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 20.w,
              mainAxisSpacing: 20.h,
              childAspectRatio: 1,
            ),
            itemBuilder: (context, index) {
              final item = items[index];
              return GestureDetector(
                onTap: () {
                  orderDataController.setItemUuid(item.uuid ?? '');
                  Get.toNamed(
                    Routes.itemAdDetailsScreen,
                    arguments: {'isShow': true},
                  );
                },
                child: Container(
                  width: 170.w,
                  height: 170.w,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: CachedNetworkImageProvider(item.image ?? ''),
                      fit: BoxFit.fill,
                    ),
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  child: ShadowConWidget(
                    context,
                    title: item.title ?? '',
                    price: '${item.likedPrice ?? ''} ${item.currency ?? ''}',
                    imageUrl: item.image ?? '',
                  ),
                ),
              );
            },
          );
        }),
        verticalSpace(20.h),
      ],
    ),
  );
}
