import '../../../../core/constant/exports_libraries.dart';

import '../../saved_delivery_addresses/controller/saved_delivery_addresses_controller.dart';

class PickUpPointController extends GetxController {
  final SavedDeliveryAddressesController _savedDeliveryAddressesController =
      Get.find();
  onInit() {
    super.onInit();
    _savedDeliveryAddressesController.fetchAddresses();
  }
}
