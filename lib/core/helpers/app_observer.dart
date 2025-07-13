import 'dart:developer';

import 'package:flutter/material.dart';

class AppObserver extends NavigatorObserver {
  @override
  void didPop(Route route, Route? previousRoute) {
    super.didPop(route, previousRoute);
    log('didPop: ${previousRoute?.settings.name}, ${route.settings.name}');

    // if (previousRoute?.settings.name == Routes.mainScreen) {
    //   log('didPop: test');
    //   Get.find<NavigationController>().updateStatusBarColor();
    // }
  }
}
