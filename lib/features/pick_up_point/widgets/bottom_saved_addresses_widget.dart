import 'package:dazaha_app/core/constant/exports_libraries.dart';
import 'package:dazaha_app/core/constant/exports_widgets.dart';
import 'package:dazaha_app/core/widgets/add_addresses_widget.dart';
import 'package:dazaha_app/core/widgets/latest_announcements_widget.dart';
import 'package:dazaha_app/features/pick_up_point/widgets/pick_up_point_list_view_widget.dart';

Widget BottomSavedAddressesWidget(BuildContext context, {required GetScreen}) {
  return Column(
    children: [
      LatestAnnouncementsRowWidget(
        context,
        text: context.savedAddresses,
        onPressed: () {},
        Widget: AddAddressesWidget(
          context,
          isBlack: false,
          onTap: () {
            Get.toNamed(Routes.addADeliveryAddressScreen);
          },
        ),
      ),
      PickUpPointListViewWidget(context, onTap: GetScreen),
    ],
  );
}
