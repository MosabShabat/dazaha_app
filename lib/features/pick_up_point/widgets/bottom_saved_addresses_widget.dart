import 'package:dazaha_app/core/constant/exports_libraries.dart';
import 'package:dazaha_app/core/helpers/spacing.dart';
import 'package:dazaha_app/core/helpers/theme_exports.dart';
import 'package:dazaha_app/core/widgets/latest_announcements_widget.dart';
import 'package:dazaha_app/features/pick_up_point/widgets/pick_up_point_list_view_widget.dart';
import 'package:dazaha_app/features/add_a_delivery_address/view/add_a_delivery_address_screen.dart';

Widget BottomSavedAddressesWidget(BuildContext context, {required GetScreen}) {
  return Column(
    children: [
      LatestAnnouncementsRowWidget(
        context,
        text: context.savedAddresses,
        onPressed: () {
          Get.to(
            () => AddADeliveryAddressScreen(),
            transition: Transition.rightToLeft,
          );
          //AddADeliveryAddressScreen
        },
        Widget: Row(
          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
                  child: Icon(
                    Icons.add,
                    size: 16.w,
                    color: context.colorsCustom.surfacePrimaryWhite,
                  ),
                ).box
                .customRounded(BorderRadiusGeometry.all(Radius.circular(8).w))
                .color(context.colorsCustom.TealGreenSecondary)
                .width(20.w)
                .height(20.w)
                .make(),
            horizontalSpace(5.w),
            Text(
              context.addAddress,
              textAlign: TextAlign.center,
              maxLines: 3,
              style: context.textStyles.bodySmall.medium.copyWith(
                color: context.colorsCustom.TealGreenSecondary,
              ),
            ),
          ],
        ),
      ),
      PickUpPointListViewWidget(context, onTap: GetScreen),
    ],
  );
}
