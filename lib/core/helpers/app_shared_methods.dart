import '../../core/constant/exports_widgets.dart';
import '../../core/constant/exports_libraries.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:image_picker/image_picker.dart';
import '../network/utils/dio_factory.dart';
import '../theming/app_text_styles.dart';
import '../widgets/app_drag_indicator_bottom_sheet.dart';
import '../widgets/app_text_button.dart';
import '../widgets/progress_view_white.dart';

class AppSharedMethods extends GetxService {
  // تغيير اللغة

  void updateLanguage(Locale currentLocale) {
    final newLocale = currentLocale.languageCode == 'ar'
        ? const Locale('en')
        : const Locale('ar');

    // غيّر لغة الواجهة
    EasyLocalization.of(Get.context!)?.setLocale(newLocale);
    Get.updateLocale(newLocale);

    // غيّر لغة الـ API
    DioFactory.updateLanguageHeader(newLocale.languageCode);
  }

  static String getInitialRoute(bool isOpenBefore, bool isUserLogin) {
    return Routes.homeScreen;
    // if (!isOpenBefore) {
    //   // أول مرة يفتح التطبيق
    //   return Routes.loginScreen;
    // } else if (!isUserLogin) {
    //   // فتح التطبيق قبل كذا، لكن ما سجل دخول
    //   return Routes.loginScreen;
    // } else {
    //   // مستخدم قديم ومسجل دخول
    //   return Routes.homeScreen;
    // }
  }

  // فحص إذا الـ TextField فاضي
  static bool isTextFieldEmpty(TextEditingController controller) {
    return controller.text.isEmpty;
  }

  static Widget buildProgressViewWhite(
    BuildContext context,
    bool isWhite, {
    double width = 35.0,
    double height = 35.0,
  }) {
    return ProgressViewWhite(context, isWhite, width: width, height: height);
  }

  // اختيار وقت
  static Future<void> pickTime({
    required BuildContext context,
    required RxString selectedTime,
  }) async {
    final TimeOfDay now = TimeOfDay.now();

    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: now,
      builder: (BuildContext context, Widget? child) {
        return Theme(data: buildPickerTheme(context), child: child!);
      },
    );

    if (pickedTime != null) {
      selectedTime.value = pickedTime.format(context);
    }
  }

  // الثيم المستخدم في الـ Picker
  static ThemeData buildPickerTheme(BuildContext context) {
    return ThemeData.light().copyWith(
      colorScheme: ColorScheme.light(
        primary: context.colorsCustom.TealGreenSecondary,
        secondary: context.colorsCustom.TealGreenSecondary,
        surface: context.colorsCustom.TealGreenSecondary,
      ),
      textTheme: ThemeData.light().textTheme.apply(fontFamily: 'sans'),
      // dialogTheme: const DialogTheme(backgroundColor: Colors.white),
    );
  }

  // هل اللغة الحالية عربية؟
  static bool isAppLanguageArabic() {
    return Get.locale?.languageCode == 'ar';
  }

  static void showImageSourceOptions({
    required BuildContext context,
    required Function(ImageSource source) onImageSelected,
  }) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      builder: (BuildContext context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            verticalSpace(15),
            AppBuildDragIndicatorBottomSheet(context),
            ListTile(
              leading: Icon(
                Icons.camera,
                color: context.colorsCustom.surfacePrimaryBlack,
              ),
              title: Text(
                context.camera,
                style: AppTextStyles.font12Black500Medium(context),
              ),
              onTap: () {
                onImageSelected(ImageSource.camera);
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(
                Icons.photo_library,
                color: context.colorsCustom.surfacePrimaryBlack,
              ),
              title: Text(
                context.photoGallery,
                style: AppTextStyles.font12Black500Medium(context),
              ),
              onTap: () {
                onImageSelected(ImageSource.gallery);
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }

  static void showLocationServicesDialog({
    required BuildContext context,
    required VoidCallback onConfirm,
  }) {
    Get.defaultDialog(
      titlePadding: EdgeInsets.only(top: 16.h),
      backgroundColor: context.colorsCustom.surfacePrimaryWhite,
      title: context.locationDisabled,
      titleStyle: AppTextStyles.font16Black500Medium(context),
      content: WillPopScope(
        onWillPop: () async => false,
        child: Text(
          context.enableLocation,
          style: TextStyle(
            fontSize: 12.sp,
            fontWeight: FontWeight.w300,
            color: context.colorsCustom.TextSecondary,
            fontFamily: 'sans',
          ),
        ),
      ),
      confirm: AppTextButton(
        context,
        buttonWidth: 100.w,
        buttonHeight: 46.h,
        backgroundColor: context.colorsCustom.surfacePrimaryWhite,
        textStyle: TextStyle(
          fontSize: 12.sp,
          fontWeight: FontWeight.w300,
          color: context.colorsCustom.TextSecondary,
          fontFamily: 'sans',
        ),
        buttonText: context.enable,
        onPressed: onConfirm,
      ),
      barrierDismissible: false,
    );
  }
}
