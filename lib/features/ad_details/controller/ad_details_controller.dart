import 'package:dazaha_app/core/constant/exports_libraries.dart';

class AdDetailsController extends GetxController {
  var selectedIndex = 0.obs;
  var selectedIndex2 = 0.obs;
  var switchValue = false.obs;

  void changeSelect(int index) {
    selectedIndex.value = index;
  }

  void changeSelect2(int index) {
    selectedIndex2.value = index;
  }

  void setSwitch(bool value) {
    switchValue.value = value;
  }

  void toggleSwitch() {
    switchValue.value = !switchValue.value;
  }
}
