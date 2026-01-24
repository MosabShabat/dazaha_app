import 'package:get/get.dart';
import '../../saved_delivery_addresses/controller/saved_delivery_addresses_controller.dart';

class BuyMeController extends GetxController {
  final SavedDeliveryAddressesController savedDeliveryAddressesController =
      Get.find<SavedDeliveryAddressesController>();

  @override
  void onInit() {
    super.onInit();
    savedDeliveryAddressesController.index!.value = '1';
    savedDeliveryAddressesController.fetchAddresses(isStore: '1');
  }

  var isCloseNote = false.obs;
  void toggleIsColes() {
    isCloseNote.value = !isCloseNote.value;
  }
}
//0595142044