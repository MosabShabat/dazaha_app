import 'package:cached_network_image/cached_network_image.dart';
import '../../../core/constant/exports_libraries.dart';
import '../../../core/constant/exports_widgets.dart';
import '../../../core/widgets/list_tale_circle_avatar_widget.dart';
import '../../../core/widgets/app_shimmers/custom_shimmer.dart';
import '../../choose_the_service/controller/order_data_controller.dart';
import '../../../features/ad_details/controller/ad_details_controller.dart';

Widget ListViewAdDetailsWidget({
  required BuildContext context,
  required OrderDataController orderDataController,
}) {
  final AdDetailsController controller = Get.find<AdDetailsController>();

  return Obx(() {
    if (controller.isDataLoading.isTrue) {
      return SizedBox(
        height: Width * 0.26,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(
            4,
            (_) =>
                CustomShimmer(width: 80.w, height: 120.h, borderRadius: 12.r),
          ),
        ),
      );
    }

    return SizedBox(
      height: Width * 0.27,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(4, (index) {
          final isSelected = controller.selectedIndex.value == index;
          final sizeItem = controller.sizeMod[index];

          return GestureDetector(
            onTap: () {
              controller.changeSelect(index);
              orderDataController.setSizeUuid(sizeItem.uuid ?? '');
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Stack(
                      children: [
                        CachedNetworkImage(
                          imageUrl: sizeItem.image ?? '',
                          fit: BoxFit.contain,
                          width: 70.w,
                          height: 70.w,
                        ),
                        if (isSelected)
                          IconCircleAvatarWidget(
                            backGroundColor:
                                context.colorsCustom.TealGreenSecondary,
                            sizeCircleAvatar: 8.w,
                            icon: Icons.done,
                            sizIcon: 12.w,
                            colorIcon: context.colorsCustom.surfacePrimaryWhite,
                          ).positioned(
                            left:
                                Localizations.localeOf(context).languageCode ==
                                    "ar"
                                ? 0.w
                                : null,
                            right:
                                Localizations.localeOf(context).languageCode !=
                                    "ar"
                                ? 0.w
                                : null,
                          ),
                      ],
                    ).box
                    .color(context.colorsCustom.surfacePrimaryWhite)
                    .border(
                      width: 1,
                      color: isSelected
                          ? context.colorsCustom.TealGreenSecondary
                          : context.colorsCustom.CardBorder,
                    )
                    .rounded
                    .padding(
                      EdgeInsetsGeometry.symmetric(
                        horizontal: 5.w,
                        vertical: 3.w,
                      ),
                    )
                    .margin(EdgeInsetsGeometry.symmetric(horizontal: 5.w))
                    .make(),
                verticalSpace(5.h),
                Text(
                  sizeItem.title ?? '',
                  textAlign: TextAlign.center,
                  maxLines: 1,
                  style: context.textStyles.bodySmall.regular.copyWith(
                    color: isSelected
                        ? context.colorsCustom.TealGreenSecondary
                        : context.colorsCustom.TextPrimary,
                  ),
                ),
              ],
            ).box.width(90.w).make(),
          );
        }),
      ),
    );
  });
}
