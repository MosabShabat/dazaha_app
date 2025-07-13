import 'package:dazaha_app/core/constant/exports_libraries.dart';
import 'package:dazaha_app/core/constant/exports_widgets.dart';
import 'package:dazaha_app/features/advertisement_summary/widgets/det_info_widget.dart';

Widget DataColumnWidget(BuildContext context) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        context.details,
        textAlign: TextAlign.start,
        maxLines: 1,
        style: context.textStyles.titleMedium.medium.copyWith(
          color: context.colorsCustom.TextPrimary,
        ),
      ),
      DetInfoWidget(
        context,
        textTitle: context.whatDoYouNeedHelpWith,
        TextSubTitle: 'تسوق خضار ولحوم',
      ),
      DetInfoWidget(
        context,
        textTitle: context.aBriefExplanationOfTheItems,
        TextSubTitle: 'في بيض في الأغراض',
      ),
      DetInfoWidget(
        context,
        textTitle: context.whatAreTheSizesOfTheItems,
        TextSubTitle: 'متوسطة',
      ),
      DetInfoWidget(
        context,
        textTitle: context.receiptPoint,
        TextSubTitle: 'بيت الأهل',
      ),
      DetInfoWidget(
        context,
        textTitle: context.howMuchWouldYouLikeToPay,
        TextSubTitle: 'د.ع 12,000',
      ),
    ],
  );
}
