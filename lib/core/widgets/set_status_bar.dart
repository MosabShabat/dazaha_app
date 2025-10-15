import 'package:flutter/services.dart';

void setStatusBar({required Color color, Brightness iconBrightness = Brightness.dark}) {
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: color, // Android
      statusBarIconBrightness: iconBrightness, // Android
      statusBarBrightness: iconBrightness == Brightness.dark ? Brightness.light : Brightness.dark, // iOS
    ),
  );
}
