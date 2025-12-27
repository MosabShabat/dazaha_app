import 'dart:io';
import 'package:camera/camera.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';
import '../../../core/constant/exports_libraries.dart';
import '../../../core/constant/exports_widgets.dart';
import '../controller/choose_the_service_controller.dart';
import '../controller/order_data_controller.dart';

class CustomCameraScreen extends StatefulWidget {
  final String page;
  final Map<String, dynamic> arguments;

  const CustomCameraScreen({
    super.key,
    required this.page,
    required this.arguments,
  });

  @override
  State<CustomCameraScreen> createState() => _CustomCameraScreenState();
}

class _CustomCameraScreenState extends State<CustomCameraScreen> {
  CameraController? _cameraController;
  List<CameraDescription> _cameras = [];
  bool _isFlashOn = false;
  bool _isLoading = true;
  List<File> _capturedImages = [];

  final ChooseTheServiceController chooseController =
      Get.find<ChooseTheServiceController>();
  final OrderDataController orderDataController =
      Get.find<OrderDataController>();

  @override
  void initState() {
    super.initState();
    _initCamera();
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.black, // خلفية الشريط
        statusBarIconBrightness: Brightness.light, // أيقونات بيضاء
        statusBarBrightness: Brightness.dark, // iOS
      ),
    );
  }

  Future<void> _initCamera() async {
    _cameras = await availableCameras();
    _cameraController = CameraController(
      _cameras.first,
      ResolutionPreset.high,
      enableAudio: false,
    );

    await _cameraController!.initialize();
    setState(() => _isLoading = false);
  }

  Future<void> _toggleFlash() async {
    if (_cameraController == null) return;
    _isFlashOn = !_isFlashOn;
    await _cameraController!.setFlashMode(
      _isFlashOn ? FlashMode.torch : FlashMode.off,
    );
    setState(() {});
  }

  Future<void> _takePhoto() async {
    if (_cameraController == null || !_cameraController!.value.isInitialized)
      return;

    final image = await _cameraController!.takePicture();
    final dir = await getTemporaryDirectory();
    final newImage = await File(
      image.path,
    ).copy(path.join(dir.path, '${DateTime.now()}.jpg'));

    setState(() {
      _capturedImages.add(newImage);
    });
  }

  Future<void> _pickFromGallery() async {
    final picker = ImagePicker();
    final images = await picker.pickMultiImage(imageQuality: 80);
    if (images.isEmpty) return;

    setState(() {
      _capturedImages.addAll(images.map((x) => File(x.path)));
    });
  }

  void _removeImage(int index) {
    setState(() {
      _capturedImages.removeAt(index);
    });
  }

  void _onContinue() {
    if (_capturedImages.isEmpty) {
      chooseController.showToast(
        context,
        "الرجاء التقاط صورة واحدة على الأقل",
        Colors.red,
      );
      return;
    }

    // تحويل الصور إلى XFile وإرسالها إلى OrderDataController
    final xFilesList = _capturedImages.map((f) => XFile(f.path)).toList();
    orderDataController.setImages(xFilesList);

    // chooseController.showToast(
    //   context,
    //   "تم حفظ الصور بنجاح",
    //   context.colorsCustom.TealGreenSecondary,
    // );

    // العودة ثم الانتقال للصفحة المطلوبة
    Get.toNamed(widget.page, arguments: widget.arguments);
  }

  @override
  void dispose() {
    _cameraController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return const Scaffold(
        backgroundColor: Colors.black,
        body: Center(child: CircularProgressIndicator(color: Colors.white)),
      );
    }

    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          // 👁️ عرض مباشر من الكاميرا
          CameraPreview(_cameraController!),

          Container(
            height: 100.h,
            width: double.infinity,
            color: Colors.black, // اللون الأسود كامل
            child: Stack(
              children: [
                Positioned(
                  top:
                      MediaQuery.of(context).padding.top +
                      10, // يضيف مساحة الـ status bar
                  right: 20,
                  child: IconButton(
                    icon: const Icon(
                      Icons.close,
                      color: Colors.white,
                      size: 28,
                    ),
                    onPressed: () => Get.back(),
                  ),
                ),
                Positioned(
                  top:
                      MediaQuery.of(context).padding.top +
                      20, // يضيف مساحة الـ status bar
                  right: Width / 4,
                  left: Width / 4,
                  child: Text(
                    context.takePicturesOfTheObjects,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: context.colorsCustom.surfacePrimaryWhite,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Positioned(
                  top: MediaQuery.of(context).padding.top + 10,
                  left: 20,
                  child: Container(
                    width: 40.w,
                    height: 40.w,
                    decoration: BoxDecoration(
                      color: context.colorsCustom.surfacePrimaryBlack,
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: context.colorsCustom.surfacePrimaryWhite,
                        width: 2,
                      ),
                    ),
                    child: Center(
                      child: IconButton(
                        icon: Icon(
                          _isFlashOn ? Icons.flash_on : Icons.flash_off,
                          color: Colors.white,
                          size: 25.sp,
                        ),
                        onPressed: _toggleFlash,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          // 👇 شريط التحكم السفلي
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              color: Colors.black.withOpacity(0.7),
              padding: const EdgeInsets.only(top: 8, bottom: 10),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // 🖼️ عرض الصور الملتقطة
                  SizedBox(
                    height: 70.h,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: _capturedImages.length,
                      itemBuilder: (context, index) {
                        return Stack(
                          children: [
                            Container(
                              margin: const EdgeInsets.symmetric(horizontal: 6),
                              width: 70.h,
                              height: 70.h,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                image: DecorationImage(
                                  image: FileImage(_capturedImages[index]),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Positioned(
                              top: 2,
                              right: 8,
                              child: GestureDetector(
                                onTap: () => _removeImage(index),
                                child: Container(
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.black54,
                                    border: Border.fromBorderSide(
                                      BorderSide(color: Colors.white, width: 1),
                                    ),
                                  ),
                                  child: Icon(
                                    Icons.close,
                                    size: 10.sp,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                  verticalSpace(20.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      horizontalSpace(40.w),
                      GestureDetector(
                        onTap: _takePhoto,
                        child: Container(
                          margin: const EdgeInsets.symmetric(horizontal: 10),
                          width: 75,
                          height: 75,
                          decoration: BoxDecoration(
                            color: context.colorsCustom.surfacePrimaryBlack,
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: context.colorsCustom.surfacePrimaryWhite,
                              width: 3,
                            ),
                          ),
                          child: Container(
                            margin: const EdgeInsets.symmetric(horizontal: 5),
                            width: 70,
                            height: 70,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: context.colorsCustom.surfacePrimaryWhite,
                                width: 3,
                              ),
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: _pickFromGallery,
                        child: Container(
                          margin: const EdgeInsets.symmetric(horizontal: 10),
                          width: 42.w,
                          height: 42.w,

                          child: SvgPicture.asset(
                            AppAssets.svgs.gallery_icon,
                            color: context.colorsCustom.surfacePrimaryWhite,
                          ),
                        ),
                      ),
                    ],
                  ),

                  verticalSpace(20.h),
                  // ✅ زر المتابعة
                  SafeArea(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              context.colorsCustom.TealGreenSecondary,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          minimumSize: const Size(double.infinity, 50),
                        ),
                        onPressed: _onContinue,
                        child: Text(
                          context.continuation,
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
