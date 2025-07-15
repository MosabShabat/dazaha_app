import 'package:dazaha_app/core/constant/exports_libraries.dart';
import 'package:dazaha_app/core/constant/exports_widgets.dart';
import 'package:dazaha_app/features/advertisement_summary/widgets/det_info_widget.dart';

Widget DetColumnWidget(BuildContext context) {
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
        TextSubTitle: 'نقل قنفة 3 مقاعد، وطاولة سفرة خشب.',
      ),
      DetInfoWidget(
        context,
        textTitle: context.aBriefExplanationOfTheItems,
        TextSubTitle:
            'الكنبة كبيرة وتحتاج فان أو سيارة تحميل. الطاولة قابلة للفك، بس وزنها تقيل شوي وتحتاج حذر بالنقل.',
      ),
      DetInfoWidget(
        context,
        textTitle: context.whatAreTheSizesOfTheItems,
        TextSubTitle: 'متوسطة',
      ),
      DetInfoWidget(
        context,
        textTitle: context.doYouNeedHelpers,
        TextSubTitle: '3 مساعدين',
      ),
      DetInfoWidget(
        context,
        textTitle: context.howMuchWouldYouLikeToPay,
        TextSubTitle: 'د.ع 12,000',
      ),
    ],
  );
}
