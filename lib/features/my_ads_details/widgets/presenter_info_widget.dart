import 'package:dazaha_app/core/constant/exports_libraries.dart';
import 'package:dazaha_app/core/constant/exports_widgets.dart';
import 'package:dazaha_app/features/home_page/widgets/case_container_widget.dart';
import 'package:dazaha_app/features/my_ads_details/widgets/accept_cat_bottom_sheet/accept_bottom_sheet_widget.dart';

Widget PresenterInfoWidget(BuildContext context) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      verticalSpace(5.h),
      Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'عباس الجبوري',
            style: context.textStyles.headlineSmall.medium.copyWith(
              color: context.colorsCustom.TextPrimary,
              fontSize: 12.sp,
            ),
          ),
          Text(
            ' 10,020 د.ع',
            style: context.textStyles.headlineSmall.medium.copyWith(
              color: context.colorsCustom.TextPrimary,
              fontSize: 16.sp,
            ),
          ),
        ],
      ).box.width(250.w).make(),
      verticalSpace(5.h),
      Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SvgPicture.asset(AppAssets.svgs.star_bold_icon),
          horizontalSpace(5.w),
          Text(
            '5.0',
            style: context.textStyles.headlineSmall.medium.copyWith(
              color: context.colorsCustom.TextPrimary,
              fontSize: 12.sp,
            ),
          ),
        ],
      ),
      verticalSpace(10.h),
      Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '05/06/2025 01:01 م',
            style: context.textStyles.headlineSmall.regular.copyWith(
              color: context.colorsCustom.TextSecondary,
              fontSize: 12.sp,
            ),
          ),
          CaseContainerWidget(
            context,
            BackGroundColor: context.colorsCustom.TealGreenSecondary,
            height: 31.h,
            text: '${context.acceptance}',
            textColor: context.colorsCustom.ButtonLabelPrimary,
            textSize: 12.sp,
            horizontalPadding: 25.0.w,
            borderRadius: 8.0.r,
            colorBorder: context.colorsCustom.TealGreenSecondary,
            onTap: () {
              AcceptBottomSheetWidget(context);
            },
          ),
        ],
      ).box.width(250.w).make(),
    ],
  );
}
