import 'package:dazaha_app/core/constant/exports_libraries.dart';
import 'package:dazaha_app/core/helpers/app_assets.dart';
import 'package:dazaha_app/features/price_details_review/controller/price_details_review_controller.dart';

Widget StarRatingWidget(BuildContext context) {
  final PriceDetailsReviewController controller = Get.put(
    PriceDetailsReviewController(),
  );
  return Obx(() {
    return Row(
      // mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(5, (index) {
        final starIndex = index + 1;
        final isFilled = starIndex <= controller.selectedRating.value;

        return GestureDetector(
          onTap: () {
            controller.selectedRating.value = starIndex;
          },
          child: isFilled
              ? SvgPicture.asset(
                  AppAssets.svgs.star_bold_icon,
                  width: 40.w,
                  height: 40.w,
                )
              : SvgPicture.asset(
                  AppAssets.svgs.star_icon,
                  width: 40.w,
                  height: 40.w,
                ),
          //  Icon(
          //   Icons.star,
          //   size: 40,
          //   color: isFilled ? Colors.orange : Colors.grey.shade400,
          // ),
        );
      }),
    );
  });
}
