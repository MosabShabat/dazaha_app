import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../core/constant/exports_libraries.dart';
import '../../../../core/constant/exports_widgets.dart';
import '../../../core/widgets/app_shimmers/custom_shimmer.dart';
import '../controller/home_page_controller.dart';

Widget mainBottomWidget(
  BuildContext context, {
  required Color backGroundColor,
  required Color textColor,
  required String fontFamily,
  required double fontSize,
  required double CircleAvatarRadius,
  required FontWeight fontWeight,
  required MainAxisAlignment mainAxisAlignment,
  required HomePageController controller,
  double? width,
  int? maxLines,
  List<VoidCallback>? onTapList,
  bool isSvg = false, // لتحديد نوع الصورة
}) {
  return Obx(() {
    final services = controller.homeModel.value?.services ?? [];

    return Row(
      mainAxisAlignment: mainAxisAlignment,
      children: List.generate(services.length, (index) {
        final service = services[index];

        if (controller.isLoading.isTrue) {
          return Column(
            children: [
              CustomShimmer(width: 70.w, height: 70.w, borderRadius: 50),
              verticalSpace(10.h),
              CustomShimmer(width: 50.w, height: 6.w),
            ],
          );
        }

        return GestureDetector(
          onTap: onTapList != null && index < onTapList.length
              ? onTapList[index]
              : null,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                backgroundColor: backGroundColor,
                radius: CircleAvatarRadius,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(CircleAvatarRadius),
                  child: SizedBox(
                    width: 40.w,
                    height: 40.w,
                    child: isSvg
                        ? SvgPicture.network(
                            service.image ?? '',
                            fit: BoxFit.contain,
                            placeholderBuilder: (_) => CustomShimmer(
                              width: 40.w,
                              height: 40.w,
                              borderRadius: 20,
                            ),
                          )
                        : CachedNetworkImage(
                            imageUrl: service.image ?? '',
                            fit: BoxFit.contain,
                            placeholder: (_, __) => CustomShimmer(
                              width: 40.w,
                              height: 40.w,
                              borderRadius: 20,
                            ),
                          ),
                  ),
                ),
              ),
              verticalSpace(10.h),
              Text(
                service.title ?? '',
                maxLines: maxLines ?? 1,
                textAlign: TextAlign.center,
                style: context.textStyles.bodySmall.copyWith(
                  color: textColor,
                  fontFamily: fontFamily,
                  fontSize: fontSize,
                  fontWeight: fontWeight,
                ),
              ).box.width(width ?? 77.w).make(),
            ],
          ),
        );
      }),
    );
  });
}
