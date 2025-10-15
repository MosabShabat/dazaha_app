import 'package:lottie/lottie.dart';
import '../../../../core/constant/exports_libraries.dart';
import '../../../../core/constant/exports_widgets.dart';
import '../../../../features/document/widgets/tap_row_det_widget.dart';
import '../../../../features/my_ads/widgets/search_text_field_widget.dart';
import '../controller/document_controller.dart';
import 'list_shimmer_widget.dart';

Widget TabBarMyOfferWidget(
  BuildContext context, {
  required DocumentController controller,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      verticalSpace(20.h),
      SearchTextFieldWidget(
        context,
        controller: controller.searchController,
        onSubmitted: (value) {
          controller.refreshOrders();
        },
      ),
      verticalSpace(20.h),
      Expanded(
        child: Obx(() {
          if (controller.isLoading.isTrue) {
            return listShimmerWidget();
          }
          if (controller.offer!.value.items!.isEmpty) {
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

          return ListView.builder(
            itemCount: controller.offer!.value.items!.length,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              final item = controller.offer!.value.items![index];
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${item.date}',
                    style: context.textStyles.headlineSmall.medium.copyWith(
                      color: context.colorsCustom.TextPrimary,
                      fontSize: 16.sp,
                    ),
                  ),
                  verticalSpace(20.h),
                  TapRowDetWidget(context, controller: item.offers!),
                ],
              );
            },
          );
        }),
      ),
    ],
  );
}
