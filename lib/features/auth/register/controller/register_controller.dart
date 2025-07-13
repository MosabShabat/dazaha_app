import 'package:get/get.dart';

class RegisterController extends GetxController {
  var switchValue = false.obs;
  void setSwitch(bool value) {
    switchValue.value = value;
  }

  void toggleSwitch() {
    switchValue.value = !switchValue.value;
  }
}
