import 'package:cached_network_image/cached_network_image.dart';
import '../../../core/constant/exports_libraries.dart';
import '../../../core/constant/exports_widgets.dart';
import 'rating_circle.dart';

Widget AdvertiserRowWidget(
  BuildContext context, {
  required image,
  required name,
  required orderCount,
  required rating,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        context.advertiser,
        textAlign: TextAlign.start,
        style: context.textStyles.bodyLarge.medium.copyWith(
          color: context.colorsCustom.TextPrimary,
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
                backgroundImage: CachedNetworkImageProvider(image),
                radius: 30.w,
              ),
              horizontalSpace(10.w),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${name}',
                    textAlign: TextAlign.start,
                    style: context.textStyles.bodyMedium.medium.copyWith(
                      color: context.colorsCustom.TextPrimary,
                    ),
                  ),
                  verticalSpace(10.h),
                  Text(
                    '${orderCount} ${context.ads} | %${rating} ${context.positiveEvaluation}',
                    style: context.textStyles.bodySmall.regular.copyWith(
                      color: context.colorsCustom.TextSecondary,
                    ),
                  ),
                ],
              ),
            ],
          ),
          RatingCircle(rating: rating),
      
        ],
      ),
      verticalSpace(20.h),
    ],
  );
}
