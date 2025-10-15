import '../../../core/constant/exports_libraries.dart';
import '../../../core/constant/exports_widgets.dart';
import '../../../core/widgets/general_screen_widget.dart';
import '../../../features/review_details/widgets/info_column_widget.dart';
import 'package:lottie/lottie.dart';

class ReviewPayMentScreen extends StatelessWidget {
  const ReviewPayMentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colorsCustom.surfacePrimaryWhite,
      body: SafeArea(
        child: GeneralScreenWidget(
          context,
          wid: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Lottie.asset(AppAssets.json.done_json),
                InfoColumnWidget(
                  context,
                  isShow: false,
                  title: context.paymentCompletedSuccessfully,
                  subTitle: context.trackYourOrderStatusAndSee,
                ),
                GeneralBottomAppWidget(
                  context,
                  text: context.orderTracking,
                  onTap: () {
                    Get.toNamed(
                      Routes.myAdsDetailsScreen,
                      arguments: {'isShow': true},
                    );
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
                  Get.offAllNamed(Routes.homeScreen); //
                }),
                verticalSpace(Height / 12),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
