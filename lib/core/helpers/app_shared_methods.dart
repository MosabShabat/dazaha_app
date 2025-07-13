// import 'dart:developer';
import 'package:dazaha_app/core/helpers/theme_exports.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
import 'package:get/get.dart';

// import 'app_regex.dart';

class AppSharedMethods extends GetxService {
  // تغيير اللغة
  void updateLanguage(Locale currentLocale) {
    final newLocale =
        currentLocale.languageCode == 'ar'
            ? const Locale('en')
            : const Locale('ar');
    EasyLocalization.of(Get.context!)?.setLocale(newLocale);
    Get.updateLocale(newLocale);
  }

  // فحص إذا الـ TextField فاضي
  static bool isTextFieldEmpty(TextEditingController controller) {
    return controller.text.isEmpty;
  }

  // تغيير لون شريط الحالة (Status Bar)
  // static Future<void> setStatusBarColor({
  //   required Color color,
  //   required Brightness iconBrightness,
  //   Brightness? statusBarBrightness,
  // }) async {
  //   try {
  //     await FlutterStatusbarcolor.setStatusBarColor(color);
  //     FlutterStatusbarcolor.setStatusBarWhiteForeground(
  //       iconBrightness == Brightness.light,
  //     );
  //   } catch (e) {
  //     log(e.toString());
  //   }

  //   SystemChrome.setSystemUIOverlayStyle(
  //     SystemUiOverlayStyle(
  //       statusBarColor: color,
  //       statusBarIconBrightness: iconBrightness,
  //       statusBarBrightness:
  //           statusBarBrightness ??
  //           (iconBrightness == Brightness.light
  //               ? Brightness.dark
  //               : Brightness.light),
  //     ),
  //   );
  // }

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



  // اختيار تاريخ (معلّقة مؤقتًا)
  /*
  static Future<void> pickDate({
    required BuildContext context,
    required RxString selectedDate,
  }) async {
    DateTime now = DateTime.now();

    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: now,
      firstDate: now,
      lastDate: DateTime(2101),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: buildPickerTheme(context),
          child: child!,
        );
      },
    );

    selectedDate.value =
        "${pickedDate.day}/${pickedDate.month}/${pickedDate.year}";
  }
  */

  // route المبدئي حسب حالة التطبيق
  /*
  static String getInitialRoute(bool isOpenBefore, bool isUserLogin) {
    if (!isOpenBefore) {
      return Routes.onboardingScreen;
    } else if (isOpenBefore && !isUserLogin) {
      return Routes.mainScreen;
    } else {
      AppSharedData.initializeUserInfo();
      return Routes.mainScreen;
    }
  }
  */

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
}
