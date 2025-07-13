import 'package:dazaha_app/core/constant/exports_libraries.dart';
import 'package:dazaha_app/core/constant/exports_widgets.dart';

Widget personalInfoRow(BuildContext context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(backgroundImage: AssetImage(AppAssets.images.goku), maxRadius: 30.w),
          horizontalSpace(5.w),
          SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'مصعب شبات',
                  maxLines: 2,
                  textAlign: TextAlign.start,
                  style: context.textStyles.bodyMedium.medium.copyWith(
                    color: context.colorsCustom.TextPrimary,
                  ),
                ),
                Text(
                  'موقعي الحالي',
                  maxLines: 2,
                  textAlign: TextAlign.start,
                  style: context.textStyles.labelMedium.regular.copyWith(
                    color: context.colorsCustom.TextSecondary,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: context.colorsCustom.surfacePrimaryBlack.withOpacity(
                0.05,
              ), // Light shadow
              spreadRadius: 2,
              blurRadius: 6,
              offset: Offset(0, 3), // vertical offset
            ),
          ],
        ),
        child: CircleAvatar(
          backgroundColor: context.colorsCustom.surfacePrimaryWhite,
          maxRadius: 20.w,
          child: Stack(
            alignment: Alignment.center,
            children: [
              SvgPicture.asset(AppAssets.svgs.notification_bing),
              Positioned(
                top: 0, // You can adjust positioning as needed
                right: 2,
                child: CircleAvatar(
                  backgroundColor: context.colorsCustom.redColor,
                  maxRadius: 4.w,
                ),
              ),
            ],
          ),
        ),
      ),
    ],
  );
}
