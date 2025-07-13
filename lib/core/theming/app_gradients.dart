import 'package:flutter/material.dart';

class AppGradients {
  static const LinearGradient lightBackground = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Color(0xFFF5F9FF), // لون الخلفية الفاتحة من فوق
      Color(0xFFFFFFFF), // لون أبيض أو أقرب لأسفل
    ],
  );

  static const LinearGradient darkBackground = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Color(0xFF000B2E), // من التصميم (Surface-Gradient-03)
      Color(0xFF000821), // Surface-Gradient-02
      Color(0xFF00040F), // Surface-Gradient-01
    ],
  );
}