import 'package:dazaha_app/core/constant/exports_libraries.dart';
import 'package:dazaha_app/core/constant/exports_widgets.dart';

Widget PayMthWidget(BuildContext context) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        context.paymentMethod,
        textAlign: TextAlign.start,
        style: context.textStyles.bodyMedium.medium.copyWith(
          color: context.colorsCustom.TextSecondary,
        ),
      ),
      ListTile(
        contentPadding: EdgeInsets.all(0),
        leading: SvgPicture.asset(AppAssets.svgs.cre_card_icon),
        title: Text(
          context.cardPayment,
          textAlign: TextAlign.start,
          style: context.textStyles.bodyMedium.medium.copyWith(
            color: context.colorsCustom.TextPrimary,
            fontSize: 12.sp,
          ),
        ),
        trailing: Text(
          'XXXX XXXX XXX 3321',
          textAlign: TextAlign.start,
          style: context.textStyles.bodySmall.regular.copyWith(
            color: context.colorsCustom.TextPrimary,
          ),
        ),
      ),
    ],
  );
}
