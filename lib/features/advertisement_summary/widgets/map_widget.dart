import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../../../core/constant/exports_libraries.dart';
import '../../../core/helpers/app_assets.dart';

class MapWidget extends StatefulWidget {
  final fromLat;
  final fromLng;
  final toLat;
  final toLng;
  final fromAddress;
  final toAddress;
  MapWidget({
    Key? key,
    this.fromLat,
    this.fromLng,
    this.fromAddress,
    this.toAddress,
    this.toLat,
    this.toLng,
  }) : super(key: key);

  @override
  State<MapWidget> createState() => _MapWidgetState();
}

class _MapWidgetState extends State<MapWidget> {
  late GoogleMapController _mapController;

  BitmapDescriptor? markerAIcon;
  BitmapDescriptor? markerBIcon;

  @override
  void initState() {
    super.initState();
    _loadMarkerIcons();
  }

  Future<void> _loadMarkerIcons() async {
    markerAIcon = await BitmapDescriptor.fromAssetImage(
      const ImageConfiguration(size: Size(80, 80)),
      AppAssets.images.marker_a_png,
    );

    markerBIcon = await BitmapDescriptor.fromAssetImage(
      const ImageConfiguration(size: Size(80, 80)),
      AppAssets.images.marker_b_png,
    );

    setState(() {});
  }

  double tryParseSafe(String? val) {
    if (val == null || val.isEmpty) return 0.0;
    return double.tryParse(val) ?? 0.0;
  }

  LatLngBounds _boundsFromMarkers(List<Marker> markers) {
    if (markers.isEmpty) {
      return LatLngBounds(southwest: LatLng(0, 0), northeast: LatLng(0, 0));
    } else if (markers.length == 1) {
      final pos = markers.first.position;
      return LatLngBounds(
        southwest: LatLng(pos.latitude - 0.01, pos.longitude - 0.01),
        northeast: LatLng(pos.latitude + 0.01, pos.longitude + 0.01),
      );
    }

    final latitudes = markers.map((m) => m.position.latitude);
    final longitudes = markers.map((m) => m.position.longitude);

    final southwest = LatLng(
      latitudes.reduce((a, b) => a < b ? a : b),
      longitudes.reduce((a, b) => a < b ? a : b),
    );
    final northeast = LatLng(
      latitudes.reduce((a, b) => a > b ? a : b),
      longitudes.reduce((a, b) => a > b ? a : b),
    );

    return LatLngBounds(southwest: southwest, northeast: northeast);
  }

  @override
  Widget build(BuildContext context) {
    final fromLat = tryParseSafe(widget.fromLat);
    final fromLng = tryParseSafe(widget.fromLng);
    final toLat = tryParseSafe(widget.toLat);
    final toLng = tryParseSafe(widget.toLng);

    if (fromLat == 0.0 && fromLng == 0.0) {
      return Container(
        height: 200.h,
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: const Center(child: Text("يرجى تحديد العناوين أولاً")),
      );
    }

    final fromMarker = Marker(
      markerId: const MarkerId('from'),
      position: LatLng(fromLat, fromLng),
      icon: markerAIcon ?? BitmapDescriptor.defaultMarker,
      infoWindow: InfoWindow(title: widget.fromAddress),
    );

    final toMarker = Marker(
      markerId: const MarkerId('to'),
      position: LatLng(toLat, toLng),
      icon: markerBIcon ?? BitmapDescriptor.defaultMarker,
      infoWindow: InfoWindow(title: widget.toAddress),
    );

    // إضافة Marker B فقط إذا الإحداثيات ليست صفرية
    final allMarkers = <Marker>[fromMarker];
    if (toLat != 0.0 || toLng != 0.0) {
      allMarkers.add(toMarker);
    }

    return SizedBox(
      height: 200.h,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12.r),
        child: GoogleMap(
          initialCameraPosition: CameraPosition(
            target: LatLng(fromLat, fromLng),
            zoom: 12.r,
          ),
          markers: allMarkers.toSet(),
          zoomControlsEnabled: true,
          compassEnabled: true,
          myLocationButtonEnabled: false,
          myLocationEnabled: false,
          zoomGesturesEnabled: true,
          scrollGesturesEnabled: true,
          onMapCreated: (controller) async {
            _mapController = controller;
            LatLngBounds bounds = _boundsFromMarkers(allMarkers);
            await Future.delayed(Duration(milliseconds: 100));
            _mapController.animateCamera(
              CameraUpdate.newLatLngBounds(bounds, 50),
            );
          },
          polylines: {},
        ),
      ),
    );
  }
}
