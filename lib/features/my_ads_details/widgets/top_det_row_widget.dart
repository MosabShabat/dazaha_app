import '../../../../core/constant/exports_libraries.dart';
import '../../../../core/constant/exports_widgets.dart';
import '../../../../features/home_page/widgets/case_container_widget.dart';

Widget TopDetRowWidget(
  BuildContext context, {
  required title,
  required subTitle,
  required isShow,
  required status,
  required statusText,
}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: context.textStyles.headlineSmall.bold.copyWith(
              color: context.colorsCustom.TextPrimary,
              fontSize: 20.sp,
            ),
          ),
          verticalSpace(5.h),
          Text(
            subTitle,
            style: context.textStyles.headlineSmall.regular.copyWith(
              color: context.colorsCustom.TextPrimary,
              fontSize: 12.sp,
            ),
          ),
          isShow
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    verticalSpace(20.h),
                    Text(
                      'الخميس 08/05/2025 01:03 م',
                      style: context.textStyles.headlineSmall.regular.copyWith(
                        color: context.colorsCustom.TextPrimary,
                        fontSize: 12.sp,
                      ),
                    ),
                  ],
                )
              : Container(),
        ],
      ),
      Spacer(),
      CaseContainerWidget(
        context,
        BackGroundColor: status == 'pending' || status == 'receiving_offers'
            ? context.colorsCustom.BluePrimary
            : status == 'in_progress'
            ? Colors.orange
            : Colors.green,
        height: 34.h,
        text: statusText,
        textColor: context.colorsCustom.ButtonLabelPrimary,
        textSize: 12.sp,
        horizontalPadding: 20.0.w,
        borderRadius: 20.0.r,
        onTap: () {},
      ),
    ],
  ).box.width(Width).make();
}
