import '../../../../core/constant/exports_libraries.dart';
import '../../../../core/constant/exports_widgets.dart';
import '../../../../core/widgets/app_loading_button.dart';
import '../../../../core/widgets/general_screen_widget.dart';
import '../../../../features/profile/controller/profile_controller.dart';
import '../../../../features/user_info/controller/user_info_controller.dart';
import '../../../../features/user_info/widgets/profile_image_widget.dart';
import '../../../../features/user_info/widgets/profile_info_edit_widget.dart';
import '../../../../features/user_info/widgets/user_info_app_bar_widget.dart';
import '../../../core/widgets/progress_view_white.dart';

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
          return Center(child: ProgressViewWhite(context, false));
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
              mobileNumber: _formatPhoneNumber('${user.mobileNumber ?? ''}'),
              firstNameController: _userInfoController.firstNameController,
              lastNameController: _userInfoController.lastNameController,
              emailController: _userInfoController.emailController,
              doneController: _userInfoController.doneController,
            ),
            verticalSpace(80.h),
            Obx(
              () => AppLoadingButton(
                text: context.saveChanges,
                isLoading: _userInfoController.isButtonPressed.value,
                isEnabled: !_userInfoController.isButtonPressed.value,
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
    phone = phone.replaceAll(' ', '').trim();
    if (phone.isEmpty) return '';

    final buffer = StringBuffer();
    for (int i = 0; i < phone.length; i++) {
      buffer.write(phone[i]);
      // أول رقم مفصول ثم بعد كل 3 أرقام نضيف مسافة
      if (i == 0 || (i > 0 && (i - 0) % 3 == 0 && i + 1 != phone.length)) {
        buffer.write(' ');
      }
    }
    return buffer.toString().trim();
  }
}
