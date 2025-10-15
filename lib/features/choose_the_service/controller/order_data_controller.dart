import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class OrderDataController extends GetxController {
  RxString serviceUuid = ''.obs;
  RxString itemUuid = ''.obs;
  RxString timeUuid = ''.obs;
  RxString data = ''.obs;
  RxString OrderUuid = ''.obs;
  RxString exceptPrice = ''.obs;
  RxString currencyVar = ''.obs;
  RxString orderIdVar = ''.obs;
  RxString offerStatus = ''.obs;
  RxString userImage = ''.obs;
  RxString userRate = ''.obs;
  RxString userName = ''.obs;
  RxString userUuid = ''.obs;
  RxString orderId = ''.obs;
  RxString orderTitle = ''.obs;
  RxString reviewType = ''.obs;
  RxString itemStatus = ''.obs;

  RxList<String> itemNames = <String>[].obs;
  RxList<int> itemQuantities = <int>[].obs;
  RxList<String> itemTypes = <String>[].obs;
  RxList<String> timeUuids = <String>[].obs;

  RxString fromDeliveryAddressUuid = ''.obs;
  RxString from = ''.obs;
  RxString fromLat = ''.obs;
  RxString fromLng = ''.obs;
  RxString fromAddress = ''.obs;
  RxString serviceName = ''.obs;
  RxString serviceNumber = ''.obs;

  RxString toDeliveryAddressUuid = ''.obs;
  RxString to = ''.obs;
  RxString toLat = ''.obs;
  RxString toLng = ''.obs;
  RxString toAddress = ''.obs;

  RxString receiptMethodUuid = ''.obs;
  RxString canHelp = ''.obs;
  RxString title = ''.obs;
  RxString description = ''.obs;
  RxString sizeUuid = ''.obs;
  RxString helpers = ''.obs;
  RxString likedPrice = ''.obs;

  RxList<XFile> images = <XFile>[].obs; // صور باستخدام ImagePicker

  void setServiceUuid(String value) => serviceUuid.value = value;
  void setItemUuid(String value) => itemUuid.value = value;
  void setTimeUuid(String value) => timeUuid.value = value;
  void setUserName(String value) => userName.value = value;
  void setUserImage(String value) => userImage.value = value;
  void setUserRate(String value) => userRate.value = value;
  void setUserUuid(String value) => userUuid.value = value;
  void setItemStatus(String value) => itemStatus.value = value;

  //userUuid
  void setData(String value) => data.value = value;
  void setOrderUuid(String value) => OrderUuid.value = value;
  void setExceptPrice(String value) => exceptPrice.value = value;
  void setCurrencyVar(String value) => currencyVar.value = value;
  void setOrderIdVar(String value) => orderIdVar.value = value;
  void setOfferStatus(String value) => offerStatus.value = value;
  void setReviewType(String value) => reviewType.value = value;

  //reviewType

  void setTimeUuids(List<String> values) => timeUuids.assignAll(values);

  void setFromDeliveryAddressUuid(String value) =>
      fromDeliveryAddressUuid.value = value;
  void setFromLat(String value) => fromLat.value = value;
  void setFrom(String value) => from.value = value;
  void setTo(String value) => to.value = value;

  //from
  void setFromLng(String value) => fromLng.value = value;
  void setFromAddress(String value) => fromAddress.value = value;
  void setServiceName(String value) => serviceName.value = value;
  void setServiceNumber(String value) => serviceNumber.value = value;

  void setItemsFromArray(List<Map<String, dynamic>> items) {
    itemNames.clear();
    itemQuantities.clear();
    itemTypes.clear();

    for (var item in items) {
      itemNames.add(item['name'] ?? '');
      itemQuantities.add(item['quantity'] ?? 0);
      itemTypes.add(item['type'] ?? '');
    }
  }

  //serviceName

  void setToDeliveryAddressUuid(String value) =>
      toDeliveryAddressUuid.value = value;
  void setToLat(String value) => toLat.value = value;
  void setToLng(String value) => toLng.value = value;
  void setToAddress(String value) => toAddress.value = value;

  void setReceiptMethodUuid(String value) => receiptMethodUuid.value = value;
  void setCanHelp(String value) => canHelp.value = value;
  void setTitle(String value) => title.value = value;
  void setDescription(String value) => description.value = value;
  void setSizeUuid(String value) => sizeUuid.value = value;
  void setHelpers(String value) => helpers.value = value;
  void setLikedPrice(String value) => likedPrice.value = value;
  void setOrderId(String value) => orderId.value = value;
  void setOrderTitle(String value) => orderTitle.value = value;

  void setImages(List<XFile> value) => images.assignAll(value);

  // 3️⃣ دالة لإضافة صورة واحدة
  void addImage(XFile image) => images.add(image);

  // 4️⃣ دالة لحذف صورة
  void removeImage(XFile image) => images.remove(image);

  // 3️⃣ دالة لإضافة عنصر جديد
  void addItem({
    required String name,
    required int quantity,
    required String type,
  }) {
    itemNames.add(name);
    itemQuantities.add(quantity);
    itemTypes.add(type);
  }

  // 4️⃣ دالة لحذف عنصر
  void removeItem(int index) {
    if (index >= 0 && index < itemNames.length) {
      itemNames.removeAt(index);
      itemQuantities.removeAt(index);
      itemTypes.removeAt(index);
    }
  }

  // 5️⃣ دالة لمسح كل البيانات (مثلاً عند إلغاء الطلب)
  void clearAll() {
    serviceUuid.value = '';
    itemUuid.value = '';
    timeUuid.value = '';
    data.value = '';
    userUuid.value = '';
    from.value = '';
    itemStatus.value = '';
    userName.value = '';
    userImage.value = '';
    userRate.value = '';
    orderId.value = '';
    orderTitle.value = '';
    to.value = '';
    OrderUuid.value = '';
    reviewType.value = '';
    exceptPrice.value = '';
    currencyVar.value = '';
    orderIdVar.value = '';
    offerStatus.value = '';
    timeUuids.clear();
    fromDeliveryAddressUuid.value = '';
    fromLat.value = '';
    fromLng.value = '';
    fromAddress.value = '';
    serviceName.value = '';
    serviceNumber.value = '';
    toDeliveryAddressUuid.value = '';
    toLat.value = '';
    toLng.value = '';
    toAddress.value = '';
    receiptMethodUuid.value = '';
    canHelp.value = '';
    title.value = '';
    description.value = '';
    sizeUuid.value = '';
    helpers.value = '';
    likedPrice.value = '';
    images.clear();
    itemNames.clear();
    itemQuantities.clear();
    itemTypes.clear();
  }
}
