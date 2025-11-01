import 'dart:io';
import 'package:dio/dio.dart' as dio;
import '../../../../core/constant/exports_widgets.dart';
import '../../../core/constant/exports_libraries.dart';
import '../../../core/helpers/app_shared_data.dart';
import '../../../core/network/models/auth/user_data.dart';
import '../../../core/network/utils/api_error_model.dart';
import '../../../core/network/utils/api_result.dart';
import '../../../core/network/utils/app_response.dart';
import '../../../core/widgets/app_snackbar.dart';
import '../../auth/register/controller/register_controller.dart';
import '../../profile/controller/profile_controller.dart';
import 'personal_data_repo.dart';

class PersonalDataController extends GetxController {
  final PersonalDataRepo _personalDataRepo = Get.find<PersonalDataRepo>();
  final ProfileController _profileController = Get.find<ProfileController>();
  final RegisterController _registerController = Get.find<RegisterController>();
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final plateController = TextEditingController();

  Rx<dynamic> selectedUserImage = Rx<dynamic>(null);
  Rx<dynamic> selectedIdImage = Rx<dynamic>(null);
  Rx<dynamic> selectedVehicleImage = Rx<dynamic>(null);

  RxBool isButtonPressed = false.obs;
  Rx<UserData>? accountData;

  /// Validate inputs and post data
  Future<bool> validateAndSubmit(BuildContext context) async {
    if (selectedUserImage.value == null) {
      showErrorSnackbar(
        context,
        context.enterYourProfilePicture,
        FirstColor: Colors.amber,
      );
      return false;
    }
    if (firstNameController.text.isEmpty) {
      showErrorSnackbar(context, context.firstName, FirstColor: Colors.amber);
      return false;
    }
    if (lastNameController.text.isEmpty) {
      showErrorSnackbar(context, context.lastName, FirstColor: Colors.amber);
      return false;
    }
    if (plateController.text.isEmpty) {
      showErrorSnackbar(context, context.plateNumber, FirstColor: Colors.amber);
      return false;
    }
    if (selectedIdImage.value == null) {
      showErrorSnackbar(context, context.enterIdOr, FirstColor: Colors.amber);
      return false;
    }
    if (selectedVehicleImage.value == null) {
      showErrorSnackbar(context, context.enterVanOr, FirstColor: Colors.amber);
      return false;
    }

    if (_registerController.isChecked.value == false) {
      showErrorSnackbar(
        context,
        context.termsAndConditions,
        FirstColor: Colors.amber,
      );
      return false;
    }
    await _postData();
    return true;
  }

  /// Post user data with images
  Future<void> _postData() async {
    _setButtonPressed(true);
    try {
      final userImage = await _prepareImage(selectedUserImage.value);
      final idImage = await _prepareImage(selectedIdImage.value);
      final vehicleImage = await _prepareImage(selectedVehicleImage.value);

      final result = await _personalDataRepo.joinAsDriverPost(
        firstName: firstNameController.text,
        lastName: lastNameController.text,
        plate: plateController.text,
        image: userImage,
        id_image: idImage,
        vehicle_image: vehicleImage,
      );

      _handleApiResponse(result);
    } catch (e) {
      _setButtonPressed(false);
      showErrorSnackbar(Get.context!, 'حدث خطأ أثناء معالجة الصورة: $e');
    }
  }

  /// Handle API response
  void _handleApiResponse(ApiResult<AppResponse> result) {
    result.when(
      success: (response) async {
        _setButtonPressed(false);
        if (response.status == true && response.data != null) {
          final userData = UserData.fromJson(
            response.data as Map<String, dynamic>,
          );
          accountData = userData.obs;

          await AppSharedData.setUserInfo(userData);
          _profileController.fetchUserData();
          Get.toNamed(Routes.captainMembershipRequestScreen);
        } else {
          showErrorSnackbar(
            Get.context!,
            response.message ?? '',
            FirstColor: Colors.red,
          );
        }
      },
      failure: (error) {
        _setButtonPressed(false);
        _showApiErrors([error]);
      },
    );
  }

  /// Show API errors
  void _showApiErrors(List<ApiErrorModel> errors) {
    showSnackbarErrorApi(Get.context!, errors, null);
  }

  /// Toggle button state
  void _setButtonPressed(bool value) => isButtonPressed.value = value;

  /// Prepare image file for upload
  Future<dio.MultipartFile?> _prepareImage(dynamic image) async {
    if (image == null || image is String) return null;
    if (image is File) {
      return await dio.MultipartFile.fromFile(
        image.path,
        filename: image.path.split('/').last,
      );
    }
    return null;
  }

  /// Set selected user image
  void setSelectedImage(dynamic image) {
    if (image is String && image.startsWith('http') || image is File) {
      selectedUserImage.value = image;
    }
  }

  /// Set selected ID image
  void setSelectedIdImage(dynamic image) {
    if (image is String && image.startsWith('http') || image is File) {
      selectedIdImage.value = image;
    }
  }

  /// Set selected vehicle image
  void setSelectedVehicleImage(dynamic image) {
    if (image is String && image.startsWith('http') || image is File) {
      selectedVehicleImage.value = image;
    }
  }
}
