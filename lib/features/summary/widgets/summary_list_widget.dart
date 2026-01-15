import '../../../core/constant/exports_libraries.dart';
import '../../../core/constant/exports_widgets.dart';
import '../../../features/summary/widgets/dashed_vertical_line.dart';

Widget SummaryListWidget(
  BuildContext context, {
  double? radius,
  required int itemsLen,
  required List itemsDet,
}) {
  final teal = context.colorsCustom.TealGreenSecondary;

  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        '${context.shoppingList} ( $itemsLen )',
        style: context.textStyles.titleMedium.medium.copyWith(
          color: context.colorsCustom.TextPrimary,
        ),
      ),
      verticalSpace(10.h),
      ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        padding: EdgeInsets.all(0),
        itemCount: itemsLen,
        itemBuilder: (context, index) {
          final item = itemsDet[index];
          final isLast = index == itemsLen - 1;

          return Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Circle + dashed line
              Column(
                children: [
                  CircleAvatar(
                        radius: radius ?? 7.r,
                        backgroundColor:
                            context.colorsCustom.surfacePrimaryWhite,
                      ).box
                      .customRounded(BorderRadius.circular(14.r))
                      .border(color: teal, width: 5.w)
                      .make(),
                  if (!isLast)
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 12.w),
                      child: DashedVerticalLine(
                        height: 60.h,
                        dashHeight: 6,
                        dashGap: 10,
                        color: teal.withOpacity(0.15),
                      ),
                    ),
                ],
              ),
              horizontalSpace(10.w),

              // Item info
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.name ?? '',
                    maxLines: 1,
                    style: context.textStyles.bodyMedium.medium.copyWith(
                      color: context.colorsCustom.TextPrimary,
                    ),
                  ),
                  verticalSpace(10.h),
                  Text(
                    '${context.amount}: ${item.quantity} ${item.type == '1' ? context.piece : context.kilo}',
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
