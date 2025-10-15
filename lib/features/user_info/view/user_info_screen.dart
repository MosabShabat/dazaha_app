import '../../../../core/constant/exports_libraries.dart';
import '../../../../core/constant/exports_widgets.dart';
import '../../../../core/widgets/app_loading_button.dart';
import '../../../../core/widgets/general_screen_widget.dart';
import '../../../../features/profile/controller/profile_controller.dart';
import '../../../../features/user_info/controller/user_info_controller.dart';
import '../../../../features/user_info/widgets/profile_image_widget.dart';
import '../../../../features/user_info/widgets/profile_info_edit_widget.dart';
import '../../../../features/user_info/widgets/user_info_app_bar_widget.dart';

class UserInfoScreen extends StatelessWidget {
  UserInfoScreen({super.key});

  final _profileController = Get.find<ProfileController>();
  final _userInfoController = Get.put(UserInfoController());

  @override
  Widget build(BuildContext context) {
    // Initialize user info after the first frame
    WidgetsBinding.instance.addPostFrameCallback((_) => _initUserData());

    return Scaffold(
      backgroundColor: context.colorsCustom.surfacePrimaryWhite,
      appBar: UserInfoAppBarWidget(
        Height: Width * 0.25,
        context,
        widget: Text(
          context.personalInformation,
          style: context.textStyles.bodyLarge.bold.copyWith(
            color: context.colorsCustom.TextPrimary,
            fontSize: 20.sp,
          ),
        ),
      ),
      body: Obx(() {
        if (_profileController.isUserDataLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        final user = _profileController.userData.value;
        if (user == null) {
          return Center(child: Text(context.dataEmpty));
        }

        return GeneralScreenWidget(
          context,
          wid: [
            ProfileImageWidget(
              context,
              image: user.image ?? '',
              controller: _userInfoController,
            ),
            verticalSpace(20.h),
            ProfileInfoEditWidget(
              context,
              isShow: true,
              firstName: user.firstName ?? '',
              lastName: user.lastName ?? '',
              email: user.email ?? '',
              mobileNumber: _formatPhoneNumber(
                '${user.mobileNumber ?? ''}${user.mobilePrefix ?? ''}+',
              ),
              firstNameController: _userInfoController.firstNameController,
              lastNameController: _userInfoController.lastNameController,
              emailController: _userInfoController.emailController,
            ),
            verticalSpace(80.h),
            Obx(
              () => AppLoadingButton(
                text: context.saveChanges,
                isLoading: _userInfoController.isButtonPressed.value,
                isWhiteProgress: true,
                onPressed: () async {
                  if (await _userInfoController.validateAndUpdate(context)) {
                    Get.back(result: true);
                  }
                },
              ),
            ),
          ],
        );
      }),
    );
  }

  void _initUserData() {
    final user = _profileController.userData.value;
    if (user != null) {
      _userInfoController
        ..setSelectedImage(user.image ?? '')
        ..firstNameController.text = user.firstName ?? ''
        ..lastNameController.text = user.lastName ?? ''
        ..emailController.text = user.email ?? '';
    }
  }

  String _formatPhoneNumber(String phone) {
    return phone
        .replaceAll(' ', '')
        .replaceAllMapped(RegExp(r".{1,3}"), (match) => "${match.group(0)} ")
        .trim();
  }
}
