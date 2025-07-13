import 'package:dazaha_app/core/constant/exports_libraries.dart';
import 'package:dazaha_app/core/constant/exports_widgets.dart';
import 'package:dazaha_app/features/home/view/home_screen.dart';
import 'package:dazaha_app/features/price_details_review/widgets/cap_in_det_widget.dart';
import 'package:dazaha_app/features/price_details_review/widgets/star_rating_widget%20.dart';
import 'package:dazaha_app/features/price_details_review/widgets/top_enm_widget.dart';

class PriceDetailsReviewScreen extends StatelessWidget {
  const PriceDetailsReviewScreen({super.key});

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
                  'شلون كانت تجربتك ويا عباس الجبوري؟',
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
                GeneralBottomAppWidget(
                  context,
                  text: context.submitEvaluation,
                  onTap: () {
                    // Get.toNamed(Routes.priceCatDetailsScreen);
                    // Get.offAll(
                    //   () => HomeScreen(initialTabIndex: 1),
                    //   transition: Transition.downToUp,
                    // );
                  },
                ),
                verticalSpace(40.h),
                Text(
                  context.home,
                  textAlign: TextAlign.center,
                  maxLines: 1,
                  style: context.textStyles.bodyLarge.medium.copyWith(
                    color: context.colorsCustom.TextPrimary,
                  ),
                ).onTap(() {
                  Get.offAll(
                    () => HomeScreen(initialTabIndex: 0),
                    transition: Transition.fadeIn,
                  );
                }),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
