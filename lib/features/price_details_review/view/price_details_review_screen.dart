import '../../../core/helpers/constants.dart';

import '../../../../core/constant/exports_libraries.dart';
import '../../../../core/constant/exports_widgets.dart';
import '../../../../features/price_details_review/widgets/cap_in_det_widget.dart';
import '../../../../features/price_details_review/widgets/star_rating_widget%20.dart';
import '../../../../features/price_details_review/widgets/top_enm_widget.dart';
import '../../../core/widgets/app_loading_button.dart';
import '../controller/price_details_review_controller.dart';

class PriceDetailsReviewScreen extends StatelessWidget {
  PriceDetailsReviewScreen({super.key});
  final PriceDetailsReviewController _priceDetailsReviewController = Get.find();

  @override
  Widget build(BuildContext context) {
    //     final PickUpMethodUponDeliveryController controller = Get.put(
    //   PickUpMethodUponDeliveryController(),
    // );
    return Scaffold(
      backgroundColor: context.colorsCustom.surfacePrimaryWhite,
      body: Stack(
        children: [
          TopEnmWidget(context),
          Container(
            width: Width.w,
            height: Height.h,
            padding: EdgeInsetsDirectional.symmetric(horizontal: 16.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CapInDetWidget(context),
                verticalSpace(20.h),
                Text(
                  '${context.howWasYourExperienceWith} ${AppConstants.userName} ؟',
                  style: context.textStyles.bodyLarge.medium.copyWith(
                    color: context.colorsCustom.TextPrimary,
                    fontSize: 18.sp,
                  ),
                ),
                verticalSpace(20.h),
                Text(
                  context.rateYourExperience,
                  style: context.textStyles.bodySmall.regular.copyWith(
                    color: context.colorsCustom.TextPrimary,
                  ),
                ),
                verticalSpace(40.h),
                StarRatingWidget(context),
                verticalSpace(40.h),
                _sendRating(context, _priceDetailsReviewController),
                // GeneralBottomAppWidget(
                //   context,
                //   text: context.submitEvaluation,
                //   onTap: page,
                // ),
                verticalSpace(40.h),
                Text(
                  context.home,
                  textAlign: TextAlign.center,
                  maxLines: 1,
                  style: context.textStyles.bodyLarge.medium.copyWith(
                    color: context.colorsCustom.TextPrimary,
                  ),
                ).onTap(() {
                  Get.offAllNamed(Routes.homeScreen); //
                }),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _sendRating(
    BuildContext context,
    PriceDetailsReviewController controller,
  ) {
    return Obx(
      () => AppLoadingButton(
        text: context.submitEvaluation,
        onPressed: () async {
          controller.postRating(context);
        },
        isLoading: controller.isButtonPressed.value,
        isEnabled: !controller.isButtonPressed.value,

        isWhiteProgress: true,
      ),
    );
  }
}
