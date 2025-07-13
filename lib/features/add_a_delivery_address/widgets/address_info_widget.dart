import 'package:dazaha_app/core/constant/exports_libraries.dart';
import 'package:dazaha_app/core/constant/exports_widgets.dart';
import 'package:dazaha_app/features/auth/register/widgets/cus_register_info_widget.dart';
import 'package:dazaha_app/features/add_a_delivery_address/widgets/loc_map_Widget.dart';
import 'package:dazaha_app/features/add_a_delivery_address/widgets/phone_number_widget.dart';

Widget AddressInfoWidget(BuildContext context) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      CusRegisterInfoWidget(
        context,
        titleText: context.placeName,
        titleTextColor: context.colorsCustom.TextPrimary,
        HintText: context.exampleWorkHome,
        maxLength: null,
        maxLines: null,
      ),
      CusRegisterInfoWidget(
        context,
        titleText: context.city,
        titleTextColor: context.colorsCustom.TextPrimary,
        HintText: context.selectCity,
        maxLength: null,
        maxLines: null,
      ),
      CusRegisterInfoWidget(
        context,
        titleText: context.neighborhood,
        titleTextColor: context.colorsCustom.TextPrimary,
        HintText: context.selectNeighborhood,
        maxLength: null,
        maxLines: null,
      ),
      CusRegisterInfoWidget(
        context,
        titleText: context.street,
        titleTextColor: context.colorsCustom.TextPrimary,
        HintText: context.enterStreetName,
        maxLength: null,
        maxLines: null,
      ),
      PhoneNumberWidget(context),
      LocMapWidget(context),
    ],
  );
}
