import 'package:dazaha_app/core/constant/exports_libraries.dart';
import 'package:dazaha_app/core/constant/exports_widgets.dart';
import 'package:dazaha_app/features/home/view/home_screen.dart';
import 'package:dazaha_app/features/review_details/widgets/info_column_widget.dart';
import 'package:lottie/lottie.dart';

class CaptainMembershipRequestScreen extends StatelessWidget {
  const CaptainMembershipRequestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colorsCustom.surfacePrimaryWhite,
      body: SafeArea(
        child:
            Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Lottie.asset(
                      AppAssets.json.delivery_track_order_json,
                      width: 165.w,
                      height: 165.w,
                    ),
                    InfoColumnWidget(
                      context,
                      isShow: false,
                      title: context.youHaveSuccessfullyApplied,
                      subTitle: context.yourInformationWillBeReviewed,
                    ),
                    GeneralBottomAppWidget(
                      context,
                      text: context.home,
                      onTap: () {
                        Get.to(
                          HomeScreen(initialTabIndex: 0),
                          transition: Transition.noTransition,
                        ); //
                      },
                    ),
                    verticalSpace(Height / 3.5),
                  ],
                ).box
                .width(Width.w)
                .height(Height.h)
                .color(context.colorsCustom.surfacePrimaryWhite)
                .padding(EdgeInsetsGeometry.symmetric(horizontal: 16.w))
                .make(),
      ),
    );
  }
}
