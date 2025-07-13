import 'package:dazaha_app/core/constant/exports_libraries.dart';
import 'package:dazaha_app/core/constant/exports_widgets.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

Widget SmoothPageIndicatorWidget(BuildContext context, {required controller}) {
  return Center(
    child: SmoothPageIndicator(
      controller: controller.pageController,
      count: controller.images.length,
      effect: WormEffect(
        activeDotColor: context.colorsCustom.TealGreenSecondary,
        dotColor: context.colorsCustom.CardBorder,
        dotHeight: 7.w,
        dotWidth: 7.w,
      ),
    ),
  );
}
