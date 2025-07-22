import 'package:dazaha_app/core/constant/exports_libraries.dart';
import 'package:dazaha_app/core/constant/exports_widgets.dart';
import 'package:dazaha_app/features/summary/widgets/dashed_vertical_line.dart';

Widget SummaryListWidget(BuildContext context, {radius}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        '${context.shoppingList} ( 4 )',
        style: context.textStyles.titleMedium.medium.copyWith(
          color: context.colorsCustom.TextPrimary,
        ),
      ),
      verticalSpace(10.h),
      ListView.builder(
        shrinkWrap: true,
        itemCount: 4,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                        backgroundColor:
                            context.colorsCustom.surfacePrimaryWhite,
                        radius: radius ?? 7.r,
                      ).box
                      .customRounded(BorderRadiusGeometry.circular(14.r))
                      .border(
                        color: context.colorsCustom.TealGreenSecondary,
                        width: 5.w,
                      )
                      .make(),
                  if (index < 3)
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 12.w),
                      child: DashedVerticalLine(
                        height: 80.h,
                        dashHeight: 6,
                        dashGap: 10,
                        color: context.colorsCustom.TealGreenSecondary
                            .withOpacity(0.15),
                      ),
                    ),
                ],
              ),
              horizontalSpace(10.w),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'سكر ناعم أبيض تركي',
                    textAlign: TextAlign.start,
                    maxLines: 1,
                    style: context.textStyles.bodyMedium.medium.copyWith(
                      color: context.colorsCustom.TextPrimary,
                    ),
                  ),
                  verticalSpace(10.h),
                  Text(
                    '${context.amount}:  5 كيلو   ',
                    textAlign: TextAlign.start,
                    maxLines: 1,
                    style: context.textStyles.labelMedium.medium.copyWith(
                      color: context.colorsCustom.TextPrimary,
                    ),
                  ),
                ],
              ),
            ],
          );
        },
      ),
    ],
  );
}
