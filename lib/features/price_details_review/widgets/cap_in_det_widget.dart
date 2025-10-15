import 'package:cached_network_image/cached_network_image.dart';

import '../../../../core/constant/exports_libraries.dart';
import '../../../../core/constant/exports_widgets.dart';
import '../../../core/helpers/constants.dart';

Widget CapInDetWidget(BuildContext context) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      CircleAvatar(
        radius: 55.w,
        backgroundImage: CachedNetworkImageProvider(AppConstants.userImage),
      ),
      verticalSpace(10.h),
      Text(
        '${AppConstants.userName}',
        style: context.textStyles.bodyLarge.bold.copyWith(
          color: context.colorsCustom.TextPrimary,
          fontSize: 18.sp,
        ),
      ),
      verticalSpace(10.h),
      Text(
        '${AppConstants.orderTitle}',
        style: context.textStyles.bodySmall.medium.copyWith(
          color: context.colorsCustom.TextSecondary,
        ),
      ),
      verticalSpace(10.h),
      Text(
        '${AppConstants.orderId}',
        style: context.textStyles.bodySmall.regular.copyWith(
          color: context.colorsCustom.TextSecondary,
        ),
      ),
    ],
  );
}
