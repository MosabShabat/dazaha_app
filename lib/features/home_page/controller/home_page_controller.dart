import 'dart:async';
import 'dart:developer';
import 'package:connectivity_plus/connectivity_plus.dart';
import '../../../core/constant/exports_widgets.dart';
import '../../../core/network/models/home/current_order.dart';
import '../../../core/network/utils/api_result.dart';
import '../../../features/home_page/controller/home_repo.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import '../../../core/constant/exports_libraries.dart';
import '../../../core/helpers/app_shared_data.dart';
// import '../../../core/helpers/app_shared_methods.dart';
import '../../../core/helpers/constants.dart';
import '../../../core/network/models/auth/user_data.dart';
import '../../../core/network/models/home/home_data_model.dart';
import '../../../core/network/models/home/latest_order_item_model.dart';
import '../../../core/network/models/home/service_item_model.dart';
import '../../../core/widgets/app_snackbar.dart';

class HomePageController extends GetxController {
  var selectedIndex = 0.obs;
  var selectedTab = 0.obs;

  void changeTab(int index) {
    selectedIndex.value = index;
  }

  final HomeRepo _homeRepo = Get.find();
  String? accountType = 'user';

  var isRefreshing = false.obs;
  var currentLocation = ''.obs;
  var latitude = 0.0.obs;
  var longitude = 0.0.obs;
  var isOffline = false.obs;

  RxBool isLoading = true.obs;
  Rxn<HomeDataModel> homeModel = Rxn<HomeDataModel>();
  Rxn<UserData> userData = Rxn<UserData>();
  Rxn<CurrentOrder> currentOrder = Rxn<CurrentOrder>();

  RxList<ServiceItemModel> serviceItem = <ServiceItemModel>[].obs;
  RxList<LatestOrderItemModel> latestOrder = <LatestOrderItemModel>[].obs;
  final RefreshController homeRefreshController = RefreshController();

  @override
  void onInit() {
    super.onInit();
    listenConnection();
    getLocation();
  }

  /// تحميل بيانات المستخدم من AppSharedData عند بدء التطبيق
  void loadCurrentUser() {
    final currentUser = AppSharedData.currentUserInfo;
    if (currentUser != null) {
      userData.value = currentUser;
    }
  }

  /// تحديث البيانات بعد تسجيل الدخول
  Future<void> refreshAfterLogin() async {
    // منع تكرار التحديث إذا كان جاريًا
    if (isRefreshing.value) {
      log('refreshAfterLogin: already refreshing, skipping duplicate call');
      return;
    }
    isRefreshing.value = true;

    final currentUser = AppSharedData.currentUserInfo;
    if (currentUser != null) {
      userData.value = currentUser;
      // await refreshData(latitude.value.toString(), longitude.value.toString());
      log('Home data refreshed after login');
    }
  }

  Future<void> getLocation() async {
    try {
      // bool serviceEnabled = await _checkLocationService();
      // if (!serviceEnabled) return;
      LocationPermission permission = await _requestLocationPermission();
      if (permission == LocationPermission.denied ||
          permission == LocationPermission.deniedForever)
        return;
      Position position = await _getCurrentPosition();
      await _updateLocationData(position);
    } catch (e) {
      log('Error getting location: $e');
    }
  }

  // Future<bool> _checkLocationService() async {
  //   bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
  //   if (!serviceEnabled) {
  //     AppSharedMethods.showLocationServicesDialog(
  //       context: Get.context!,
  //       onConfirm: () async {
  //         Get.back();
  //         await Geolocator.openLocationSettings();
  //         await Future.delayed(Duration(seconds: 2));
  //         getLocation();
  //       },
  //     );
  //   }
  //   return serviceEnabled;
  // }

