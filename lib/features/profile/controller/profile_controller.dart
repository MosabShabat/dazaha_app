import 'dart:ui';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:get/get.dart';
import '../../../core/helpers/app_shared_data.dart';
import '../../../core/helpers/app_shared_methods.dart';
import '../../../core/helpers/constants.dart';
import '../../../core/network/models/auth/user_data.dart';
import '../../../core/network/utils/api_result.dart';
import '../../../core/network/utils/dio_factory.dart';
import '../../../core/widgets/app_snackbar.dart';
import '../../../core/routes/routes.dart';
import 'profile_repo.dart';

class ProfileController extends GetxController {
  final ProfileRepo _profileRepo = Get.find<ProfileRepo>();

  RxBool radioValue = AppSharedMethods.isAppLanguageArabic().obs;
  RxBool isLoading = false.obs;
  RxBool isUserDataLoading = true.obs;
  Rxn<UserData> userData = Rxn<UserData>();
  RxBool isOffline = false.obs;

  @override
  void onInit() {
    super.onInit();
    _listenConnection();
    fetchUserData();
  }

  /// تحميل بيانات المستخدم
  void fetchUserData() async {
    isLoading.value = true;
    final result = await _profileRepo.profile();

    result.when(
      success: (response) {
        isUserDataLoading.value = false;
        isLoading.value = false;

        if (response.status == true && response.data != null) {
          userData.value = UserData.fromJson(response.data);
        } else if (response.errors != null) {
          showSnackbarErrorApi(Get.context!, response.errors!, null);
        } else {
          showErrorSnackbar(Get.context!, response.message ?? '', );
        }
      },
      failure: (error) {
        isUserDataLoading.value = false;
        isLoading.value = false;
        showSnackbarErrorApi(Get.context!, [error], null);
      },
    );
  }

  /// تغيير اللغة
  void setLanguage(bool isArabic) async {
    radioValue.value = isArabic;
    final newLocale = isArabic ? const Locale('ar') : const Locale('en');
    EasyLocalization.of(Get.context!)?.setLocale(newLocale);
    Get.updateLocale(newLocale);
    await DioFactory.addDioHeaders();
  }

  /// تسجيل الخروج
  void logout() async {
    isLoading.value = true;
    final fcmToken = await AppSharedData.getSecuredString(
      AppSharedKeys.fcmTokenKey,
    );
    final result = await _profileRepo.logout(fcmToken);

    result.when(
      success: (response) async {
        isLoading.value = false;
        if (response.status == true) {
          await _clearUserData();
          Get.offAllNamed(
            Routes.loginScreen,
            arguments: {AppConstants.resatAll: true},
          );
        } else {
          showErrorSnackbar(Get.context!, response.message ?? '', );
        }
      },
      failure: (error) {
        isLoading.value = false;
        showSnackbarErrorApi(Get.context!, [error], null);
      },
    );
  }

  /// مسح جميع بيانات المستخدم
  Future<void> _clearUserData() async {
    await AppSharedData.clearAllData();
    await AppSharedData.clearAllSecuredData();
    await AppSharedData.setUserLogin(false);
    await AppSharedData.setOpenBefore(true);
  }

  /// الاستماع لتغير حالة الاتصال
  void _listenConnection() {
    Connectivity().onConnectivityChanged.listen((result) {
      isOffline.value = result == ConnectivityResult.none;
    });
  }
}
