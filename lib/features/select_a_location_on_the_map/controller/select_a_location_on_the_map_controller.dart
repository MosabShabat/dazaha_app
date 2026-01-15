import 'dart:developer';

import 'package:dazaha_app/core/constant/exports_widgets.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../../../core/constant/exports_libraries.dart';
import '../../../core/helpers/app_shared_methods.dart';

class SelectALocationOnTheMapController extends GetxController
    with WidgetsBindingObserver {
  GoogleMapController? mapController;
  final Rx<LatLng?> currentLatLng = Rx<LatLng?>(null);
  final RxString placeName = ''.obs;

  LatLng? get currentLocation => currentLatLng.value;
  var mapType = MapType.normal.obs;

  @override
  void onInit() {
    super.onInit();
    placeName.value = '';
    WidgetsBinding.instance.addObserver(this);
    _determinePosition();
  }

  @override
  void onClose() {
    WidgetsBinding.instance.removeObserver(this);
    super.onClose();
    placeName.value = '';
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      _determinePosition();
    }
  }

  void onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  void updateLocation(LatLng latLng) {
    currentLatLng.value = latLng;
    _getPlaceName(latLng);
  }

  Future<void> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      AppSharedMethods.showLocationServicesDialog(
        context: Get.context!,
        isHome: false,
        onConfirm: () async {
          Get.back();
          await Geolocator.openLocationSettings();
        },
      );
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
        'Location permissions are permanently denied, we cannot request permissions.',
      );
    }

    Position position = await Geolocator.getCurrentPosition();
    updateLocation(LatLng(position.latitude, position.longitude));
  }

  Future<String> getPlaceNameFromLatLng(LatLng latLng) async {
    try {
      // 👈 اضبط لغة النتائج قبل الاستعلام
      await setLocaleIdentifier('ar_SA');
      final placemarks = await placemarkFromCoordinates(
        latLng.latitude,
        latLng.longitude,
      );

      if (placemarks.isEmpty) {
        return _fallbackFromLatLng(latLng);
      }

      final p = placemarks.first;

      final parts = <String>[
        if ((p.name ?? '').trim().isNotEmpty) p.name!.trim(),
        if ((p.street ?? '').trim().isNotEmpty) p.street!.trim(),
        if ((p.subLocality ?? '').trim().isNotEmpty) p.subLocality!.trim(),
        if ((p.locality ?? '').trim().isNotEmpty) p.locality!.trim(),
        if ((p.administrativeArea ?? '').trim().isNotEmpty)
          p.administrativeArea!.trim(),
        if ((p.country ?? '').trim().isNotEmpty) p.country!.trim(),
      ];

      final joined = parts.join('، ');
      if (joined.isEmpty) {
        return _fallbackFromLatLng(latLng);
      }

      return joined;
    } catch (e) {
      return _fallbackFromLatLng(latLng);
    }
  }

  Future<void> _getPlaceName(LatLng latLng) async {
    placeName.value = await getPlaceNameFromLatLng(latLng);
  }

  String _fallbackFromLatLng(LatLng latLng) {
    return '${latLng.latitude.toStringAsFixed(5)}, ${latLng.longitude.toStringAsFixed(5)}';
  }

  // Future<void> _getPlaceName(LatLng latLng) async {
  //   try {
  //     List<Placemark> placeMarks = await placemarkFromCoordinates(
  //       latLng.latitude,
  //       latLng.longitude,
  //     );
  //     if (placeMarks.isNotEmpty) {
  //       Placemark place = placeMarks[0];

  //       String? locality = place.locality;
  //       String? subLocality = place.subLocality;
  //       String? administrativeArea = place.administrativeArea;
  //       String? thoroughfare = place.thoroughfare;
  //       String? name = place.name;

  //       placeName.value = (locality?.isNotEmpty == true
  //           ? locality
  //           : (subLocality?.isNotEmpty == true
  //                 ? subLocality
  //                 : (administrativeArea?.isNotEmpty == true
  //                       ? administrativeArea
  //                       : (thoroughfare?.isNotEmpty == true
  //                             ? thoroughfare
  //                             : (name ?? Get.context!.unknownPlace)))))!;
  //     } else {
  //       placeName.value = Get.context!.unknownPlace;
  //     }
  //   } catch (e) {
  //     placeName.value = Get.context!.unknownPlace;
  //   }

  //   // try {
  //   //   List<Placemark> placemarks =
  //   //       await placemarkFromCoordinates(latLng.latitude, latLng.longitude);
  //   //   if (placemarks.isNotEmpty) {
  //   //     placeName.value = placemarks.first.name ?? Get.context!.unknownPlace;
  //   //   } else {
  //   //     placeName.value = Get.context!.unknownPlace;
  //   //   }
  //   // } catch (e) {
  //   //   placeName.value = Get.context!.failedGetName;
  //   // }
  // }

  void moveToCurrentLocation() async {
    await _determinePosition();
    if (currentLocation != null && mapController != null) {
      mapController!.animateCamera(CameraUpdate.newLatLng(currentLocation!));
    } else {
      log('Failed to move to current location');
    }
  }

  void changeMapToSatlite() {
    mapType.value = mapType.value == MapType.normal
        ? MapType.satellite
        : MapType.normal;
  }
}
