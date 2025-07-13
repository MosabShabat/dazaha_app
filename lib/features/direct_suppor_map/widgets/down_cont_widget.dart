import 'package:dazaha_app/core/constant/exports_libraries.dart';
import 'package:dazaha_app/core/constant/exports_widgets.dart';
import 'package:dazaha_app/features/direct_suppor_map/widgets/cap_pr_row_widget.dart';
import 'package:dazaha_app/features/price_cat_details/widgets/from_to_cou_widget.dart';

Widget DownContWidget(BuildContext context) {
  return Container(
    height: 290.h,
    decoration: BoxDecoration(
      color: context.colorsCustom.surfacePrimaryWhite,
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(20.r),
        topRight: Radius.circular(20.r),
      ),
    ),
    child: Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
      child: Column(
        children: [
          CapPrRowWidget(context),
          verticalSpace(20.h),
          FromToCouWidget(
            context,
            CircleSize: 8.w,
            LineHight: 56.h,
            horSpa: 7.w,
            DelText1: 'بغداد - الكرادة، شارع السعدون، مبنى 25',
            DetText1: '',
            DelText2: 'البصرة - العشار، شارع الكويت، مبنى 10',
            DetText2: '',
            verticalSpaceItems: 15.h,
          ),
        ],
      ),
    ),
  );
}
