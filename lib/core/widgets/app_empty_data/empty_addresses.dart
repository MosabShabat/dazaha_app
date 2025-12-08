import '../../../../core/constant/exports_libraries.dart';
import '../../../../core/constant/exports_widgets.dart';
import 'package:lottie/lottie.dart';

Widget EmptyAddresses(BuildContext context) {
  return Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        verticalSpace(120),
        Lottie.asset(
          AppAssets.json.jsonLocation,
          width: 200,
          height: 200,
          fit: BoxFit.fill,
        ),
        verticalSpace(8),
        Text(
          context.locationEmptyTitle,
          style: TextStyle(
            fontSize: 22.sp,
            fontWeight: FontWeight.w700,
            color: context.colorsCustom.TextPrimary,
            fontFamily: 'Tajawal',
          ),
        ),
        verticalSpace(8),
        Text(
          context.locationEmptyDescrition,
          textAlign: TextAlign.center,
          maxLines: 3,
          style: TextStyle(
            fontSize: 12.sp,
            fontWeight: FontWeight.w500,
            color: context.colorsCustom.TextSecondary,
            fontFamily: 'Tajawal',
          ),
        ),
      ],
    ),
  );
}
