import 'package:dazaha_app/core/constant/exports_libraries.dart';
import 'package:dazaha_app/core/constant/exports_widgets.dart';
import 'package:lottie/lottie.dart';

Widget EmptyTagWidget(BuildContext context) {
  return Center(
    child: Column(
      children: [
        Lottie.asset(AppAssets.json.process_json, width: 101.w, height: 101.w),
        verticalSpace(20.h),
        Text(
          context.historyEmpty,
          style: context.textStyles.titleLarge.bold.copyWith(
            color: context.colorsCustom.TextPrimary,
            fontSize: 20.sp,
          ),
        ),
      ],
    ),
  );
}
