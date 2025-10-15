import '../../../core/helpers/extensions/extensions_translations.dart';
import '../../../core/theming/themes.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'core/controllers/theme_controller.dart';
import 'core/di/app_bindings.dart';
import 'core/routes/app_routes.dart';

class DazahaApp extends StatelessWidget {
  final AppRouter appRouter;
  final List<NavigatorObserver> navigatorObservers;
  final String initialRoute; // ✅ تم إضافة هذا

  final ThemeController themeController = Get.find();

  DazahaApp({
    super.key,
    required this.appRouter,
    required this.navigatorObservers,
    required this.initialRoute, // ✅ نمرره هنا
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

              // ✅ استخدم القيمة الممررة من main()
              initialRoute: initialRoute,

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
