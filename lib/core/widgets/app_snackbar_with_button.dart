import '../../../../core/constant/exports_libraries.dart';
import '../../../../core/constant/exports_widgets.dart';
import '../../../../core/widgets/app_text_button.dart';
import '../helpers/constants.dart';

void showSnackbarWithButton(
  BuildContext context,
  String title,
  String type, {
  bool showButton = true,
  bool showTextEnd = false,
  Duration duration = const Duration(seconds: 2),
}) {
  final snackBar = SnackBar(
    content: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SvgPicture.asset(
          type == AppConstants.success
              ? AppAssets.svgs.icSuccessCircal
              : AppAssets.svgs.icError,
        ),
        horizontalSpace(6),
        Expanded(
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Text(
              title,
              style: TextStyle(
                fontSize: 12.sp,
                fontWeight: FontWeight.w700,
                color: context.colorsCustom.TextPrimary,
                fontFamily: 'sans',
              ),
              overflow: TextOverflow.visible,
            ),
          ),
        ),
        if (showButton)
          // AppTextButton(
          //   context,
          //   buttonWidth: 92,
          //   buttonHeight: 51,
          //   buttonText: context.showCart,
          //   backgroundColor: context.colorsCustom.TextPrimary,
          //   textStyle: AppTextStyles.font12White500Medium,
          //   onPressed: () => _onShowCartPressed(),
          // ),
        if (showTextEnd)
          AppTextButton(
            context,
            buttonWidth: 92,
            buttonHeight: 51,
            buttonText: context.myOffers,
            backgroundColor:context.colorsCustom.ButtonLabelPrimary,
            // textStyle: AppTextStyles.font12White500Medium.copyWith(
            //   color: context.colorsCustom.TealGreenSecondary,
            // ),
            onPressed: () {
              // go to my offers latter
              // Get.toNamed(Routes.chefMyOffersScreen);
            },
          ),
      ],
    ),
    backgroundColor: Colors.white,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(8.0)),
    ),
    behavior: SnackBarBehavior.floating,
    duration: duration,
  );

  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}

// void _onShowCartPressed() {
//   if (Get.currentRoute == Routes.homeScreen) {
//     final NavigationController mainController =
//         Get.find<NavigationController>();
//     if (mainController.selectedIndex.value != 1) {
//       mainController.changeTabIndex(1);
//     }
//   } else {
//     Get.offAllNamed(
//       Routes.homeScreen,
//       // arguments: {'tabIndex': 1},
//     );
//   }
// }
