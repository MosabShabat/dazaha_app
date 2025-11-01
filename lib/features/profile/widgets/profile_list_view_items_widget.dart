import '../../../core/helpers/constants.dart';
import '../../../core/constant/exports_widgets.dart';
import '../../../core/constant/exports_libraries.dart';
import '../../../core/widgets/custom_divider_widget.dart';
import '../../../core/widgets/login_required_bottom_sheet/view/login_required_bottom_sheet.dart';
import '../controller/profile_controller.dart';
import 'profile_list_tail_widget.dart';

Widget ProfileListViewItemsWidget(
  BuildContext context, {
  required ProfileController profileController,
}) {
  final items = [
    {
      'icon': ListProfileIcons[0],
      'onTap': () async {
        if (AppConstants.userToken.isNotEmpty &&
            AppConstants.userToken != '' &&
            AppConstants.userUUid.isNotEmpty &&
            AppConstants.userUUid != '') {
          final result = await Get.toNamed(Routes.userInfoScreen);
          if (result == true) profileController.fetchUserData();
        } else {
          showLoginRequiredBottomSheet(Get.context!);
        }
      },
      'title': () =>
          (profileController.userData.value?.name?.trim().isEmpty ?? true)
          ? '${context.welcome}'
          : profileController.userData.value!.name!,
    },
    {
      'icon': ListProfileIcons[1],
      'onTap': () {
        if (AppConstants.userToken.isNotEmpty &&
            AppConstants.userToken != '' &&
            AppConstants.userUUid.isNotEmpty &&
            AppConstants.userUUid != '') {
          Get.toNamed(Routes.walletScreen);
        } else {
          showLoginRequiredBottomSheet(Get.context!);
        }
      },

      'title': () => AppConstants.isDriver == '1'
          ? context.dividendPortfolio
          : context.wallet,
    },
    {
      'icon': ListProfileIcons[2],
      'onTap': () {
        if (AppConstants.userToken.isNotEmpty &&
            AppConstants.userToken != '' &&
            AppConstants.userUUid.isNotEmpty &&
            AppConstants.userUUid != '') {
          Get.toNamed(Routes.savedDeliveryAddressesScreen);
        } else {
          showLoginRequiredBottomSheet(Get.context!);
        }
      },
      //() => Get.toNamed(Routes.savedDeliveryAddressesScreen),
      'title': () => context.deliveryAddresses,
    },
    {
      'icon': ListProfileIcons[3],
      'onTap': () => Get.toNamed(
        Routes.weAreHereToHelpScreen,
        arguments: {
          AppConstants.userName:
              (profileController.userData.value?.name?.trim().isEmpty ?? true)
              ? '${context.welcome}'
              : profileController.userData.value!.name!,
        },
      ),
      'title': () => context.help,
    },
    {
      'icon': ListProfileIcons[4],
      'onTap': () => Get.toNamed(Routes.aboutTheApplicationScreen),
      'title': () => context.aboutTheApp,
    },
    {
      'icon': ListProfileIcons[5],
      'onTap': () => Get.toNamed(Routes.settingsScreen),
      'title': () => context.settings,
    },
    {
      'icon': ListProfileIcons[6],

      'onTap': () {
        if (AppConstants.userToken.isNotEmpty &&
            AppConstants.userToken != '' &&
            AppConstants.userUUid.isNotEmpty &&
            AppConstants.userUUid != '') {
          profileController.logout();
        } else {
          showLoginRequiredBottomSheet(Get.context!);
        }
      },
      // 'title': () => context.logOut,
      'title': () =>
          (AppConstants.userToken.isNotEmpty &&
              AppConstants.userToken != '' &&
              AppConstants.userUUid.isNotEmpty &&
              AppConstants.userUUid != '')
          ? context.logOut
          : context.login,
    },
  ];
  return SingleChildScrollView(
    child: ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: items.length,
      separatorBuilder: (context, index) => index == items.length - 1
          ? const SizedBox.shrink()
          : CustomDividerWidget(context),
      itemBuilder: (context, index) {
        final item = items[index];
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
          child: GestureDetector(
            onTap: item['onTap'] as VoidCallback,
            child: ProfileListTailWidget(
              index,
              context,
              (item['title'] as String Function())(),
              isLoadingLogout: profileController.isLoadingLogout,
            ),
          ),
        );
      },
    ),
  );
}
