import 'package:dazaha_app/core/constant/exports_libraries.dart';
import 'package:dazaha_app/core/constant/exports_widgets.dart';
import 'package:dazaha_app/features/price_cat_details/widgets/from_to_cou_widget.dart';

Widget PlaceColWidget(BuildContext context) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        '${context.deliveryPoints}',
        style: context.textStyles.titleSmall.medium.copyWith(
          color: context.colorsCustom.TextSecondary,
        ),
      ),
      verticalSpace(20.h),
      FromToCouWidget(
        context,
        CircleSize: 10.w,
        LineHight: 80.h,
        horSpa: 10.w,
        DelText1: 'مول المنصور',
        DetText1:
            ' بغداد، حي المنصور، شارع الأسواق المركزي (الرواد)، مجمع داندي',
        DelText2: 'بيت الأهل',
        DetText2: 'البصرة - العشار، شارع الكويت، مبنى 10',
        verticalSpaceItems: 28.h,
      ),
    ],
  );
}
