import '../../../core/constant/exports_libraries.dart';
import '../../../core/constant/exports_widgets.dart';
import '../../../features/advertisement_summary/widgets/det_info_widget.dart';
import '../../../core/network/models/orders/order_details.dart';

Widget DetColumnWidget(
  BuildContext context, {
  required OrderDetails controller,
}) {
  final textStyleTitle = context.textStyles.titleMedium.medium.copyWith(
    color: context.colorsCustom.TextPrimary,
  );

  final detailsList = [
    {'title': context.whatDoYouNeedHelpWith, 'value': controller.title ?? ''},
    {
      'title': context.aBriefExplanationOfTheItems,
      'value': controller.description ?? '',
    },
    {
      'title': context.whatAreTheSizesOfTheItems,
      'value': controller.sizeTitle ?? '',
    },
    {
      'title': context.doYouNeedHelpers,
      'value': '${controller.helpers ?? ''} ${context.helpersText}',
    },
    {
      'title': context.howMuchWouldYouLikeToPay,
      'value': '${controller.likedPrice ?? ''} ${controller.currency ?? ''}',
    },
  ];

  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(context.details, style: textStyleTitle),
      ...detailsList.map(
        (item) => DetInfoWidget(
          context,
          textTitle: item['title']!,
          TextSubTitle: item['value']!,
        ),
      ),
    ],
  );
}
