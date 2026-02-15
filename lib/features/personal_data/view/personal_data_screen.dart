import '../../../../core/constant/exports_libraries.dart';
import '../../../../core/constant/exports_widgets.dart';
import '../../../../core/widgets/def_app_bar_widget.dart';
import '../../../../core/widgets/general_screen_widget.dart';
import '../../../../features/auth/register/widgets/check_box_list_tail_widget.dart';
import '../../../../features/personal_data/widgets/camera_in_put_data_widget.dart';
import '../../../../features/personal_data/widgets/plate_number_widget.dart';
import '../../../../features/user_info/widgets/profile_image_widget.dart';
import '../../../../features/user_info/widgets/profile_info_edit_widget.dart';
import '../../../core/widgets/app_loading_button.dart';
import '../../profile/controller/profile_controller.dart';
import '../../user_info/controller/user_info_controller.dart';
import '../controller/personal_data_controller.dart';

class PersonalDataScreen extends StatefulWidget {
  const PersonalDataScreen({super.key});

  @override
  State<PersonalDataScreen> createState() => _PersonalDataScreenState();
}

class _PersonalDataScreenState extends State<PersonalDataScreen> {
  final _profileController = Get.find<ProfileController>();
  final _personalDataController = Get.put(PersonalDataController());
  final _userInfoController = Get.put(UserInfoController());

  late Worker _worker;
  bool _initialized = false;

  @override
  void initState() {
    super.initState();

    // 👇 مراقبة بيانات المستخدم من ProfileController
    _worker = ever(_profileController.userData, (user) {
      if (!_initialized && user != null) {
        _initializeUserData(user);
        _initialized = true;
      }
    });
  }

  @override
  void dispose() {
    _worker.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefAppBarWidget(context),
      body: Obx(() {
        if (_profileController.isUserDataLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        final user = _profileController.userData.value;
        if (user == null) {
          return Center(child: Text("حدث خطأ أثناء تحميل البيانات"));
        }

        return GeneralScreenWidget(
          context,
          wid: [
            _buildTitle(context),
            verticalSpace(20.h),
            ProfileImageWidget(
              context,
              image: user.image ?? '',
              controller: _personalDataController,
            ),
            verticalSpace(20.h),
            ProfileInfoEditWidget(
              context,
              isShow: false,
              firstName: '',
              lastName: '',
              mobileNumber: _formatPhoneNumber(
                '${user.mobileNumber ?? ''}${user.mobilePrefix ?? ''}+',
              ),
              firstNameController: _personalDataController.firstNameController,
              lastNameController: _personalDataController.lastNameController,
              doneController: _personalDataController.doneController,
            ),
            verticalSpace(20.h),
            PlateNumberWidget(
              context,
              plateController: _personalDataController.plateController,
              doneController: _personalDataController.doneController,
            ),
            CameraInPutDataIdImageWidget(
              context,
              title: context.iDOrResidencyPhoto,
              controller: _personalDataController,
            ),
            verticalSpace(20.h),
            CameraInPutDataVehicleImageWidget(
              context,
              title: context.APictureOfTheVehicle,
              controller: _personalDataController,
            ),
            verticalSpace(10.h),
            CheckBoxListTailWidget(context),
            verticalSpace(20.h),
            Obx(
              () => AppLoadingButton(
                text: context.send,
                onPressed: () async =>
                    await _personalDataController.validateAndSubmit(context),
                isLoading: _personalDataController.isButtonPressed.value,
                isEnabled: !_personalDataController.isButtonPressed.value,
                isWhiteProgress: true,
              ),
            ),
            verticalSpace(20.h),
          ],
        );
      }),
    );
  }

  void _initializeUserData(user) {
    _userInfoController
      ..setSelectedImage(user.image ?? '')
      ..firstNameController.text = user.firstName ?? ''
      ..lastNameController.text = user.lastName ?? ''
      // ..emailController.text = user.email ?? ''
      ;
  }

  Widget _buildTitle(BuildContext context) => Text(
    context.joinAsCap,
    style: context.textStyles.bodyLarge.bold.copyWith(
      color: context.colorsCustom.TextPrimary,
      fontSize: 20.sp,
    ),
  );

  String _formatPhoneNumber(String phone) {
    phone = phone.replaceAll(' ', '');
    return phone
        .replaceAllMapped(RegExp(r".{1,3}"), (match) => "${match.group(0)} ")
        .trim();
  }
}
