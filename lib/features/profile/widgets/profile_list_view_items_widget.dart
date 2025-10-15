import '../../../core/helpers/constants.dart';
import '../../../core/constant/exports_widgets.dart';
import '../../../core/constant/exports_libraries.dart';
import '../../../core/widgets/custom_divider_widget.dart';
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
        final result = await Get.toNamed(Routes.userInfoScreen);
        if (result == true) profileController.fetchUserData();
      },
      'title': () => profileController.userData.value?.name ?? '',
    },
    {
      'icon': ListProfileIcons[1],
      'onTap': () => Get.toNamed(Routes.walletScreen),
      'title': () => context.wallet,
    },
    {
      'icon': ListProfileIcons[2],
      'onTap': () => Get.toNamed(Routes.savedDeliveryAddressesScreen),
      'title': () => context.deliveryAddresses,
    },
    {
      'icon': ListProfileIcons[3],
      'onTap': () => Get.toNamed(
        Routes.weAreHereToHelpScreen,
        arguments: {
          AppConstants.userName: profileController.userData.value?.name ?? '',
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
      'onTap': () => profileController.logout(),
      'title': () => context.logOut,
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
            ),
          ),
        );
      },
    ),
  );
}
