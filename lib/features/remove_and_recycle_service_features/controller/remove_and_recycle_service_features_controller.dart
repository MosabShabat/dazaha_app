import 'dart:async';
import 'package:dazaha_app/core/constant/exports_libraries.dart';

class RemoveAndRecycleServiceFeaturesController extends GetxController {
  final PageController pageController = PageController();
  final RxInt currentPage = 0.obs;

  final int itemCount = 4;
  late Timer timer;

  @override
  void onInit() {
    super.onInit();

    // Start the auto-scroll timer
    timer = Timer.periodic(const Duration(milliseconds: 1500), (_) {
      int nextPage = currentPage.value + 1;
      if (nextPage >= itemCount) {
        nextPage = 0;
      }

      pageController.animateToPage(
        nextPage,
        duration: const Duration(milliseconds: 600),
        curve: Curves.fastOutSlowIn, // Smooth animation
      );
    });

    // Listen to manual page changes (sync indicator)
    pageController.addListener(() {
      int newPage = pageController.page?.round() ?? 0;
      if (currentPage.value != newPage) {
        currentPage.value = newPage;
      }
    });
  }

  @override
  void onClose() {
    pageController.dispose();
    timer.cancel();
    super.onClose();
  }
}
