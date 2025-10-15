import 'dart:io';
import 'package:dio/dio.dart' as dio;
import '../../../../core/constant/exports_libraries.dart';
import '../../../../core/constant/exports_widgets.dart';
import '../../../../core/network/models/auth/user_data.dart';
import '../../../../core/network/utils/api_error_model.dart';
import '../../../../core/network/utils/api_result.dart';
import '../../../../core/network/utils/app_response.dart';
import '../../../../core/widgets/app_snackbar.dart';
import '../../../core/helpers/app_shared_data.dart';
import '../../auth/register/controller/register_controller.dart';
import '../../profile/controller/profile_controller.dart';
import '../controller/user_info_repo.dart';

class UserInfoController extends GetxController {
  final UserInfoRepo _repo = Get.find<UserInfoRepo>();
  final ProfileController _profileController = Get.find<ProfileController>();

  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();

  Rx<dynamic> selectedUserImage = Rx<dynamic>(null);
  RxBool isButtonPressed = false.obs;
  Rx<UserData>? accountData;

  @override
  void onInit() {
    super.onInit();
    _loadUserInfo();
  }

  Future<void> _loadUserInfo() async {
    final data = await AppSharedData.getUserInfo();
    if (data != null) _initUserInfo(data);
  }

  void _initUserInfo(UserData userData) {
    firstNameController.text = userData.firstName ?? '';
    lastNameController.text = userData.lastName ?? '';
    emailController.text = userData.email ?? '';
    if (userData.image != null) selectedUserImage.value = userData.image;
  }

  void setSelectedImage(dynamic image) {
    if (image is String && image.startsWith('http') || image is File) {
      selectedUserImage.value = image;
    }
  }

  Future<bool> validateAndUpdate(BuildContext context) async {
    if (firstNameController.text.isEmpty) {
      showErrorSnackbar(context, context.firstName);
      return false;
    }
    if (lastNameController.text.isEmpty) {
      showErrorSnackbar(context, context.lastName);
      return false;
    }
    await _updateProfile();
    return true;
  }

  Future<void> _updateProfile() async {
    _setButtonPressed(true);
    try {
      final imageFile = selectedUserImage.value is File
          ? await dio.MultipartFile.fromFile(
              (selectedUserImage.value as File).path,
              filename: (selectedUserImage.value as File).path.split('/').last,
            )
          : null;

      final result = await _repo.updateProfile(
        userImage: imageFile,
        firstName: firstNameController.text,
        lastName: lastNameController.text,
        email: emailController.text,
      );

      _handleResponse(result);
    } catch (e) {
      _setButtonPressed(false);
      showErrorSnackbar(Get.context!, 'Error processing image: $e');
    }
  }

  void _handleResponse(ApiResult<AppResponse> result) {
    result.when(
      success: (response) async {
        _setButtonPressed(false);
        if (response.status == true && response.data != null) {
          final userData = UserData.fromJson(
            response.data as Map<String, dynamic>,
          );
          accountData = userData.obs;

          await AppSharedData.setUserInfo(userData);
          await saveUserToken(userData.token ?? '');
          _profileController.fetchUserData();

          Get.toNamed(Routes.homeScreen);
        } else {
          showErrorSnackbar(Get.context!, response.message ?? '');
        }
      },
      failure: (error) {
        _setButtonPressed(false);
        _showApiErrors([error]);
      },
    );
  }

  void _showApiErrors(List<ApiErrorModel> errors) {
    showSnackbarErrorApi(Get.context!, errors, null);
  }

  void _setButtonPressed(bool value) => isButtonPressed.value = value;
}
