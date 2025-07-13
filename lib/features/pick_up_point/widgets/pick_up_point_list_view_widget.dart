import 'package:dazaha_app/core/constant/exports_libraries.dart';
import 'package:dazaha_app/core/constant/exports_widgets.dart';
import 'package:dazaha_app/features/choose_the_service/widgets/text_service_widget.dart';

Widget PickUpPointListViewWidget(BuildContext context, {required onTap}) {
  return ListView.builder(
    shrinkWrap: true,
    scrollDirection: Axis.vertical,
    itemCount: 4,
    itemBuilder: (context, index) {
      return Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                backgroundColor: context.colorsCustom.CardBackgroundLightGray,
                radius: 30.w,
                child: SvgPicture.asset(
                  AppAssets.svgs.location_icon,
                  width: 25.w,
                  height: 25.w,
                ),
              ),
              SizedBox(width: 10.w),
              TextServiceWidget(
                context,
                color1: context.colorsCustom.TextPrimary,
                text1: 'بيت الأهل',
                size1: 14.0.sp,
                fontFamily1: context.textStyles.bodyMedium.bold.fontFamily,
                color2: context.colorsCustom.TextSecondary,
                text2: 'حي الجزائر، شارع الكويت، البصرة، العراق',
                size2: 12.0.sp,
                fontFamily2: context.textStyles.bodySmall.regular.fontFamily,
              ),
            ],
          ).box.rounded
          .margin(EdgeInsetsGeometry.only(bottom: 10.h))
          .padding(EdgeInsetsGeometry.symmetric(vertical: 10.h))
          .make()
          .onTap(onTap);
    },
  ).box.width(Width).height(Height / 1.6).make();
}
