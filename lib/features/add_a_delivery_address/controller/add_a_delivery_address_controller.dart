import '../../../core/constant/exports_widgets.dart';
import '../../../core/constant/exports_libraries.dart';
import '../../../core/helpers/app_shared_methods.dart';
import '../../../core/helpers/constants.dart';
import '../../../core/network/models/addresses/address_item_model.dart';
import '../../../core/network/models/addresses/area_model.dart';
import '../../../core/network/models/addresses/city_model.dart';
import '../../../core/network/models/addresses/country_model.dart';
import '../../../core/network/utils/api_result.dart';
import '../../../core/widgets/app_snackbar.dart';
import '../../../core/widgets/app_snackbar_with_button.dart';
import '../../saved_delivery_addresses/controller/saved_delivery_addresses_controller.dart';
import 'add_a_delivery_repo.dart';

class AddADeliveryAddressController extends GetxController {
  final AddADeliveryRepo _addADeliveryRepo = Get.find<AddADeliveryRepo>();

  final placeNameController = TextEditingController();
  final StreetController = TextEditingController();
  final phoneController = TextEditingController();

  final RxDouble latitude = 0.0.obs;
  final RxDouble longitude = 0.0.obs;
  final RxString locationName = ''.obs;

  final String countryCode = "964";

  RxBool isButtonPressed = false.obs;
  Rx<AddressItemModel>? addreess;

  RxBool isLoading = true.obs;

  RxList<CountryModel> countries = <CountryModel>[].obs;
  Rx<CountryModel?> selectedCountry = Rx<CountryModel?>(null);
  RxList<CityModel> selectedCity = <CityModel>[].obs;
  Rx<CityModel?> selectedCityModel = Rx<CityModel?>(null);
  RxList<AreaModel> selectedArea = <AreaModel>[].obs;
  Rx<AreaModel?> selectedAreaModel = Rx<AreaModel?>(null);
  SavedDeliveryAddressesController _savedDeliveryAddressesController =
      Get.find<SavedDeliveryAddressesController>();
  @override
  void onInit() {
    super.onInit();
    locationName.value = '';
    getAddressDetails().then((_) {
      final isEdit =
          Get.arguments != null && Get.arguments[AppConstants.isEdit] == true;
      final addressUuid = Get.arguments != null
          ? Get.arguments[AppConstants.addressUuid]
          : null;

      if (isEdit && addressUuid != null) {
        getddressDetails(addressUuid);
      }
    });
  }

  void updateLocation(double lat, double lng, String placeName) {
    latitude.value = lat;
    longitude.value = lng;
    locationName.value = placeName;
  }

  void validateInput(
    BuildContext context, {
    required bool isEdit,
    String? addressUuid,
  }) {
    if (_isFieldEmpty(placeNameController, context.placeName, context)) return;
    if (_isFieldEmpty(StreetController, context.address, context)) return;

    if (_isPhoneNumberEmpty()) {
      showErrorSnackbar(
        context,
        context.mobileNumber,
        FirstColor: Colors.amber,
      );
      return;
    }

    if (!_isValidPhoneNumber()) {
      showErrorSnackbar(
        context,
        context.enterValidPhoneNumber,
        FirstColor: Colors.amber,
      );
      return;
    }

    if (latitude.value == 0.0 && longitude.value == 0.0) {
      showErrorSnackbar(
        context,
        context.selectLocation,
        FirstColor: Colors.amber,
      );
      return;
    }

    String phoneNumber = '$countryCode-${phoneController.text}';

    if (isEdit) {
      updateAddress(
        context,
        addressUuid!,
        placeNameController.text,
        selectedCityModel.value?.uuid ?? '',
        selectedAreaModel.value?.uuid ?? '',
        StreetController.text,
        phoneNumber,
        '${latitude.value}',
        '${longitude.value}',
      );
      _savedDeliveryAddressesController.fetchAddresses();
    } else {
      addAddressRequest(
        context,
        placeNameController.text,
        selectedCityModel.value?.uuid ?? '',
        selectedAreaModel.value?.uuid ?? '',
        StreetController.text,
        phoneNumber,
        '${latitude.value}',
        '${longitude.value}',
      );
    }
    _savedDeliveryAddressesController.fetchAddresses();
    // Get.back(result: true);
  }

  bool _isFieldEmpty(
    TextEditingController controller,
    String errorMessage,
    BuildContext context,
  ) {
    if (AppSharedMethods.isTextFieldEmpty(controller)) {
      showErrorSnackbar(context, errorMessage, FirstColor: Colors.amber);
      return true;
    }
    return false;
  }

  bool _isPhoneNumberEmpty() =>
      AppSharedMethods.isTextFieldEmpty(phoneController);
  bool _isValidPhoneNumber() => GetUtils.isPhoneNumber(phoneController.text);

