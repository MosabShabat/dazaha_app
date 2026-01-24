import 'dart:developer';

import '../../../../core/constant/exports_libraries.dart';

import '../../../core/helpers/constants.dart';
import '../../../core/widgets/my_custom_text_field.dart';
import '../../saved_delivery_addresses/controller/saved_delivery_addresses_controller.dart';

class PickUpPointController extends GetxController {
  final SavedDeliveryAddressesController _savedDeliveryAddressesController =
      Get.find();

  final KeyboardDoneController doneController = KeyboardDoneController();

  @override
  onInit() {
    super.onInit();
    log('PickUpPointController initialized');
    log('lat :${AppConstants.lat}');
    log('lng :${AppConstants.lng}');
    log('name :${AppConstants.placeName}');
    log('PickUpPointController ended onInit');

    _savedDeliveryAddressesController.fetchAddresses();
  }

  @override
  void onClose() {
    super.onClose();
    log('PickUpPointController disposed');
  }

  @override
  dispose() {
    super.dispose();
    log('PickUpPointController disposed');
  }
}
