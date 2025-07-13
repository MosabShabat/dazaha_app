import 'package:dazaha_app/core/constant/exports_libraries.dart';
import 'package:dazaha_app/core/constant/exports_widgets.dart';
import 'package:dazaha_app/core/widgets/list_tale_circle_avatar_widget.dart';
import 'package:dazaha_app/features/select_store_name/widgets/count_down_circle_widget.dart';

Widget deleteConfirmationBottomSheet(BuildContext context) {
  return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              IconCircleAvatarWidget(
                backGroundColor: context.colorsCustom.TealGreenSecondary,
                sizeCircleAvatar: 12.w,
                icon: Icons.done,
                sizIcon: 15.w,
                colorIcon: context.colorsCustom.surfacePrimaryWhite,
              ),
              horizontalSpace(5.w),
              Text(
                context.deletedSuccessfully,
                style: context.textStyles.labelSmall.medium.copyWith(
                  color: context.colorsCustom.TextPrimary,
                ),
              ),
            ],
          ),
          Row(
            children: [
              CountdownCircleWidget(context, seconds: 3),
              horizontalSpace(5.w),
              Text(
                    context.toRetreat,
                    // textAlign: TextAlign.center,
                    style: context.textStyles.labelSmall.medium.copyWith(
                      color: context.colorsCustom.ButtonLabelPrimary,
                    ),
                  ).box
                  .width(70.w)
                  .height(30.h)
                  .alignCenter
                  .color(context.colorsCustom.surfacePrimaryBlack)
                  .customRounded(BorderRadiusGeometry.circular(8.r))
                  .make(),
            ],
          ),
        ],
      ).box
      .width(Width)
      .height(Width * 0.15)
      .color(context.colorsCustom.surfacePrimaryWhite)
      .padding(EdgeInsetsGeometry.symmetric(horizontal: 12.w))
      .margin(EdgeInsetsGeometry.symmetric(horizontal: 16.w, vertical: 20.h))
      .rounded
      .make();
}
