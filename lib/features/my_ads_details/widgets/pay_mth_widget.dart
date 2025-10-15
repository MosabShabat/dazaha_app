import '../../../../core/constant/exports_libraries.dart';
import '../../../../core/constant/exports_widgets.dart';

Widget PayMthWidget(
  BuildContext context, {
  required cardNumber,
  required cardType,
}) {
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
          cardType,
          textAlign: TextAlign.start,
          style: context.textStyles.bodyMedium.medium.copyWith(
            color: context.colorsCustom.TextPrimary,
            fontSize: 12.sp,
          ),
        ),
        trailing: Text(
          cardNumber,
          textAlign: TextAlign.start,
          style: context.textStyles.bodySmall.regular.copyWith(
            color: context.colorsCustom.TextPrimary,
          ),
        ),
      ),
    ],
  );
}
