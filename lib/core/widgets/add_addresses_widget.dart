import 'package:dazaha_app/core/constant/exports_libraries.dart';
import 'package:dazaha_app/core/constant/exports_widgets.dart';

Widget AddAddressesWidget(BuildContext context, {required bool isBlack,required onTap}) {
  return GestureDetector(
    onTap: onTap,
    child: Row(
      children: [
        Container(
          width: 20.w,
          height: 20.w,
          decoration: BoxDecoration(
            color: isBlack
                ? context.colorsCustom.surfacePrimaryBlack
                : context.colorsCustom.TealGreenSecondary,
            borderRadius: BorderRadius.circular(8.w),
          ),
          child: Icon(
            Icons.add,
            size: 16.w,
            color: isBlack
                ? Colors.transparent
                : context.colorsCustom.surfacePrimaryWhite,
          ),
        ),
        horizontalSpace(5.w),
        Text(
          context.addAddress,
          textAlign: TextAlign.center,
          maxLines: 3,
          style: context.textStyles.bodySmall.medium.copyWith(
            color: isBlack
                ? context.colorsCustom.TextPrimary
                : context.colorsCustom.TealGreenSecondary,
          ),
        ),
      ],
    ),
  );
}
