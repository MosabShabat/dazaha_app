import '../../../../core/constant/exports_libraries.dart';
import '../../../../core/constant/exports_widgets.dart';
import '../../../../features/advertisement_summary/widgets/det_info_widget.dart';
import '../../../core/network/models/orders/order_details.dart';

Widget DataColumnWidget(
  BuildContext context, {
  required bool isShow,
  required OrderDetails controller,
}) {
  // Build a list of detail widgets dynamically
  final details = [
    {'title': context.whatDoYouNeedHelpWith, 'subtitle': controller.title},
    {
      'title': context.aBriefExplanationOfTheItems,
      'subtitle': controller.description,
    },
    {
      'title': context.whatAreTheSizesOfTheItems,
      'subtitle': controller.sizeTitle,
    },
    if (isShow) {'title': context.receiptPoint, 'subtitle': 'بيت الأهل'},
    {
      'title': context.howMuchWouldYouLikeToPay,
      'subtitle': '${controller.likedPrice ?? ''} ${controller.currency ?? ''}',
    },
  ];

  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        context.details,
        style: context.textStyles.titleMedium.medium.copyWith(
          color: context.colorsCustom.TextPrimary,
        ),
      ),
      ...details.map(
        (item) => DetInfoWidget(
          context,
          textTitle: item['title'] ?? '',
          TextSubTitle: '${item['subtitle'] ?? ''}',
        ),
      ),
    ],
  );
}
