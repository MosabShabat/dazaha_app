
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../../core/constant/exports_libraries.dart';
import '../../../core/constant/exports_widgets.dart';

Widget SmoothPageIndicatorWidget(BuildContext context, {required controller,required len}) {
  return Center(
    child: SmoothPageIndicator(
      controller: controller.pageController,
      count: len,
      effect: WormEffect(
        activeDotColor: context.colorsCustom.TealGreenSecondary,
        dotColor: context.colorsCustom.CardBorder,
        dotHeight: 7.w,
        dotWidth: 7.w,
      ),
    ),
  );
}
