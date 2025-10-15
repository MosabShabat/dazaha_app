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
          children: [
            CircleAvatar(
              backgroundColor: context.colorsCustom.surfacePrimaryBlack,
              maxRadius: 4.w,
            ),
            horizontalSpace(5.w),
            Text(
              data.title ?? '',
              maxLines: 5,
              textAlign: TextAlign.center,
              style: context.textStyles.bodyMedium.medium.copyWith(
                color: context.colorsCustom.TextPrimary,
              ),
            ),
          ],
        ).box.padding(EdgeInsetsGeometry.only(bottom: 20.h)).make();
      },
    ),
  );
}
//' نقل أي شيء من A إلى B'