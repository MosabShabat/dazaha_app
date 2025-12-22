import '../constant/exports_widgets.dart';
import 'package:geolocator/geolocator.dart';

import '../constant/exports_libraries.dart';
import '../theming/app_text_styles.dart';

Future<void> handleAdsTap(
  BuildContext context, {
  required isHomePage,
  Function()? onNavigate, // لتغيير ما يحدث عند التنقل
}) async {
  Future<bool> checkAndRequestLocation() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    LocationPermission permission = await Geolocator.checkPermission();

    if (!serviceEnabled || permission == LocationPermission.deniedForever) {
      return false;
    }

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied ||
          permission == LocationPermission.deniedForever) {
        return false;
      }
    }
    return true;
  }

  bool hasPermission = await checkAndRequestLocation();

  if (!hasPermission) {
    Get.dialog(
      AlertDialog(
        title: Text(
          context.locationPermissionTitle,
          style: AppTextStyles.font16Black500Medium(context),
        ),
        content: Text(
          context.backgroundLocationDisclosure,
          style: TextStyle(
            fontSize: 13.sp,
            height: 1.5,
            color: context.colorsCustom.TextSecondary,
            fontFamily: 'Tajawal',
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              isHomePage ? Get.offAllNamed(Routes.homeScreen) : Get.back();
            },
            child: Text(
              context.reject,
              style: AppTextStyles.font12Black500Medium(context),
            ),
          ),
          TextButton(
            onPressed: () async {
              await Geolocator.openAppSettings();
              Get.back();
            },
            child: Text(
              context.accept,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: context.colorsCustom.TealGreenSecondary,
              ),
            ),
          ),
        ],
      ),
      barrierDismissible: false,
    );
    return;
  }

  // ✅ إذن متاح → تنفيذ التنقل المخصص
  if (onNavigate != null) {
    onNavigate();
  }
  //
  //else {
  //   // القيمة الافتراضية إذا لم يتم تمرير دالة
  //   orderDataController.setItemUuid(serData.uuid ?? '');
  //   Get.toNamed(Routes.itemAdDetailsScreen, arguments: {'isShow': true});
  // }
}
