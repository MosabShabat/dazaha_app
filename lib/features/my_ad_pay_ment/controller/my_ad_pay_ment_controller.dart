import 'package:get/get.dart';

class MyAdPayMentController extends GetxController {
  var selectedIndex = 0.obs;
  void changeSelect(int index) {
    selectedIndex.value = index;
  }
}
