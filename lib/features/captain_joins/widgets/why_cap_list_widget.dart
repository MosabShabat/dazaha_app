import 'package:dazaha_app/core/constant/exports_libraries.dart';
import 'package:dazaha_app/core/constant/exports_widgets.dart';
import 'package:dazaha_app/features/captain_joins/widgets/cap_custom_list_tail_widget.dart';

Widget WhyCapListWidget(BuildContext context) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      verticalSpace(10.h),
      Text(
        context.whyJoinAsACaptain,
        style: context.textStyles.bodyLarge.bold.copyWith(
          color: context.colorsCustom.TextPrimary,
        ),
      ),
      CapCustomListTailWidget(
        context,
        title: context.flexibilityInTime,
        subTitle: context.simpleAndFastApplicationNoRExperienceRequired,
      ),
      CapCustomListTailWidget(
        context,
        title: context.flexibilityInTime,
        subTitle: context.simpleAndFastApplicationNoRExperienceRequired,
      ),
      CapCustomListTailWidget(
        context,
        title: context.flexibilityInTime,
        subTitle: context.simpleAndFastApplicationNoRExperienceRequired,
      ),
      CapCustomListTailWidget(
        context,
        title: context.flexibilityInTime,
        subTitle: context.simpleAndFastApplicationNoRExperienceRequired,
      ),
      CapCustomListTailWidget(
        context,
        title: context.flexibilityInTime,
        subTitle: context.simpleAndFastApplicationNoRExperienceRequired,
      ),
    ],
  );
}
