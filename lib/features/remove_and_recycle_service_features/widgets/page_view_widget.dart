import 'package:dazaha_app/core/constant/exports_libraries.dart';
import 'package:dazaha_app/core/constant/exports_widgets.dart';
import 'package:dazaha_app/features/remove_and_recycle_service_features/controller/remove_and_recycle_service_features_controller.dart';

Widget PageViewWidget(BuildContext context) {
  final controller = Get.put(RemoveAndRecycleServiceFeaturesController());

  final List<String> images = [
    AppAssets.svgs.group_one_icon,
    AppAssets.svgs.group_tow_icon,
    AppAssets.svgs.group_120858_icon,
    AppAssets.svgs.group_for_icon,
  ];

  final List<String> titles = [
    'أنشئ إعلانك بسهولة',
    'اختر المساعد الأنسب',
    'التحقق من التدوير',
    'الدفع بعد إنجاز المهمة',
  ];

  final List<String> subtitles = [
    'أرفق صورة أو أكثر للغرض الذي تريد التخلص منه، ووضح ما تحتاج المساعدة فيه.\n\nأدخل العنوان وأي تفاصيل مثل رقم الطابق أو رمز الدخول، لن تظهر إلا للمساعد بعد القبول.\n\nحدد كم ترغب أن تدفع مقابل إنجاز المهمة.',
    'بعد نشر إعلانك، سيقترح المستخدمون المتاحون أوقاتًا للمساعدة في نفس اليوم أو اليوم التالي.\n\nاختر ببساطة الوقت والمساعد الأنسب لك حسب التقييم أو الوقت المتاح.',
    'نطلب من المساعدين الذين ينقلون المواد القابلة للتدوير أن يثبتوا تسليمها في نقطة معتمدة.\n\nيتم التحقق عبر تحديد الموقع والتاريخ وإرفاق صورة عند نقطة التدوير، ليتم مراجعتها من فريقنا لاحقًا.',
    'يتم حجز المبلغ على بطاقتك بمجرد بدء المهمة، دون خصمه فورًا.\n\nيُحوَّل المبلغ فقط بعد تأكيدك أن المهمة أُنجزت كما طلبت.',
  ];

  return Column(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    crossAxisAlignment: CrossAxisAlignment.start,

    children: [
      SizedBox(
        height: 680.h,
        child: PageView.builder(
          controller: controller.pageController,
          itemCount: controller.itemCount,
          itemBuilder: (context, index) {
            return AnimatedBuilder(
              animation: controller.pageController,
              builder: (context, child) {
                double value = 1.0;
                if (controller.pageController.position.haveDimensions) {
                  value = (controller.pageController.page! - index).abs();
                  value = 1 - (value.clamp(0.0, 1.0));
                }
                return Opacity(
                  opacity: value,
                  child: Transform.scale(
                    scale: 0.95 + (value * 0.05),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          images[index],
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
                              titles[index],
                              style: context.textStyles.bodyLarge.bold.copyWith(
                                color: context.colorsCustom.TextPrimary,
                                fontSize: 26.sp,
                              ),
                            ),
                            verticalSpace(30.h),
                            Text(
                              subtitles[index],
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
          children: List.generate(controller.itemCount, (index) {
            final isActive = controller.currentPage.value == index;
            return AnimatedContainer(
              duration: Duration(milliseconds: 300),
              margin: EdgeInsets.symmetric(horizontal: 4.w),
              width: isActive ? 16.w : 16.w,
              height: 2.h,
              decoration: BoxDecoration(
                color: isActive
                    ? context.colorsCustom.TealGreenSecondary
                    : context.colorsCustom.CardBorder,
                borderRadius: BorderRadius.circular(4.r),
              ),
            );
          }),
        );
      }),
    ],
  );
}
