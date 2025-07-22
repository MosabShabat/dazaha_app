import 'package:dazaha_app/core/constant/exports_libraries.dart';

class SelectStoreNameController extends GetxController {
  late RxList<RxInt> counters;

  // Initialize counters with any default value (e.g., 1)
  void initializeCounters(int length) {
    counters = List.generate(length, (_) => 0.obs).obs;
  }

  void increment(int index) {
    counters[index]++;
  }

  void decrement(int index) {
    if (counters[index] > 0) {
      counters[index]--;
    }
  }
}
