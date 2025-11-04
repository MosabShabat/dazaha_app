import '../../../core/constant/exports_widgets.dart';
import '../../../core/constant/exports_libraries.dart';
import '../../../core/widgets/app_snackbar.dart';
import '../../choose_the_service/controller/order_data_controller.dart';

class SelectStoreNameController extends GetxController {
  RxList<int> counters = <int>[].obs;
  RxList<TextEditingController> textControllers = <TextEditingController>[].obs;
  RxList<int> selectedTapTypes = <int>[].obs;

  final orderController = Get.find<OrderDataController>();
  RxInt numOfList = 1.obs;
  RxBool isButtonPressed = false.obs;

  @override
  void onInit() {
    super.onInit();
    initializeCounters(numOfList.value);
  }

  void initializeCounters(int length) {
    counters.value = List.generate(length, (_) => 1);
    textControllers.value = List.generate(
      length,
      (_) => TextEditingController(),
    );
    selectedTapTypes.value = List.generate(length, (_) => 1);
  }

  void increment(int index) => counters[index]++;
  void decrement(int index) {
    if (counters[index] > 1) counters[index]--;
  }

  void addNewItem() {
    numOfList.value++;
    counters.add(1);
    textControllers.add(TextEditingController());
    selectedTapTypes.add(1);
  }

  void setTapType(int index, int type) {
    selectedTapTypes[index] = type;
  }

  void validationInputData(BuildContext context) {
    orderController.itemNames.clear();
    orderController.itemQuantities.clear();
    orderController.itemTypes.clear();
    _setButtonPressed(true);
    for (int i = 0; i < textControllers.length; i++) {
      if (textControllers[i].text.isEmpty) {
        showErrorSnackbar(
          context,
          context.enterTitle,
          FirstColor: Colors.amber,
        );
        _setButtonPressed(false);
        return;
      }
    }
    for (int i = 0; i < textControllers.length; i++) {
      orderController.addItem(
        name: textControllers[i].text,
        quantity: counters[i],
        type: selectedTapTypes[i].toString(),
      );
    }
    _setButtonPressed(false);

    Get.toNamed(
      Routes.pickUpPointScreen,
      arguments: {
        'page': Routes.adDetailsScreen,
        'pageArgs': {'page': Routes.summaryScreen, 'isSwitchShow': false},
        'isAppBar': true,
      },
    );
  }

  void confirmDelete(int index) {
    if (numOfList.value > 1) {
      // تمنع حذف العنصر الوحيد
      counters.removeAt(index);
      textControllers.removeAt(index);
      selectedTapTypes.removeAt(index);
      numOfList.value--;
    }
  }

  void _setButtonPressed(bool value) => isButtonPressed.value = value;
}
