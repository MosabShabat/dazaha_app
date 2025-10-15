import 'package:image_picker/image_picker.dart';
import 'package:dio/dio.dart' as dio;
import '../../../core/constant/exports_widgets.dart';
import '../../../core/constant/exports_libraries.dart';
import '../../../core/helpers/constants.dart';
import '../../../core/network/utils/api_result.dart';
import '../../../core/network/utils/app_response.dart';
import '../../../core/widgets/app_snackbar.dart';
import '../../../core/widgets/app_snackbar_with_button.dart';
import 'report_problem_repo.dart';

class ReportAProblemController extends GetxController {
  final ReportProblemRepo _repo = Get.find<ReportProblemRepo>();

  RxBool isButtonPressed = false.obs;
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  final listImages = <XFile>[].obs;
  final ImagePicker _picker = ImagePicker();

  /// اختيار الصور
  Future<void> pickImages(ImageSource source) async {
    FocusScope.of(Get.context!).unfocus();
    try {
      final images = source == ImageSource.camera
          ? (await _picker.pickImage(source: source))?.let((e) => [e]) ?? []
          : await _picker.pickMultiImage();
      if (images.isNotEmpty) listImages.addAll(images);
    } catch (e) {
      print("Error picking images: $e");
    }
  }

  void removeImage(int index) => listImages.removeAt(index);

  /// التحقق من صحة البيانات وإرسال التقرير
  void validateAndSubmit(String referenceType, String referenceUuid) {
    if (titleController.text.isEmpty) {
      showErrorSnackbar(Get.context!, Get.context!.enterTitle);
      return;
    }
    if (descriptionController.text.isEmpty) {
      showErrorSnackbar(Get.context!, Get.context!.enterDescriptionProblem);
      return;
    }
    _submitReport(referenceType, referenceUuid);
  }

  Future<void> _submitReport(String referenceType, String referenceUuid) async {
    _setButtonPressed(true);
    try {
      final images = await Future.wait(
        listImages.map(
          (image) =>
              dio.MultipartFile.fromFile(image.path, filename: image.name),
        ),
      );
      final result = await _repo.reportProblem(
        title: titleController.text,
        description: descriptionController.text,
        referenceType: referenceType,
        referenceUuid: referenceUuid,
        images: images,
      );
      _handleResponse(result);
    } catch (e) {
      _setButtonPressed(false);
      showErrorSnackbar(Get.context!, 'حدث خطأ أثناء معالجة الصورة: $e');
    }
  }

  void _handleResponse(ApiResult<AppResponse> result) {
    result.when(
      success: (response) {
        _setButtonPressed(false);
        if (response.status == true) {
          showSnackbarWithButton(
            Get.context!,
            Get.context!.successProblem,
            AppConstants.success,
            showButton: false,
          );
          Get.toNamed(Routes.reportReviewDetailsScreen);
        } else {
          showErrorSnackbar(Get.context!, response.message ?? '');
        }
      },
      failure: (error) {
        _setButtonPressed(false);
        showSnackbarErrorApi(Get.context!, [error], null);
      },
    );
  }

  void _setButtonPressed(bool value) => isButtonPressed.value = value;
}

extension Let<T> on T {
  R let<R>(R Function(T it) op) => op(this);
}
