import 'package:dazaha_app/core/constant/exports_libraries.dart';
import 'package:dazaha_app/core/constant/exports_widgets.dart';
import 'package:dazaha_app/core/widgets/custom_divider_widget.dart';
import 'package:dazaha_app/features/profile/widgets/lang_bottom_sheet_widget.dart';
import 'package:dazaha_app/features/profile/widgets/profile_list_tail_widget.dart';

Widget ProfileListViewItemsWidget(BuildContext context) {
  var titleText = [
    'Mohammed Issa',
    context.wallet,
    context.theLanguage,
    context.deliveryAddresses,
    context.help,
    context.aboutTheApp,
    context.settings,
    context.logOut,
  ];
  return SizedBox(
    height: 420.h,
    child: ListView.builder(
      shrinkWrap: true,
      itemCount: ListProfileIcons.length,
      physics: BouncingScrollPhysics(),
      itemBuilder: (context, index) {
        return Column(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 16.w, right: 16.w, bottom: 20.h),
              child: GestureDetector(
                onTap: () {
                  if (index == 0) {
                    Get.toNamed(Routes.userInfoScreen);
                  }
                  if (index == 1) {
                    Get.toNamed(Routes.walletScreen);
                  }
                  if (index == 2) {
                    LangBottomSheetWidget(context);
                  }
                  if (index == 3) {
                    Get.toNamed(Routes.savedDeliveryAddressesScreen);
                  }
                  if (index == 4) {
                    Get.toNamed(Routes.weAreHereToHelpScreen);
                  }
                  if (index == 5) {
                    Get.toNamed(Routes.aboutTheApplicationScreen);
                  }
                  if (index == 6) {}
                  if (index == 7) {}
                },
                child: ProfileListTailWidget(index, context, titleText),
              ),
            ),
            index == ListProfileIcons.lastIndex
                ? Container()
                : CustomDividerWidget(context),
          ],
        );
      },
    ),
  );
}
