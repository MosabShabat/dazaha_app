import 'package:dazaha_app/dazaha_app.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'core/controllers/theme_controller.dart';
import 'core/helpers/app_observer.dart';
import 'core/routes/app_routes.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // await Firebase.initializeApp();

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  await EasyLocalization.ensureInitialized();
  await ScreenUtil.ensureScreenSize();
  // SystemChrome.setSystemUIOverlayStyle(
  //   SystemUiOverlayStyle(
  //     statusBarColor: Colors.white, // or any Color
  //     statusBarIconBrightness: Brightness.light, // light = white icons
  //     statusBarBrightness: Brightness.dark, // For iOS: dark background
  //   ),
  // );

  // await Future.wait([checkUserLogin(), checkOpenBefore()]);

  Get.put(ThemeController());

  // await Get.putAsync<ApiService>(() async {
  //   Dio dio = await DioFactory.getDio();
  //   return ApiService(dio);
  // });

  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('en'), Locale('ar')],
      fallbackLocale: const Locale('ar'),
      startLocale: const Locale('ar'),
      path: 'assets/translations',
      child: Phoenix(
        child: DazahaApp(
          appRouter: AppRouter(),
          navigatorObservers: [AppObserver()],
        ),
      ),
    ),
  );
}

// Future<void> checkOpenBefore() async {
//   isOpenBefore = await AppSharedData.isOpenBefore();
// }

// Future<void> checkUserLogin() async {
//   isUserLogin = await AppSharedData.isUserLogin();
// }
