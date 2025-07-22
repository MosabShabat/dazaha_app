import 'package:dazaha_app/core/constant/exports_libraries.dart';
import 'package:dazaha_app/core/constant/exports_widgets.dart';
import 'package:dazaha_app/core/widgets/list_tale_circle_avatar_widget.dart';
import 'package:dazaha_app/features/select_store_name/widgets/snack_bar_widget.dart';

Widget DeleteWidget(BuildContext context) {
  return Positioned(
    left: Localizations.localeOf(context).languageCode == "ar" ? -3.0.w : null,
    right: Localizations.localeOf(context).languageCode != "ar" ? -3.0.w : null,
    child: GestureDetector(
      onTap: () {
        showModalBottomSheet(
          context: context,
          isScrollControlled: false,
          backgroundColor: Colors.transparent,
          builder: (context) {
            // Start the delayed close
            Future.delayed(const Duration(seconds: 3), () {
              if (Navigator.of(context).canPop()) {
                Navigator.of(context).pop();
              }
            });
            return deleteConfirmationBottomSheet(
              context,
              buttonText: context.toRetreat,
              isShow: true,
              onTap: () {},
              title: context.deletedSuccessfully,
              isShowRow: true
            );
          },
        );
      },
      child: CircleAvatar(
        backgroundColor: context.colorsCustom.surfacePrimaryWhite,
        radius: 15.w,
        child: IconCircleAvatarWidget(
          backGroundColor: context.colorsCustom.redColor,
          sizeCircleAvatar: 12.w,
          icon: Icons.remove,
          sizIcon: 25.w,
          colorIcon: context.colorsCustom.surfacePrimaryWhite,
        ),
      ),
    ),
  );
}
