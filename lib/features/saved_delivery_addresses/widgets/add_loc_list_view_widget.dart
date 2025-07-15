import 'package:dazaha_app/core/constant/exports_libraries.dart';
import 'package:dazaha_app/core/constant/exports_widgets.dart';
import 'package:dazaha_app/features/home_page/widgets/cus_button_widget.dart';

Widget AddLocListViewWidget(BuildContext context) {
  return ListView.builder(
    itemCount: 5,
    shrinkWrap: true,
    physics: NeverScrollableScrollPhysics(),
    itemBuilder: (context, index) {
      return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 32.r,
            backgroundColor: context.colorsCustom.CardBorder,
            child: SvgPicture.asset(
              AppAssets.svgs.location_icon,
              color: context.colorsCustom.surfacePrimaryBlack,
            ),
          ),
          horizontalSpace(5.w),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'بيت الأهل',
                style: context.textStyles.bodyMedium.medium.copyWith(
                  color: context.colorsCustom.TextPrimary,
                ),
              ),
              verticalSpace(10.h),
              Text(
                'حي الجزائر، شارع الكويت، البصرة، العراق',
                style: context.textStyles.bodySmall.regular.copyWith(
                  color: context.colorsCustom.TextSecondary,
                ),
              ),
              verticalSpace(10.h),
              Row(
                children: [
                  CusButtonWidget(
                    context,
                    H: 28.0.h,
                    W: 88.0.w,
                    backGroundColor:
                        context.colorsCustom.CardBackgroundLightGray,
                    radius: 16.0.r,
                    widget: Row(
                      children: [
                        SvgPicture.asset(
                          AppAssets.svgs.edit_icon,
                          color: context.colorsCustom.surfacePrimaryBlack,
                        ),
                        horizontalSpace(5.w),
                        Text(
                          context.edit,
                          style: context.textStyles.bodySmall.medium.copyWith(
                            color: context.colorsCustom.TextPrimary,
                          ),
                        ),
                      ],
                    ),
                  ),
                  horizontalSpace(5.w),
                  CusButtonWidget(
                    context,
                    H: 28.0.h,
                    W: 88.0.w,
                    backGroundColor: context.colorsCustom.LightRed,
                    radius: 16.0.r,
                    widget: Row(
                      children: [
                        SvgPicture.asset(
                          AppAssets.svgs.trash_icon,
                          color: context.colorsCustom.surfacePrimaryBlack,
                        ),
                        horizontalSpace(5.w),
                        Text(
                          context.delete,
                          style: context.textStyles.bodySmall.medium.copyWith(
                            color: context.colorsCustom.TextPrimary,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      );
    },
  );
}
