import 'package:cached_network_image/cached_network_image.dart';

import '../../../core/constant/exports_libraries.dart';
import '../../../core/constant/exports_widgets.dart';
import '../../../features/remove_and_recycle_service_features/controller/remove_and_recycle_service_features_controller.dart';
import '../../choose_the_service/controller/choose_the_service_controller.dart';

class PageViewWidget extends StatelessWidget {
  PageViewWidget({Key? key}) : super(key: key);
  final ChooseTheServiceController chooseTheServiceController = Get.find();

  @override
  Widget build(BuildContext context) {
    final RemoveAndRecycleServiceFeaturesController controller = Get.find();

    controller.itemCount.value =
        chooseTheServiceController.serviceModel?.value.intros?.length ?? 0;

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 680.h,
          child: PageView.builder(
            controller: controller.pageController,
            itemCount:
                chooseTheServiceController.serviceModel!.value.intros!.length,
            itemBuilder: (context, index) {
              return AnimatedBuilder(
                animation: controller.pageController,
                builder: (context, child) {
                  double value = 1.0;
                  if (controller.pageController.position.haveDimensions) {
                    value = (controller.pageController.page! - index).abs();
                    value = 1 - (value.clamp(0.0, 1.0));
                  }
                  final data = chooseTheServiceController
                      .serviceModel!
                      .value
                      .intros![index];
                  return Opacity(
                    opacity: value,
                    child: Transform.scale(
                      scale: 0.95 + (value * 0.05),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CachedNetworkImage(
                            imageUrl: data.image ?? '',
                            width: 300.w,
                            height: 200.w,
                            fit: BoxFit.contain,
                          ),
                          verticalSpace(60.h),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                data.title ?? '',

                                style: context.textStyles.bodyLarge.bold
                                    .copyWith(
                                      color: context.colorsCustom.TextPrimary,
                                      fontSize: 26.sp,
                                    ),
                              ),
                              verticalSpace(30.h),
                              Text(
                                data.description ?? '',
                                maxLines: 10,
                                style: context.textStyles.bodyMedium.regular
                                    .copyWith(
                                      color: context.colorsCustom.TextSecondary,
                                      height: 1.5.h,
                                    ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            },
          ),
        ),
        Obx(() {
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              chooseTheServiceController.serviceModel!.value.intros!.length,
              (index) {
                final isActive = controller.currentPage.value == index;
                return AnimatedContainer(
                  duration: Duration(milliseconds: 300),
                  margin: EdgeInsets.symmetric(horizontal: 4.w),
                  width: 16.w,
                  height: 2.h,
                  decoration: BoxDecoration(
                    color: isActive
                        ? context.colorsCustom.TealGreenSecondary
                        : context.colorsCustom.CardBorder,
                    borderRadius: BorderRadius.circular(4.r),
                  ),
                );
              },
            ),
          );
        }),
      ],
    );
  }
}
