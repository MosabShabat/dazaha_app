import 'package:dazaha_app/core/constant/exports_libraries.dart';

class BookingDateController extends GetxController {
  RxSet<int> selectedTimeSlots = <int>{}.obs;

  // var selectedIndex = 0.obs;
  var selectedIndex2 = 0.obs;

  void changeSelect(int index) {
    selectedTimeSlots.add(index);
  }

  void changeSelect2(int index) {
    selectedIndex2.value = index;
  }
}
