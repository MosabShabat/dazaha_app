import 'package:cached_network_image/cached_network_image.dart';

import '../../../../core/constant/exports_libraries.dart';
import '../../../../core/constant/exports_widgets.dart';
import '../../choose_the_service/controller/order_data_controller.dart';

Widget CapPrRowWidget(BuildContext context, {required VoidCallback page}) {
final  OrderDataController orderDataController = Get.find();
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Row(
        children: [
          CircleAvatar(
            backgroundImage: CachedNetworkImageProvider(
              '${orderDataController.userImage}',
            ),
            radius: 25.w,
          ),
          horizontalSpace(5.w),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${orderDataController.userName}',
                textAlign: TextAlign.start,
                style: context.textStyles.bodyMedium.medium.copyWith(
                  color: context.colorsCustom.TextPrimary,
                ),
              ),
              verticalSpace(10.h),
              Text(
                '${orderDataController.userRate} ${context.positiveEvaluation}',
                style: context.textStyles.headlineSmall.regular.copyWith(
                  color: context.colorsCustom.TextPrimary,
                  fontSize: 12.sp,
                ),
              ),
            ],
          ),
        ],
      ),
      Row(
        children: [
          CircleAvatar(
            backgroundColor: context.colorsCustom.CardBackgroundLightGray,
            radius: 20.w,
            child: SvgPicture.asset(
              AppAssets.svgs.message_icon,
              color: context.colorsCustom.surfacePrimaryBlack,
            ),
          ).onTap(() {
            Get.toNamed(Routes.reportAProblemChatSupportScreen);
          }),
          horizontalSpace(10.w),
          CircleAvatar(
            backgroundColor: context.colorsCustom.TealGreenSecondary,
            radius: 20.w,
            child: SvgPicture.asset(
              AppAssets.svgs.call_icon,
              color: context.colorsCustom.surfacePrimaryWhite,
            ),
          ).onTap(() {
            // page;
            Get.toNamed(
              Routes.priceDetailsReviewScreen,
              arguments: {'page': page},
            );
          }),
        ],
      ),
    ],
  );
}
