import 'package:dazaha_app/core/helpers/extensions/extensions_translations.dart';
import 'package:dazaha_app/core/theming/themes.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'core/controllers/theme_controller.dart';
import 'core/di/dependency_injection.dart';
import 'core/routes/app_routes.dart';
import 'core/routes/routes.dart';

class DazahaApp extends StatelessWidget {
  final AppRouter appRouter;
  final List<NavigatorObserver> navigatorObservers;
  final ThemeController themeController = Get.find();

  DazahaApp({
    super.key,
    required this.appRouter,
    required this.navigatorObservers,
  });

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(393, 852),
      minTextAdapt: true,
      builder: (context, child) {
        return MediaQuery(
          data: MediaQuery.of(
            context,
          ).copyWith(textScaler: const TextScaler.linear(0.973)),
          child: Obx(
            () => GetMaterialApp(
              debugShowCheckedModeBanner: false,
              title: context.appName,
              theme: lightTheme,
              darkTheme: darkTheme,
              themeMode: themeController.isDark
                  ? ThemeMode.dark
                  : ThemeMode.light,

              initialBinding: AppBindings(),
              // initialRoute:
              //     AppSharedMethods.getInitialRoute(isOpenBefore, isUserLogin),
              // initialRoute: Routes.specialistProfileScreen,
              // initialRoute: Routes.onboarding,
              initialRoute: Routes.loginScreen,
              getPages: appRouter.routes,
              localizationsDelegates: context.localizationDelegates,
              supportedLocales: context.supportedLocales,
              locale: context.locale,
              navigatorObservers: navigatorObservers,
            ),
          ),
        );
      },
    );
  }
}
