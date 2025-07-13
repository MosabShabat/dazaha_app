import 'package:dazaha_app/core/constant/exports_libraries.dart';
import 'package:dazaha_app/core/constant/exports_widgets.dart';

Widget DevDetWidget(BuildContext context, {required text}) {
  return Row(
    children: [
      CircleAvatar(
        backgroundColor: context.colorsCustom.surfacePrimaryBlack,
        maxRadius: 4.w,
      ),
      horizontalSpace(5.w),
      Text(
        text,
        maxLines: 5,
        textAlign: TextAlign.center,
        style: context.textStyles.bodyMedium.medium.copyWith(
          color: context.colorsCustom.TextPrimary,
        ),
      ),
    ],
  );
}
//' نقل أي شيء من A إلى B'