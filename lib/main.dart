import 'package:dio/dio.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:easy_localization/easy_localization.dart';

import '../../../core/di/dependency_injection.dart';
import '../../../core/helpers/app_shared_data.dart';
import '../../../core/helpers/app_shared_methods.dart';
import '../../../core/helpers/constants.dart';
import '../../../core/network/utils/api_service.dart';
import '../../../core/network/utils/dio_factory.dart';
import '../../../dazaha_app.dart';
import '../../../firebase_options.dart';
import 'core/controllers/theme_controller.dart';
import 'core/helpers/app_observer.dart';
import 'core/routes/app_routes.dart';
import 'core/services/notification_service.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Shared preferences
  await initializeAppPreferences();

  try {
    await dotenv.load(fileName: "assets/.env");
    print('REVERB_HOST = ${dotenv.env['REVERB_HOST']}');
    print('✅ Loaded .env file successfully');
  } catch (e) {
    print('⚠️ .env file not found! Make sure it exists in the project root.');
  }
  // await dotenv.load(fileName: 'assets/.env');
  // print('REVERB_HOST = ${dotenv.env['REVERB_HOST']}');

  // // ✅ فحص وجود ملف .env
  // final envFile = File('assets/.env');
  // if (await envFile.exists()) {
  //   await dotenv.load(fileName: "assets/.env");
  //   print('✅ Loaded .env file successfully');
  // } else {
  //   print('⚠️ .env file not found! Make sure it exists in the project root.');
  // }
  // Determine initial route
  final bool isUserLogged = await AppSharedData.isUserLogin();
  final bool isOpenedBefore = await AppSharedData.isOpenBefore();
  final String initialRoute = AppSharedMethods.getInitialRoute(
    isOpenedBefore,
    isUserLogged,
  );

  // Initialize Firebase
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  // Localization
  await EasyLocalization.ensureInitialized();

  // GetX setup
  await setupGetX();
  await AppSharedData.setOpenBefore(true);
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
  // Run App
  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('en'), Locale('ar')],
      fallbackLocale: const Locale('ar'),
      startLocale:
          Get.locale?.languageCode == 'ar' || Get.locale?.languageCode == null
          ? Locale('ar')
          : Locale('en'),
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
