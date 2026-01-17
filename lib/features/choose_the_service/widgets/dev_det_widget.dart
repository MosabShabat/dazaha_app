import '../../../../core/constant/exports_libraries.dart';
import '../../../../core/constant/exports_widgets.dart';
import '../controller/choose_the_service_controller.dart';

Widget DevDetWidget(
  BuildContext context, {
  required ChooseTheServiceController controller,
}) {
  return Column(
    children: List.generate(
      controller.serviceModel!.value.instructions!.length,
      (index) {
        final data = controller.serviceModel!.value.instructions![index];
        return Row(
          crossAxisAlignment: CrossAxisAlignment.start, // لضبط النص لأعلى
          children: [
            CircleAvatar(
              backgroundColor: context.colorsCustom.surfacePrimaryBlack,
              maxRadius: 4.w,
            ),
            horizontalSpace(5.w),
            // ✨ ضع النص داخل Expanded ليأخذ المساحة المتبقية ويكسر السطر
            Expanded(
              child: Text(
                data.title ?? '',
                maxLines: 5,
                overflow: TextOverflow.visible,
                style: context.textStyles.bodyMedium.medium.copyWith(
                  color: context.colorsCustom.TextPrimary,
                  fontSize: 14.sp,
                ),
              ),
            ),
          ],
        ).box.padding(EdgeInsets.only(bottom: 20.h)).make();
      },
    ),
  );
}
//' نقل أي شيء من A إلى B'
// I/flutter (30982): 31.51453533
// I/flutter (30982): 34.45096985
// I/flutter (30982): 
// I/flutter (30982): 34.44431696