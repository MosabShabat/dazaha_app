import 'package:get/get.dart';

class PickUpMethodUponDeliveryController extends GetxController {
  var selectedIndex = 0.obs;
  var switchValue = false.obs;

  void changeSelect(int index) {
    selectedIndex.value = index;
  }

  void setSwitch(bool value) {
    switchValue.value = value;
  }

  void toggleSwitch() {
    switchValue.value = !switchValue.value;
  }
}
