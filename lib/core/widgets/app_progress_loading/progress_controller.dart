import 'dart:async';

import 'package:get/get.dart';

class ProgressController extends GetxController {
  var rotationAngle = 0.0.obs;

  Timer? _timer;

  @override
  void onInit() {
    super.onInit();
    startRotation();
  }

  @override
  void onClose() {
    _timer?.cancel();
    super.onClose();
  }

  void startRotation() {
    _timer?.cancel();
    _timer = Timer.periodic(Duration(milliseconds: 15), (timer) {
      rotationAngle.value += 5;
      if (rotationAngle.value >= 360) {
        rotationAngle.value = 0;
      }
    });
  }
}
