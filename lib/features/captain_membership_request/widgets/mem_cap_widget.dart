import '../../../core/constant/exports_widgets.dart';
import 'package:lottie/lottie.dart';
import '../../../core/constant/exports_libraries.dart';
import '../../review_details/widgets/info_column_widget.dart';

Widget MemCapWidget(BuildContext context) {
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
                      Get.offAllNamed(Routes.homeScreen); //
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
