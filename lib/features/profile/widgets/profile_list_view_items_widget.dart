import '../../../core/helpers/constants.dart';
import '../../../core/constant/exports_widgets.dart';
import '../../../core/constant/exports_libraries.dart';
import '../../../core/widgets/custom_divider_widget.dart';
import '../../../core/widgets/login_required_bottom_sheet/view/login_required_bottom_sheet.dart';
import '../controller/profile_controller.dart';
import 'log_out_dialog_widget.dart';
import 'profile_list_tail_widget.dart';

Widget ProfileListViewItemsWidget(
  BuildContext context, {
  required ProfileController profileController,
}) {
  final UserStateController userStateController =
      Get.find<UserStateController>();

  final items = [
    {
      'icon': ListProfileIcons[0],
      'title': () =>
          (profileController.userData.value?.name?.trim().isEmpty ?? true)
          ? '${context.welcome}'
          : profileController.userData.value!.name!,
      'onTap': () async {
        if (AppConstants.userToken.isNotEmpty &&
            AppConstants.userUUid.isNotEmpty) {
          final result = await Get.toNamed(Routes.userInfoScreen);
          if (result == true) profileController.fetchUserData();
        } else {
          showLoginRequiredBottomSheet(Get.context!);
        }
      },
    },
    {
      'icon': ListProfileIcons[1],
      'title': () => userStateController.isDriver.value == 1
          ? context.dividendPortfolio
          : context.wallet,
      'onTap': () {
        if (AppConstants.userToken.isNotEmpty &&
            AppConstants.userUUid.isNotEmpty) {
          Get.toNamed(Routes.walletScreen);
        } else {
          showLoginRequiredBottomSheet(Get.context!);
        }
      },
      'show': true,
      //    profileController.userData.value?.walletIsVisible ?? true, // <-- هنا
    },
    {
      'icon': ListProfileIcons[2],
      'title': () => context.deliveryAddresses,
      'onTap': () {
        if (AppConstants.userToken.isNotEmpty &&
            AppConstants.userUUid.isNotEmpty) {
          Get.toNamed(Routes.savedDeliveryAddressesScreen);
        } else {
          showLoginRequiredBottomSheet(Get.context!);
        }
      },
    },
    {
      'icon': ListProfileIcons[3],
      'title': () => context.help,
      'onTap': () => Get.toNamed(
        Routes.weAreHereToHelpScreen,
        arguments: {
          AppConstants.userName:
              (profileController.userData.value?.name?.trim().isEmpty ?? true)
              ? '${context.welcome}'
              : profileController.userData.value!.name!,
        },
      ),
    },
    {
      'icon': ListProfileIcons[4],
      'title': () => context.aboutTheApp,
      'onTap': () => Get.toNamed(Routes.aboutTheApplicationScreen),
    },
    {
      'icon': ListProfileIcons[5],
      'title': () => context.settings,
      'onTap': () => Get.toNamed(Routes.settingsScreen),
    },
    {
      'icon': ListProfileIcons[6],
      'title': () =>
          (AppConstants.userToken.isNotEmpty &&
              AppConstants.userUUid.isNotEmpty)
          ? context.logOut
          : context.login,
      'onTap': () {
        if (AppConstants.userToken.isNotEmpty &&
            AppConstants.userUUid.isNotEmpty) {
          LogOutDialogWidget(context, profileController);
        } else {
          showLoginRequiredBottomSheet(Get.context!);
        }
      },
    },
  ];

  return SingleChildScrollView(
    child: ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: items.length,
      separatorBuilder: (context, index) {
        final nextItem = items[index + 1];
        if (nextItem.containsKey('show') && !(nextItem['show'] as bool)) {
          return const SizedBox.shrink();
        }
        return CustomDividerWidget(context);
      },
      itemBuilder: (context, index) {
        final item = items[index];

        // تجاهل العناصر الغير مرئية
        if (item.containsKey('show') && !(item['show'] as bool)) {
          return const SizedBox.shrink();
        }

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
