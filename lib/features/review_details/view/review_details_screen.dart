import 'package:dazaha_app/core/constant/exports_libraries.dart';
import 'package:dazaha_app/core/constant/exports_widgets.dart';
import 'package:dazaha_app/core/widgets/general_screen_widget.dart';
import 'package:dazaha_app/features/review_details/widgets/info_column_widget.dart';
import 'package:dazaha_app/features/home/view/home_screen.dart';
import 'package:lottie/lottie.dart';

class ReviewDetailsScreen extends StatefulWidget {
  const ReviewDetailsScreen({super.key});

  @override
  State<ReviewDetailsScreen> createState() => _ReviewDetailsScreenState();
}

class _ReviewDetailsScreenState extends State<ReviewDetailsScreen> {
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
                SizedBox(height: Height / 8),
                Lottie.asset(
                  AppAssets.json.process_json,
                  width: 165.w,
                  height: 165.w,
                ),
                InfoColumnWidget(
                  context,
                  isShow: true,
                  title: context.weWillPublishYourAdAfterReviewingTheDetails,
                  subTitle: context.youWillReceiveANotificationWithEveryUpdate,
                ),
                GeneralBottomAppWidget(
                  context,
                  text: context.myAds,
                  onTap: () {
                    Get.offAll(
                      () => HomeScreen(initialTabIndex: 1),
                      transition: Transition.noTransition,
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
                  Get.offAll(
                    () => HomeScreen(initialTabIndex: 0),
                    transition: Transition.noTransition,
                  );
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
