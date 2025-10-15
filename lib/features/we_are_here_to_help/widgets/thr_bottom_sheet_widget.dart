import '../../../../core/constant/exports_libraries.dart';
import '../../../../core/constant/exports_widgets.dart';
import '../../../../core/widgets/app_shimmers/faq_shimmer_list.dart';
import '../../../../core/widgets/top_con_bot_sh_widget.dart';
import '../../../../features/we_are_here_to_help/controller/faq_controller.dart';

Future<dynamic> ThrBottomSheetWidget(BuildContext context) {
  final FAQController _faqController = Get.put(FAQController());

  return showModalBottomSheet(
    isScrollControlled: true,
    context: context,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    clipBehavior: Clip.antiAliasWithSaveLayer,
    builder: (_) {
      return Container(
        width: Width.w,
        height: 750.h,
        color: context.colorsCustom.surfacePrimaryWhite,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            verticalSpace(10.h),
            TopConBotShWidget(context).box.alignCenter.make(),
            verticalSpace(10.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Text(
                context.frequentlyAskedQuestions,
                style: context.textStyles.bodyLarge.medium.copyWith(
                  color: context.colorsCustom.TextPrimary,
                  fontSize: 20.sp,
                ),
              ),
            ),
            verticalSpace(10.h),
            Expanded(
              child: Obx(() {
                if (_faqController.isLoading.value) {
                  return faqListShimmer(context, false);
                }

                return SingleChildScrollView(
                  child: ExpansionPanelList(
                    elevation: 0,
                    expandedHeaderPadding: EdgeInsets.zero,
                    dividerColor: context.colorsCustom.surfacePrimaryWhite,
                    expansionCallback: (index, isExpanded) =>
                        _faqController.toggleExpanded(index),
                    children: List.generate(
                      _faqController.faqModelItems.length,
                      (index) {
                        final faqItem = _faqController.faqModelItems[index];
                        final isExpanded = _faqController.isExpanded[index];
                        final bgColor = isExpanded
                            ? context.colorsCustom.CardBackgroundLightGray
                            : context.colorsCustom.surfacePrimaryWhite;

                        return ExpansionPanel(
                          canTapOnHeader: true,
                          isExpanded: isExpanded,
                          backgroundColor: bgColor,
                          headerBuilder: (_, __) => Container(
                            color: bgColor,
                            padding: EdgeInsets.symmetric(
                              horizontal: 16.w,
                              vertical: 12.h,
                            ),
                            child: Text(
                              faqItem.question ?? '',
                              style: context.textStyles.bodySmall.medium
                                  .copyWith(
                                    color: context.colorsCustom.TextPrimary,
                                  ),
                            ),
                          ),
                          body: Container(
                            width: double.infinity,
                            color: context.colorsCustom.CardBackgroundLightGray,
                            padding: EdgeInsets.symmetric(
                              horizontal: 16.w,
                              vertical: 12.h,
                            ),
                            child: Text(
                              faqItem.answer ?? '',
                              textAlign: TextAlign.start,
                              style: context.textStyles.bodySmall,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                );
              }),
            ),
          ],
        ),
      );
    },
  );
}
