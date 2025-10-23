import '../../../../core/constant/exports_widgets.dart';

import '../../../../core/constant/exports_libraries.dart';

import '../../../../core/widgets/set_status_bar.dart';

class HomeController extends GetxController {
  RxInt selectedIndex;
  int lastIndexBeforeChooseService =
      0; // لتخزين آخر صفحة قبل دخول chooseTheServiceScreen

  HomeController({required int initialTabIndex})
    : selectedIndex = initialTabIndex.obs {
    updateStatusBar(initialTabIndex);
  }
  void showToast(BuildContext context, String msg, Color bgColor) {
    context.showToast(
      msg: msg,
      bgColor: bgColor,
      textColor: context.colorsCustom.surfacePrimaryWhite,
    );
  }

  void onTabChanged(int index) {
    if (index != 2) {
      lastIndexBeforeChooseService = index;
    }

    selectedIndex.value = index;
    updateStatusBar(index);
  }

  // showSnackbarWithButton(
  //   Get.context!,
  //   Get.context!.successOrder,
  //   AppConstants.success,
  //   showButton: false,
  // );
  void updateStatusBar(int index) {
    switch (index) {
      case 0:
      case 1:
      case 2:
      case 3:
      case 4:
        setStatusBar(color: Colors.white, iconBrightness: Brightness.dark);
        break;
    }
  }

  // دالة لاسترجاع الصفحة الأخيرة قبل chooseTheServiceScreen
  void backFromChooseService() {
    selectedIndex.value = lastIndexBeforeChooseService;
    updateStatusBar(lastIndexBeforeChooseService);
  }
}
