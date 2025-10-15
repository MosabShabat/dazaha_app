import '../../../../core/constant/exports_libraries.dart';
import '../../../../core/helpers/theme_exports.dart';

import '../controller/home_page_controller.dart';

Widget CaseReqWidget(
  BuildContext context, {
  required HomePageController controller,
}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        '${controller.homeModel.value?.currentOrder?.date ?? ''} ${controller.homeModel.value?.currentOrder?.time ?? ''}',
        textAlign: TextAlign.start,
        style: context.textStyles.bodySmall.regular.copyWith(
          color: context.colorsCustom.TextSecondary,
          fontSize: 12.sp,
        ),
      ),

      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 0.04.sh,
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            decoration: BoxDecoration(
              color: context.colorsCustom.LightBlue,
              borderRadius: BorderRadius.all(Radius.circular(20.r)),
            ),
            child: Center(
              child: Text(
                '${controller.homeModel.value?.currentOrder?.statusText ?? ''}',
                textAlign: TextAlign.center,
                style: context.textStyles.bodySmall.medium.copyWith(
                  color: context.colorsCustom.BluePrimary,
                  fontSize: 12.sp,
                ),
              ),
            ),
          ),
        ],
      ),
    ],
  );
}
