import 'package:dio/dio.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../core/di/dependency_injection.dart';
import '../../../core/helpers/app_shared_data.dart';
import '../../../core/helpers/app_shared_methods.dart';
import '../../../core/helpers/constants.dart';
import '../../../core/network/utils/dio_factory.dart';
import '../../../dazaha_app.dart';
import '../../../firebase_options.dart';
import 'core/controllers/theme_controller.dart';
import 'core/helpers/app_observer.dart';
import 'core/network/utils/api_service.dart';
import 'core/routes/app_routes.dart';
import 'core/services/notification_service.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // إعداد SharedPreferences و SecureStorage
  await initializeAppPreferences();

  // استرجاع التوكن من النسخة الاحتياطية إذا اختفى
  String token = await AppSharedData.getSecuredString(AppSharedKeys.userToken);
  if (token.isEmpty) {
    final prefs = await SharedPreferences.getInstance();
    token = prefs.getString(AppSharedKeys.userTokenBackup) ?? '';
    if (token.isNotEmpty) {
      await AppSharedData.setSecuredString(AppSharedKeys.userToken, token);
      await DioFactory.addDioHeaders();
    }
  }

  // استرجاع اللغة
  final savedLang = await AppSharedData.getSecuredString(
    AppSharedKeys.appLanguage,
  );
  final startLocale = savedLang == 'en'
      ? const Locale('en')
      : const Locale('ar');

  // تحديث لغة API
  DioFactory.updateLanguageHeader(startLocale.languageCode);

  // تحديد صفحة البداية
  final bool isUserLogged = await AppSharedData.isUserLogin();
  final bool isOpenedBefore = await AppSharedData.isOpenBefore();
  final String initialRoute = AppSharedMethods.getInitialRoute(
    isOpenedBefore,
    isUserLogged,
  );

  // Firebase
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  // EasyLocalization
  await EasyLocalization.ensureInitialized();

  // GetX setup
  await setupGetX();
  await AppSharedData.setOpenBefore(true);

  // Notification Service
  await NotificationService().init();

  // Lock orientation
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  // ScreenUtil
  await ScreenUtil.ensureScreenSize();

  // Controllers
  Get.put(ThemeController());
  await Get.putAsync<ApiService>(() async {
    Dio dio = await DioFactory.getDio();
    return ApiService(dio);
  });

  print('languageCode is : ${Get.locale?.languageCode}');

  // Run app
  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('en'), Locale('ar')],
      fallbackLocale: const Locale('ar'),
      startLocale: startLocale,
      path: 'assets/translations',
      child: Phoenix(
        child: DazahaApp(
          appRouter: AppRouter(),
          navigatorObservers: [AppObserver()],
          initialRoute: initialRoute,
        ),
      ),
    ),
  );
}
