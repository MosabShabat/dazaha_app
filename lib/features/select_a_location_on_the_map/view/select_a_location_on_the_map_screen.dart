import '../../../../core/constant/exports_libraries.dart';
import '../../../../core/helpers/theme_exports.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../../../core/helpers/app_assets.dart';
import '../../../core/helpers/app_shared_methods.dart';
import '../../../core/helpers/constants.dart';
import '../../../core/widgets/app_text_button.dart';
import '../../choose_the_service/controller/order_data_controller.dart';
import '../controller/select_a_location_on_the_map_controller.dart';

class SelectALocationOnTheMapScreen extends StatelessWidget {
  final SelectALocationOnTheMapController mapController = Get.find();
  final OrderDataController orderController = Get.find();

  //OrderDataController
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Obx(
          () => mapController.currentLocation == null
              ? _buildLoadingView(context)
              : _buildMapView(context),
        ),
      ),
    );
  }

  Widget _buildLoadingView(BuildContext context) {
    return Center(
      child: AppSharedMethods.buildProgressViewWhite(context, false),
    );
  }

  Widget _buildMapView(BuildContext context) {
    return Stack(
      children: [
        _buildGoogleMap(),
        _buildGpsButton(),
        _buildSatliteButton(),
        _buildBackButton(),
        _buildMarker(),
        _buildChooseButton(context),
      ],
    );
  }

  Widget _buildBackButton() {
    return Positioned(
      top: 50.h,
      right: AppSharedMethods.isAppLanguageArabic() ? 24.w : null,
      left: !AppSharedMethods.isAppLanguageArabic() ? 24.w : null,
      child: GestureDetector(
        onTap: () => Get.back(),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SvgPicture.asset(
            Get.locale == Locale('ar')
                ? AppAssets.svgs.icBack
                : AppAssets.svgs.icBackEn,
            width: 30.h,
            height: 30.w,
          ),
        ),
      ),
    );
  }

  Widget _buildMarker() {
    return Center(
      child: SvgPicture.asset(
        AppAssets.svgs.icMarker,
        width: 24.w,
        height: 40.h,
      ),
    );
  }

  Widget _buildGoogleMap() {
    return GoogleMap(
      mapType: mapController.mapType.value,
      initialCameraPosition: CameraPosition(
        target: mapController.currentLocation!,
        zoom: 18.0,
      ),
      onMapCreated: mapController.onMapCreated,
      onCameraMove: (position) {
        mapController.updateLocation(position.target);
      },
      myLocationEnabled: true,
      myLocationButtonEnabled: false,
      zoomControlsEnabled: false,
    );
  }

  Widget _buildGpsButton() {
    return Positioned(
      bottom: 220.h,
      left: Get.locale == Locale('ar') ? 24.w : null,
      right: Get.locale == Locale('en') ? 24.w : null,
      child: GestureDetector(
        onTap: () {
          mapController.moveToCurrentLocation();
        },
        child: SvgPicture.asset(
          AppAssets.svgs.icGps,
          width: 24.w,
          height: 40.h,
        ),
      ),
    );
  }

  Widget _buildSatliteButton() {
    return Positioned(
      bottom: 180,
      left: AppSharedMethods.isAppLanguageArabic() ? 24 : null,
      right: !AppSharedMethods.isAppLanguageArabic() ? 24 : null,
      child: GestureDetector(
        onTap: mapController.changeMapToSatlite,
        child: SvgPicture.asset(
          AppAssets.svgs.icSatlite,
          width: 24,
          height: 40,
        ),
      ),
    );
  }

  Widget _buildChooseButton(BuildContext context) {
    return Positioned(
      bottom: 40.h,
      left: 24.w,
      right: 24.w,
      child: AppTextButton(
        context,
        buttonText: context.choice,
        onPressed: () {
          orderController.placeName.value = mapController.placeName.value;
          Get.back(
            result: {
              AppConstants.lat: mapController.currentLocation!.latitude,
              AppConstants.lng: mapController.currentLocation!.longitude,
              AppConstants.placeName: mapController.placeName.value,
            },
          );
        },
        // () => Get.back(
        //   result: {
        //     AppConstants.lat: mapController.currentLocation!.latitude,
        //     AppConstants.lng: mapController.currentLocation!.longitude,
        //     AppConstants.placeName: mapController.placeName.value,
        //   },
        // ),
      ),
    );
  }

  // BottomNavigationBarWidget(
  //         text: context.choice,
  //         context,
  //         GetScreen: () {},
  //       ),
  //      appBar: DefAppBarWidget(context),
}
