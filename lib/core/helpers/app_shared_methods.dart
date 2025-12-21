import '../../core/constant/exports_widgets.dart';
import '../../core/constant/exports_libraries.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:image_picker/image_picker.dart';
import '../network/utils/dio_factory.dart';
import '../theming/app_text_styles.dart';
import '../widgets/app_drag_indicator_bottom_sheet.dart';
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

  static Future<void> showLocationGrantedDialog({
    required BuildContext context,
  }) async {
    await showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) {
        return AlertDialog(
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
              onPressed: () => Navigator.of(context).pop(),
              child: Text(context.ok),
            ),
          ],
        );
      },
    );
  }

  static Future<bool> showAppLocationDialog({
    required BuildContext context,
  }) async {
    return await showDialog<bool>(
          context: context,
          barrierDismissible: false,
          builder: (_) => AlertDialog(
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
                onPressed: () => Navigator.pop(context, false),
                child: Text(context.reject),
              ),
              TextButton(
                onPressed: () => Navigator.pop(context, true),
                child: Text(context.ok),
              ),
            ],
          ),
        ) ??
        false;
  }

  static Widget buildProgressViewWhite(
    BuildContext context,
    bool isWhite, {
    double width = 20.0,
    double height = 20.0,
  }) {
    return ProgressViewWhite(context, isWhite, width: width, height: height);
  }

  String normalizeDate(String date) {
    if (date.isEmpty) return date;

    const arabicNumbers = ['٠', '١', '٢', '٣', '٤', '٥', '٦', '٧', '٨', '٩'];
    bool hasArabicDigits = date.contains(RegExp(r'[٠-٩]'));

    if (hasArabicDigits) {
      for (int i = 0; i < arabicNumbers.length; i++) {
        date = date.replaceAll(arabicNumbers[i], i.toString());
      }
    }

    // تحويل التاريخ إلى شكل YYYY-MM-DD فقط
    try {
      final parsedDate = DateTime.parse(date);
      return '${parsedDate.year.toString().padLeft(4, '0')}-'
          '${parsedDate.month.toString().padLeft(2, '0')}-'
          '${parsedDate.day.toString().padLeft(2, '0')}';
    } catch (e) {
      return date; // إذا لم يكن التاريخ صالحاً، ارجعه كما هو
    }
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
      textTheme: ThemeData.light().textTheme.apply(fontFamily: 'Tajawal'),
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
    required isCamera,
  }) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      builder: (BuildContext context) {
        return SafeArea(
          child: Column(
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
              isCamera
                  ? SizedBox.shrink()
                  : ListTile(
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
          ),
        );
      },
    );
  }

  static void showLocationServicesDialog({
    required BuildContext context,
    required VoidCallback onConfirm,
  }) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => AlertDialog(
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
            onPressed: () => Navigator.of(context).pop(),
            child: Text(
              context.reject,
              style: AppTextStyles.font12Black500Medium(context),
            ),
          ),
          TextButton(
            onPressed: onConfirm,
            child: Text(
              context.accept,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: context.colorsCustom.TealGreenSecondary,
              ),
            ),
          ),
          // ElevatedButton(
          //   onPressed: () => Navigator.pop(context, true),
          //   child: Text(context.accept),
          // ),
        ],
      ),
    );
    // Get.defaultDialog(
    //   titlePadding: EdgeInsets.only(top: 16.h),
    //   backgroundColor: context.colorsCustom.surfacePrimaryWhite,
    //   title: context.locationPermissionTitle,
    //   titleStyle: AppTextStyles.font16Black500Medium(context),
    //   content: WillPopScope(
    //     onWillPop: () async => false,
    //     child: Text(
    //       context.backgroundLocationDisclosure,
    //       style: TextStyle(
    //         fontSize: 12.sp,
    //         fontWeight: FontWeight.w300,
    //         color: context.colorsCustom.TextSecondary,
    //         fontFamily: 'Tajawal',
    //       ),
    //     ),
    //   ),
    //   confirm: AppTextButton(
    //     context,
    //     buttonWidth: 100.w,
    //     buttonHeight: 46.h,
    //     backgroundColor: context.colorsCustom.surfacePrimaryWhite,
    //     textStyle: TextStyle(
    //       fontSize: 12.sp,
    //       fontWeight: FontWeight.w300,
    //       color: context.colorsCustom.TextSecondary,
    //       fontFamily: 'Tajawal',
    //     ),
    //     buttonText: context.enable,
    //     onPressed: onConfirm,
    //   ),
    //   cancel: AppTextButton(
    //     context,
    //     buttonWidth: 100.w,
    //     buttonHeight: 46.h,
    //     backgroundColor: context.colorsCustom.surfacePrimaryWhite,
    //     textStyle: TextStyle(
    //       fontSize: 12.sp,
    //       fontWeight: FontWeight.w300,
    //       color: context.colorsCustom.TextSecondary,
    //       fontFamily: 'Tajawal',
    //     ),
    //     buttonText: context.delete,
    //     onPressed: () {
    //       Navigator.of(context).pop();
    //     },
    //   ),
    //   barrierDismissible: false,
    // );
  }
}
