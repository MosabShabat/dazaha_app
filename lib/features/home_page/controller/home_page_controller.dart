import 'package:get/get.dart';

class HomePageController extends GetxController {
  var selectedIndex = 0.obs;
  var selectedTab = 0.obs;

  void changeTab(int index) {
    selectedIndex.value = index;
  }
}
