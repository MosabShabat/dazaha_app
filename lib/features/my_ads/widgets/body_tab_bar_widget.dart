import 'package:lottie/lottie.dart';
import '../../../../core/constant/exports_libraries.dart';
import '../../../../core/constant/exports_widgets.dart';
import '../../../../features/my_ads/widgets/row_det_cas_widget.dart';
import '../../../../features/my_ads/widgets/search_text_field_widget.dart';
import '../../document/widgets/list_shimmer_widget.dart';
import '../controller/transportation_and_delivery_controller.dart';

Widget BodyTabBarWidget(
  BuildContext context, {
  required TransportationAndDeliveryController controller,
}) {
  return Column(
    children: [
      verticalSpace(20.h),
      SearchTextFieldWidget(
        context,
        controller: controller.searchController,
        onSubmitted: (_) => controller.refreshOrders(),
      ),
      verticalSpace(20.h),
      Expanded(
        child: Obx(() {
          if (controller.isLoading.value) return listShimmerWidget();

          final items = controller.myOrders?.value.items ?? [];

          if (items.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Lottie.asset(
                    AppAssets.json.process_json,
                    width: 101.w,
                    height: 101.w,
                  ),
                  verticalSpace(20.h),
                  Text(
                    context.dataEmpty,
                    textAlign: TextAlign.center,
                    style: context.textStyles.titleLarge.bold.copyWith(
                      color: context.colorsCustom.surfacePrimaryBlack,
                    ),
                  ),
                ],
              ),
            );
          }

          return ListView.separated(
            physics: const BouncingScrollPhysics(),
            itemCount: items.length,
            separatorBuilder: (_, __) => verticalSpace(20.h),
            itemBuilder: (_, index) {
              final item = items[index];
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.date ?? '',
                    style: context.textStyles.headlineSmall.medium.copyWith(
                      color: context.colorsCustom.TextPrimary,
                      fontSize: 16.sp,
                    ),
                  ),
                  verticalSpace(20.h),
                  RowDetCasWidget(context, controller: item.orders!),
                ],
              );
            },
          );
        }),
      ),
    ],
  );
}
