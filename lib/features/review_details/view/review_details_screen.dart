import 'package:lottie/lottie.dart';
import '../../../core/constant/exports_libraries.dart';
import '../../../core/constant/exports_widgets.dart';
import '../../../core/widgets/general_screen_widget.dart';
import '../../advertisement_summary/controller/advertisement_summary_controller.dart';
import '../../choose_the_service/controller/order_data_controller.dart';
import '../../home/controller/home_controller.dart';
import '../widgets/info_column_widget.dart';

class ReviewDetailsScreen extends StatelessWidget {
  ReviewDetailsScreen({super.key});
  final AdvertisementSummaryController _controller = Get.find();
  final HomeController homeController = Get.find();
  final OrderDataController orderDataController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colorsCustom.surfacePrimaryWhite,
      body: SafeArea(
        child: Obx(() {
          final data = _controller.orderUuidModel.value;
          if (data != null) {
            print(data.uuid);
          }
          if (data == null) {
            return Center(child: Text('لا توجد بيانات'));
          }
          return GeneralScreenWidget(
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
                    subTitle:
                        context.youWillReceiveANotificationWithEveryUpdate,
                    orderDataController: data,
                  ),
                  GeneralBottomAppWidget(
                    context,
                    text: context.myAds,
                    onTap: () {
                      orderDataController.clearAll();
                      Get.offAllNamed(
                        Routes.homeScreen,
                        arguments: {'selectedIndex': 1},
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
                    orderDataController.clearAll();
                    Get.offAllNamed(Routes.homeScreen); //
                  }),
                  verticalSpace(Height / 12),
                ],
              ),
            ],
          );
        }),
      ),
    );
  }
}
