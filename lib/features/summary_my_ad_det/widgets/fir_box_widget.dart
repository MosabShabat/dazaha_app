  import 'package:dazaha_app/core/constant/exports_libraries.dart';
import 'package:dazaha_app/core/constant/exports_widgets.dart';

Widget FirBoxWidget(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'تسوق خضار ولحوم',
          style: context.textStyles.titleMedium.bold.copyWith(
            color: context.colorsCustom.TextPrimary,
          ),
        ),
        verticalSpace(10.h),
        Text(
          '${context.buyForMe}',
          style: context.textStyles.bodySmall.medium.copyWith(
            color: context.colorsCustom.TextSecondary,
          ),
        ),
        verticalSpace(10.h),
        Text(
          'في بيض في الأغراض',
          style: context.textStyles.bodySmall.medium.copyWith(
            color: context.colorsCustom.TextSecondary,
          ),
        ),
      ],
    );
  }