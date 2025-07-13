import 'package:dazaha_app/core/constant/exports_libraries.dart';
import 'package:dazaha_app/core/helpers/spacing.dart';
import 'package:dazaha_app/core/helpers/theme_exports.dart';
import 'package:dazaha_app/features/home_page/widgets/case_req_widget.dart';
import 'package:dazaha_app/features/home_page/widgets/req_info_widget.dart';
import 'package:dazaha_app/features/price_cat_details/widgets/from_to_cou_widget.dart';

Widget DetailsContainerWidget(BuildContext context) {
  return Container(
    padding: EdgeInsets.all(16.w),
    decoration: BoxDecoration(
      border: Border.all(color: context.colorsCustom.LightGrey, width: 1),
      borderRadius: BorderRadius.circular(12.r),
    ),
    child: SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CaseReqWidget(context),
          verticalSpace(15.h),
          ReqInfoWidget(context),
          verticalSpace(15.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.w),
            child: FromToCouWidget(
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
          ),
        ],
      ),
    ),
  );
}
