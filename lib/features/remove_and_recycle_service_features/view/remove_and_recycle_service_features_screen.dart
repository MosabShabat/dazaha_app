import 'package:dazaha_app/core/constant/exports_libraries.dart';
import 'package:dazaha_app/core/constant/exports_widgets.dart';
import 'package:dazaha_app/features/choose_the_service/controller/choose_the_service_controller.dart';
import 'package:dazaha_app/features/remove_and_recycle_service_features/widgets/page_view_widget.dart';

class RemoveAndRecycleServiceFeaturesScreen extends StatelessWidget {
  const RemoveAndRecycleServiceFeaturesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ChooseTheServiceController controller = ChooseTheServiceController();

    return Scaffold(
      backgroundColor: context.colorsCustom.surfacePrimaryWhite,
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
        child: GeneralBottomAppWidget(
          context,
          text: context.createYourAd,
          onTap: () => controller.openCameraWithPermission(
            context,
            page: Routes.bookingDateScreen,
            arguments: {
              'page': Routes.adDetailsScreen,
              'pageArgs': {
                'page': Routes.advertisementSummaryScreen,
                'isSwitchShow': true,
              },
            },
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child: SvgPicture.asset(AppAssets.svgs.closeIcon),
                  ),
                ],
              ),
              PageViewWidget(context),
            ],
          ),
        ),
      ),
    );
  }
}
