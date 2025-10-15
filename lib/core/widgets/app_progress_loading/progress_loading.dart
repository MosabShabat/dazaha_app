import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'progress_controller.dart';
import 'progress_view.dart';

class ProgressLoading extends GetxService {
  final RxBool _isShowing = false.obs;
  OverlayEntry? _overlayEntry;
  bool get isShowing => _isShowing.value;
  void show() {
    if (!_isShowing.value) {
      _isShowing.value = true;
      final context = Get.overlayContext;
      if (context != null) {
        final progressController = Get.find<ProgressController>();
        progressController.startRotation();
        final overlay = Overlay.of(context);
        _overlayEntry = OverlayEntry(
          builder: (context) => Positioned.fill(
            child: Material(
              color: Colors.white.withOpacity(0.6),
              child: ProgressView(context),
            ),
          ),
        );
        overlay.insert(_overlayEntry!);
      } else {
        print('No context found.');
      }
    }
  }

  void hide() {
    if (_isShowing.value) {
      _isShowing.value = false;
      _overlayEntry?.remove();
      _overlayEntry = null;
    }
  }
}
