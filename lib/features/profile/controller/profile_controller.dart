import 'dart:ui';

import 'package:dazaha_app/core/helpers/app_shared_methods.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  // true = Arabic, false = English
  RxBool radioValue = AppSharedMethods.isAppLanguageArabic().obs;

  void setLanguage(bool isArabic) {
    radioValue.value = isArabic;
    final newLocale = isArabic ? const Locale('ar') : const Locale('en');
    EasyLocalization.of(Get.context!)?.setLocale(newLocale);
    Get.updateLocale(newLocale);
  }
}
