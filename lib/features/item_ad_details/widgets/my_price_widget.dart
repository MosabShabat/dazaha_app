import 'package:dazaha_app/core/constant/exports_libraries.dart';
import 'package:dazaha_app/core/constant/exports_widgets.dart';
import 'package:dazaha_app/features/price_details/widgets/in_put_price_widget.dart';

Widget MyPriceWidget(BuildContext context) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        context.yourPriceForDisplay,
        style: context.textStyles.bodyMedium.medium.copyWith(
          color: context.colorsCustom.TextSecondary,
        ),
      ),
      verticalSpace(15.h),
      InPutPriceWidget(
        context,
        isShow: false,
        FW: FontWeight.w400,
        hintText: context.yourPriceHere,
        textColor: context.colorsCustom.TextSecondary,
        FZ: 12.sp,
      ),
    ],
  );
}