  Future<LocationPermission> _requestLocationPermission() async {
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }
    return permission;
  }

  Future<Position> _getCurrentPosition() async {
    return await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.bestForNavigation,
      timeLimit: const Duration(seconds: 10),
    );
  }

  Future<void> _updateLocationData(Position position) async {
    latitude.value = position.latitude;
    longitude.value = position.longitude;

    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(
        position.latitude,
        position.longitude,
      );

      if (placemarks.isNotEmpty) {
        Placemark place = placemarks[0];
        String? locality = place.locality;
        String? subLocality = place.subLocality;
        String? administrativeArea = place.administrativeArea;
        String? thoroughfare = place.thoroughfare;
        String? name = place.name;
        currentLocation.value = (locality?.isNotEmpty == true
            ? locality
            : (subLocality?.isNotEmpty == true
                  ? subLocality
                  : (administrativeArea?.isNotEmpty == true
                        ? administrativeArea
                        : (thoroughfare?.isNotEmpty == true
                              ? thoroughfare
                              : (name ?? Get.context!.unknownPlace)))))!;
      } else {
        currentLocation.value = Get.context!.unknownPlace;
      }
    } catch (e) {
      currentLocation.value = Get.context!.currentLocation;
    }

    AppSharedData.removeSecuredData(AppSharedKeys.deliveryAddressUuid);
    AppSharedData.setSecuredString(
      AppSharedKeys.lat,
      latitude.value.toString(),
    );
    AppSharedData.setSecuredString(
      AppSharedKeys.lng,
      longitude.value.toString(),
    );

    if (currentLocation.value.isEmpty || currentLocation.value == '') {
      currentLocation.value = Get.context!.unknownLocation;
    }
    AppSharedData.setSecuredString(
      AppSharedKeys.placeName,
      currentLocation.value,
    );
    latConstant = '${latitude.value}';
    lngConstant = '${longitude.value}';

    getHome('${latitude.value}', '${longitude.value}');
  }

  Future<void> getHome(String lat, String lng) async {
    isLoading.value = true;
    final result = await _homeRepo.getHome(lat, lng);
    result.when(
      success: (response) {
        isLoading.value = false;
        if (response.status == true) {
          if (response.data != null) {
            homeModel.value = HomeDataModel.fromJson(
              response.data as Map<String, dynamic>,
            );
          } else {
            // إذا أردت، فقط log ولا تعرض SnackBar
            log('No data received from API');
          }
        } else {
          if (Get.context != null) {
            if (isOffline.value) {
              // إذا الجهاز offline لا تعرض SnackBar
              log('Offline, skipping snackbar for API error');
            } else {
              showErrorSnackbar(
                Get.context!,
                response.message ?? '',
                FirstColor: Colors.red,
              );
            }
          }
        }
      },
      failure: (error) {
        isLoading.value = false;
        // إذا الجهاز offline، لا تعرض SnackBar
        if (!isOffline.value && Get.context != null) {
          showSnackbarErrorApi(Get.context!, [error], null);
        }
      },
    );
  }

  void updateLocation(
    String name,
    String lat,
    String lng,
    String deliveryAddressUuid,
  ) {
    latitude.value = double.parse(lat);
    longitude.value = double.parse(lng);
    currentLocation.value = name;
    AppSharedData.setSecuredString(AppSharedKeys.lat, lat);
    AppSharedData.setSecuredString(AppSharedKeys.lng, lng);
    AppSharedData.setSecuredString(
      AppSharedKeys.deliveryAddressUuid,
      deliveryAddressUuid,
    );

    if (name.isEmpty || name == '') {
      name = Get.context!.unknownLocation;
    }
    AppSharedData.setSecuredString(AppSharedKeys.placeName, name);
    homeRefreshController.requestRefresh();
    refreshData(lat, lng);
  }

  Future<void> refreshData(String lat, String lng) async {
    isRefreshing.value = true;
    await Future.delayed(Duration(seconds: 2));
    homeRefreshController.refreshCompleted();
    isRefreshing.value = false;
    latConstant = lat;
    lngConstant = lng;
    getHome(lat, lng);
  }

  @override
  void dispose() {
    super.dispose();
    homeRefreshController.dispose();
    log('Home Controller disposed');
  }

  @override
  void onClose() {
    homeRefreshController.dispose();
    log('Home Controller close');
    super.onClose();
  }

  void listenConnection() {
    Connectivity().onConnectivityChanged.listen((
      List<ConnectivityResult> results,
    ) {
      if (results.contains(ConnectivityResult.none)) {
        isOffline.value = true;
      } else {
        isOffline.value = false;
      }
    });
  }
}
