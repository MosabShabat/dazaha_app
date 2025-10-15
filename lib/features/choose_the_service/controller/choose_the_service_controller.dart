import 'package:connectivity_plus/connectivity_plus.dart';
import '../../../core/network/utils/api_result.dart';
// import 'package:image_picker/image_picker.dart';
import 'package:multiple_image_camera/camera_file.dart';
// import 'package:multiple_image_camera/multiple_image_camera.dart';
// import 'package:permission_handler/permission_handler.dart';
import '../../../core/constant/exports_libraries.dart';
import '../../../core/constant/exports_widgets.dart';
import '../../../core/network/models/service/service_model.dart';
import 'choose_the_service_repo.dart';
import 'order_data_controller.dart';

class ChooseTheServiceController extends GetxController {
  final OrderDataController orderDataController = Get.find();
  var isOffline = false.obs;
  List<MediaModel> images = [];
  final ChooseTheServiceRepo _chooseTheServiceRepo =
      Get.find<ChooseTheServiceRepo>();

  Rx<ServiceModel>? serviceModel;
  RxBool isLoading = false.obs;

  //ChooseTheServiceRepo

  @override
  void onInit() {
    super.onInit();
    _listenConnection();
  }

  // Future<void> openCameraWithPermission(
  //   BuildContext context, {
  //   required String page,
  //   required Map<String, dynamic> arguments,
  // }) async {
  //   // طلب صلاحية الكاميرا
  //   if (!await Permission.camera.request().isGranted) {
  //     print("Camera permission denied.");
  //     return;
  //   }

  //   // منع فتح الكاميرا أكثر من مرة بنفس الوقت
  //   if (images.isNotEmpty) {
  //     images.clear(); // تحرير أي صور سابقة
  //   }

  //   try {
  //     // الانتظار حتى ينتهي المستخدم من التقاط الصور
  //     final capturedImages = await MultipleImageCamera.capture(
  //       context: context,
  //     );

  //     if (capturedImages.isEmpty) {
  //       showToast(context, "لم يتم التقاط صور", Colors.red);
  //       Get.back();
  //       return;
  //     }

  //     // معالجة كل صورة واحدة واحدة لتفادي buffer overflow
  //     images = [];
  //     for (var img in capturedImages) {
  //       images.add(img);
  //       await Future.delayed(
  //         const Duration(milliseconds: 50),
  //       ); // تخفيف الضغط على النظام
  //     }

  //     // تحويل إلى XFile وارسالها للـ OrderDataController
  //     final xFilesList = images.map((e) => XFile(e.file.path)).toList();
  //     orderDataController.setImages(xFilesList);

  //     showToast(
  //       context,
  //       "تم التقاط الصور",
  //       context.colorsCustom.TealGreenSecondary,
  //     );

  //     Get.back();
  //     Get.toNamed(page, arguments: arguments);
  //     print('Captured ${images.length} images.');
  //   } catch (e) {
  //     print("Camera capture error: $e");
  //     showToast(context, "فشل التقاط الصور", Colors.red);
  //   }
  // }

  // Future<void> openCameraWithPermission(
  //   BuildContext context, {
  //   required String page,
  //   required Map<String, dynamic> arguments,
  // }) async {
  //   if (await Permission.camera.request().isGranted) {
  //     images = await MultipleImageCamera.capture(context: context);

  //     if (images.isEmpty) {
  //       _showToast(context, "Empty", Colors.red);
  //       Get.back();
  //       return;
  //     }

  //     final xFilesList = images.map((e) => XFile(e.file.path)).toList();
  //     orderDataController.setImages(xFilesList);

  //     _showToast(context, "Not Empty", context.colorsCustom.TealGreenSecondary);
  //     Get.back();
  //     Get.toNamed(page, arguments: arguments);
  //     print('Captured ${images.length} images.');
  //   } else {
  //     print("Camera permission denied.");
  //   }
  // }

  void _listenConnection() {
    Connectivity().onConnectivityChanged.listen((result) {
      isOffline.value = result == ConnectivityResult.none;
    });
  }

  void showToast(BuildContext context, String msg, Color bgColor) {
    context.showToast(
      msg: msg,
      bgColor: bgColor,
      textColor: context.colorsCustom.surfacePrimaryWhite,
    );
  }

  Future<void> getIntro(String serviceUuid) async {
    _setLoading(true);
    final result = await _chooseTheServiceRepo.getIntro(
      serviceUuid: serviceUuid,
    );

    result.when(
      success: (response) {
        _setLoading(false);

        final data = response.data;
        if (data != null) {
          serviceModel = ServiceModel.fromJson(data).obs;
          update();
        }
      },
      failure: (error) {
        _setLoading(false);

        debugPrint("getIntro API Error: ${error}");
      },
    );
  }

  void _setLoading(bool value) {
    isLoading.value = value;
  }
}
