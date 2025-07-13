import 'package:dazaha_app/core/constant/exports_libraries.dart';
import 'package:dazaha_app/core/constant/exports_widgets.dart';
import 'package:dazaha_app/core/widgets/custom_app_bar_widget.dart';
import 'package:dazaha_app/core/widgets/general_screen_widget.dart';
// import 'package:dazaha_app/features/ad_details/view/ad_details_screen.dart';
import 'package:dazaha_app/features/pick_up_method_upon_delivery/widgets/list_view_pick_up_method_up_on_delivery_widget.dart';
import 'package:dazaha_app/features/pick_up_method_upon_delivery/widgets/switch_widget.dart';
// import 'package:dazaha_app/features/pick_up_point/view/pick_up_point_screen.dart';
import 'package:dazaha_app/features/pick_up_point/widgets/top_text_widget.dart';

class PickUpMethodUpOnDeliveryScreen extends StatelessWidget {
  PickUpMethodUpOnDeliveryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colorsCustom.surfacePrimaryWhite,
      appBar: CustomAppBarWidget(
        context,
        indexColor1: 0,
        indexColor2: 1,
        indexColor3: 2,
        indexColor4: 0,
        indexColor5: 0,
      ),
      bottomNavigationBar:
          GeneralBottomAppWidget(
                context,
                text: context.continuation,
                onTap: () {
                  // Get.to(
                  //   () => pickUpPointScreen(
                  //     page: () {
                  //       // Get.toNamed(Routes.adDetailsScreen);
                  //       Get.to(
                  //         () => AdDetailsScreen(isSwitchShow: true,page: (){
                  //           Get.toNamed(Routes.advertisementSummaryScreen);
                  //         },),
                  //         transition: Transition.rightToLeft,
                  //       );
                  //     },
                  //     isAppBar: false,
                  //   ),
                  //   transition: Transition.rightToLeft,
                  // );
                  Get.toNamed(
                    Routes.pickUpPointScreen,
                    arguments: {
                      'page':
                          Routes.adDetailsScreen, // ✅ Only pass the route name
                      'pageArgs': {
                        'page': Routes.advertisementSummaryScreen,
                        'isSwitchShow': true,
                      },
                      'isAppBar': false,
                    },
                  );
                },
              ).box
              .padding(
                EdgeInsetsGeometry.symmetric(horizontal: 16.w, vertical: 20.h),
              )
              .make(),
      body: GeneralScreenWidget(
        context,
        wid: [
          TopTextWidget(
            context,
            Title: context.receiptMethod,
            SubTitle: context.location,
          ),
          verticalSpace(10.h),
          ListViewPickUpMethodUpOnDeliveryWidget(context: context),
          verticalSpace(20.h),
          SwitchWidget(context),
        ],
      ),
    );
  }
}