  void updateAddress(
    BuildContext context,
    String addressUuid,
    String placeName,
    String cityUuid,
    String areaUuid,
    String street,
    String mobile,
    String lat,
    String lng,
  ) async {
    isButtonPressed.value = true;
    final result = await _addADeliveryRepo.updateAddress(
      addressUuid,
      placeName,
      cityUuid,
      areaUuid,
      street,
      mobile,
      lat,
      lng,
    );

    result.when(
      success: (response) {
        isButtonPressed.value = false;
        if (response.status == true) {
          showSnackbarWithButton(
            Get.context!,
            Get.context!.addressUpdatedSuccessfully,
            AppConstants.success,
            showButton: false,
          );
          _savedDeliveryAddressesController.fetchAddresses();
          Get.back(result: true);
        } else {
          showErrorSnackbar(Get.context!, response.message ?? '');
        }
      },
      failure: (error) {
        isButtonPressed.value = false;
        showSnackbarErrorApi(context, [error], null);
      },
    );
  }

  RxBool isDetailsLoading = true.obs;

  void getddressDetails(String addressUuid) async {
    isDetailsLoading.value = true;

    final result = await _addADeliveryRepo.addressDetails(addressUuid);

    result.when(
      success: (response) {
        if (response.status == true && response.data != null) {
          final data = response.data as Map<String, dynamic>;

          // 1. تعبئة حقل العنوان
          addreess = AddressItemModel.fromJson(data['item']).obs;

          // 2. تعبئة الحقول النصية
          placeNameController.text = addreess?.value.name ?? '';
          StreetController.text = addreess?.value.street ?? '';
          phoneController.text = addreess?.value.mobile ?? '';
          latitude.value = double.tryParse(addreess?.value.lat ?? '0.0') ?? 0.0;
          longitude.value =
              double.tryParse(addreess?.value.lng ?? '0.0') ?? 0.0;
          locationName.value = addreess?.value.address ?? '';

          // 3. تعبئة الدول والمدن والمناطق
          final countriesRaw = data['countries'] as List;
          countries.assignAll(
            countriesRaw.map((e) => CountryModel.fromJson(e)).toList(),
          );

          // تحديد الدولة التي تحتوي على المدينة المحددة
          final selectedCityUuid = addreess?.value.cityUuid;
          final selectedAreaUuid = addreess?.value.areaUuid;

          for (final country in countries) {
            final city = country.cities?.firstWhereOrNull(
              (c) => c.uuid == selectedCityUuid,
            );
            if (city != null) {
              selectedCountry.value = country;
              selectedCity.assignAll(country.cities ?? []);
              selectedCityModel.value = city;

              final area = city.areas?.firstWhereOrNull(
                (a) => a.uuid == selectedAreaUuid,
              );
              if (area != null) {
                selectedArea.assignAll(city.areas ?? []);
                selectedAreaModel.value = area;
              }
              break;
            }
          }
        }

        isDetailsLoading.value = false;
      },
      failure: (error) {
        isDetailsLoading.value = false;
        showSnackbarErrorApi(Get.context!, [error], null);
      },
    );
  }

  void addAddressRequest(
    BuildContext context,
    String placeName,
    String cityUuid,
    String areaUuid,
    String street,
    String mobile,
    String lat,
    String lng,
  ) async {
    isButtonPressed.value = true;
    final result = await _addADeliveryRepo.addAddress(
      placeName,
      cityUuid,
      areaUuid,
      street,
      mobile,
      lat,
      lng,
    );

    result.when(
      success: (response) {
        isButtonPressed.value = false;
        if (response.status == true) {
          showSnackbarWithButton(
            Get.context!,
            Get.context!.addressAddedSuccessfully,
            AppConstants.success,
            showButton: false,
          );
          _savedDeliveryAddressesController.fetchAddresses();
          Get.back(result: true);
        } else {
          showErrorSnackbar(Get.context!, response.message ?? '');
        }
      },
      failure: (error) {
        isButtonPressed.value = false;
        showSnackbarErrorApi(context, [error], null);
      },
    );
  }

  Future<void> getAddressDetails() async {
    isLoading.value = true;
    final result = await _addADeliveryRepo.requirements(
      requirements: ['countries'],
    );
    result.when(
      success: (response) {
        isLoading.value = false;
        if (response.status == true && response.data != null) {
          final data = response.data as Map<String, dynamic>;
          final rawCountries = data['countries'] as List<dynamic>;
          countries.assignAll(
            rawCountries.map((e) => CountryModel.fromJson(e)).toList(),
          );
        } else {
          showErrorSnackbar(Get.context!, response.message ?? '');
        }
      },
      failure: (error) {
        isLoading.value = false;
        showSnackbarErrorApi(Get.context!, [error], null);
      },
    );
  }

  void updateCities(CountryModel country) {
    selectedCountry.value = country;
    selectedCity.assignAll(country.cities ?? []);
    selectedCityModel.value = null;
    selectedArea.clear();
    selectedAreaModel.value = null;
  }

  void updateAreas(CityModel city) {
    selectedCityModel.value = city;
    selectedArea.assignAll(city.areas ?? []);
    selectedAreaModel.value = null;
  }

  @override
  void dispose() {
    super.dispose();
  }
}
