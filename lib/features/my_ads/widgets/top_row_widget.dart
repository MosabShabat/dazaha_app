import '../../../../core/constant/exports_libraries.dart';
import '../../../../core/constant/exports_widgets.dart';
import '../../../../core/widgets/latest_announcements_widget.dart';
import '../../../../features/my_ads/widgets/filtering_bottom_sheet_widget.dart';
import '../../wallet/widgets/wallet_filter_widget.dart';

Widget TopRowWidget(
  BuildContext context, {
  required title,
  required size,
  required style,
  fontWeight,
  required List<String> GridList,
  required subTitle,
  required RxInt selectedIndex,
  required Function(int) onTapSel,
  required VoidCallback onPress,
  required VoidCallback onTep,
  required isWallet,
}) {
  return LatestAnnouncementsRowWidget(
    context,
    text: title,
    size: size,
    fontFamily: style,
    fontWeight: fontWeight,
    onPressed: () {
      isWallet
          ? WalletFilterWidget(
              context,
              onPress: onPress,
              onTep: onTep,
              subTitle: subTitle,
            )
          : FilteringBottomSheetWidget(
              context,
              gridList: GridList,
              subTitle: subTitle,
              selectedIndex: selectedIndex,
              onTapSel: onTapSel,
              onPress: onPress,
              onTep: onTep,
            );
    },
    Widget: SvgPicture.asset(AppAssets.svgs.filter_icon),
  );
}
