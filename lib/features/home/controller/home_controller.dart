import '../../../core/constant/exports_libraries.dart';
import '../../../core/constant/exports_widgets.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import '../../../core/widgets/set_status_bar.dart';

class HomeController extends GetxController {
  RxInt selectedIndex;
  RxBool isOffline = false.obs;
  RxBool isLoading = false.obs; // ← للتحكم في عرض Progress
  RxInt extraTabIndex = 0.obs;

  final navigators = List.generate(5, (_) => GlobalKey<NavigatorState>());

  Connectivity _connectivity = Connectivity();
  int lastIndexBeforeChooseService = 0;
  HomeController({required int initialTabIndex})
    : selectedIndex = initialTabIndex.obs {
    updateStatusBar(initialTabIndex);
    _init();
  }

  void _init() {
    // استماع لتغير نوع الشبكة
    _connectivity.onConnectivityChanged.listen((_) async {
      await _updateConnectionStatus();
    });

    // فحص أولي
    _updateConnectionStatus();
  }

  Future<void> _updateConnectionStatus() async {
    isLoading.value = true;

    final online = await InternetConnectionChecker().hasConnection;
    isOffline.value = !online;

    await Future.delayed(const Duration(milliseconds: 300));
    isLoading.value = false;
  }

  Future<void> checkInternetStatus() async {
    await _updateConnectionStatus();
  }

  void onTabChanged(int index) {
    if (index != 2) {
      lastIndexBeforeChooseService = index;
    }

    selectedIndex.value = index;
    updateStatusBar(index);
  }

  void showToast(BuildContext context, String msg, Color bgColor) {
    context.showToast(
      msg: msg,
      bgColor: bgColor,
      textColor: context.colorsCustom.surfacePrimaryWhite,
    );
  }

  // دالة لاسترجاع الصفحة الأخيرة قبل chooseTheServiceScreen
  void backFromChooseService() {
    selectedIndex.value = lastIndexBeforeChooseService;
    updateStatusBar(lastIndexBeforeChooseService);
  }

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
}
