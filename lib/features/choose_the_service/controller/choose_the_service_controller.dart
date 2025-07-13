import 'package:dazaha_app/core/constant/exports_libraries.dart';
import 'package:dazaha_app/core/constant/exports_widgets.dart';
import 'package:multiple_image_camera/camera_file.dart';
import 'package:multiple_image_camera/multiple_image_camera.dart';
import 'package:permission_handler/permission_handler.dart';

class ChooseTheServiceController extends GetxController {
  List<MediaModel> images = [];

  Future<void> openCameraWithPermission(BuildContext context) async {
    var status = await Permission.camera.request();
    if (status.isGranted) {
      images = await MultipleImageCamera.capture(context: context);
      if (images.isNotEmpty) {
        print(
          '***************************** Captured ${images.length} images. **********************************',
        );
        context.showToast(
          msg: "Not Empty",
          bgColor: context.colorsCustom.TealGreenSecondary,
          textColor: context.colorsCustom.surfacePrimaryWhite,
        );
        Get.toNamed(Routes.bookingDateScreen,);
      } else {
        print(
          '***************************** Captured ${images.length} images. and this the second line **********************************',
        );
        context.showToast(
          msg: "Empty",
          bgColor: context.colorsCustom.redColor,
          textColor: context.colorsCustom.surfacePrimaryWhite,
        );
        Get.back();
      }
    } else {
      print("Camera permission denied.");
    }
  }
}
