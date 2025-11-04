import 'package:cached_network_image/cached_network_image.dart';

import '../../../../core/constant/exports_libraries.dart';
import '../../../../core/constant/exports_widgets.dart';
import '../../../../core/widgets/latest_announcements_widget.dart';

Widget MidInfoColWidget(
  BuildContext context, {
  required String name,
  required String rate,
  required String addedAt,
  required String uuid,
  required String image,

  //image
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      LatestAnnouncementsRowWidget(
        context,
        text: context.transferDate,
        size: 12.sp,
        fontFamily: context.textStyles.bodySmall.medium.fontFamily,
        onPressed: () {
          print(context.reset);
        },
        Widget: Container(),
      ),
      Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(
            AppAssets.svgs.calendar_icon,
            width: 30.w,
            height: 30.w,
          ),
          horizontalSpace(5.w),
          Text(
            addedAt,
            textAlign: TextAlign.start,
            style: context.textStyles.bodySmall.medium.copyWith(
              color: context.colorsCustom.TextPrimary,
            ),
          ),
        ],
      ),
      verticalSpace(10.h),
      Text(
        context.presenter,
        textAlign: TextAlign.start,
        style: context.textStyles.bodyMedium.medium.copyWith(
          color: context.colorsCustom.TextPrimary,
        ),
      ),
      verticalSpace(10.h),
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
            backgroundImage: CachedNetworkImageProvider(image),
            radius: 30.w,
          ),
          horizontalSpace(10.w),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                name,
                textAlign: TextAlign.start,
                style: context.textStyles.bodySmall.medium.copyWith(
                  color: context.colorsCustom.TextPrimary,
                ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SvgPicture.asset(AppAssets.svgs.star_bold_icon),
                  horizontalSpace(5.w),
                  Text(
                    rate,
                    style: context.textStyles.headlineSmall.medium.copyWith(
                      color: context.colorsCustom.TextPrimary,
                      fontSize: 12.sp,
                    ),
                  ),
                ],
              ),
            ],
          ).box.height(50.h).make(),
        ],
      ),
      verticalSpace(20.h),
    ],
  );
}
