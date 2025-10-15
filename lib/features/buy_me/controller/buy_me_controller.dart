import 'package:get/get.dart';

class BuyMeController extends GetxController {
  var isCloseNote = false.obs;
  void toggleIsColes() {
    isCloseNote.value = !isCloseNote.value;
  }
}
