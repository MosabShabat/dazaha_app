import 'package:cached_network_image/cached_network_image.dart';

import '../../../../core/constant/exports_libraries.dart';
import '../../../../core/constant/exports_widgets.dart';
import '../../../core/network/models/orders/my_order_details.dart';

Widget CaptainInfoWidget(BuildContext context, Driver driverData) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        context.flightCaptain,
        textAlign: TextAlign.start,
        style: context.textStyles.bodyMedium.medium.copyWith(
          color: context.colorsCustom.TextSecondary,
        ),
      ),
      verticalSpace(10.h),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 35.w,
                backgroundImage: CachedNetworkImageProvider(
                  '${driverData.image}',
                ),
              ),
              horizontalSpace(5.w),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${driverData.name}',
                    textAlign: TextAlign.start,
                    style: context.textStyles.bodyMedium.medium.copyWith(
                      color: context.colorsCustom.TextPrimary,
                    ),
                  ),
                  verticalSpace(10.h),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SvgPicture.asset(AppAssets.svgs.star_bold_icon),
                      horizontalSpace(5.w),
                      Text(
                        '${driverData.rate}',
                        style: context.textStyles.headlineSmall.regular
                            .copyWith(
                              color: context.colorsCustom.TextPrimary,
                              fontSize: 12.sp,
                            ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          CircleAvatar(
            backgroundColor: context.colorsCustom.TealGreenSecondary,
            radius: 20.w,
            child: SvgPicture.asset(
              AppAssets.svgs.message_icon,
              color: context.colorsCustom.surfacePrimaryWhite,
            ),
          ).onTap(() {
            Get.toNamed(
              Routes.reportAProblemChatSupportScreen,
              arguments: {
                'receiverUuid': driverData.uuid,
                'receiverImage': driverData.image,
                'receiverName': driverData.name,
              },
            );
          }),
        ],
      ),
    ],
  );
}
