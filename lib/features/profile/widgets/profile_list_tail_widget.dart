import '../../../core/constant/exports_libraries.dart';
import '../../../core/constant/exports_widgets.dart';
import '../../../core/helpers/constants.dart';

Widget ProfileListTailWidget(
  int index,
  BuildContext context,
  String titleText, {
  RxBool? isLoadingLogout, // ✅ تمرير observable
}) {
  final isLast = index == ListProfileIcons.lastIndex;

  return SizedBox(
    height: 40.h,
    child: ListTile(
      contentPadding: EdgeInsets.zero,
      leading: CircleAvatar(
        radius: 20.w,
        backgroundColor: isLast
            ? context.colorsCustom.surfacePrimaryWhite
            : context.colorsCustom.CardBackgroundLightGray,
        child: SvgPicture.asset(
          ListProfileIcons[index],
          color: isLast
              ? (AppConstants.userToken.isNotEmpty &&
                        AppConstants.userToken != '' &&
                        AppConstants.userUUid.isNotEmpty &&
                        AppConstants.userUUid != '')
                    ? context.colorsCustom.redColor
                    : context.colorsCustom.TealGreenSecondary
              : context.colorsCustom.surfacePrimaryBlack,
        ),
      ),
      title: Text(
        titleText,
        style: context.textStyles.bodySmall.medium.copyWith(
          color: isLast
              ? (AppConstants.userToken.isNotEmpty &&
                        AppConstants.userToken != '' &&
                        AppConstants.userUUid.isNotEmpty &&
                        AppConstants.userUUid != '')
                    ? context.colorsCustom.redColor
                    : context.colorsCustom.TealGreenSecondary
              : context.colorsCustom.TextPrimary,
        ),
      ),
      trailing: isLast
          ? Obx(
              () => isLoadingLogout?.value == true
                  ? SizedBox(
                      width: 18.w,
                      height: 18.w,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        color: context.colorsCustom.redColor,
                      ),
                    )
                  : const SizedBox(width: 18),
            )
          : Icon(
              Icons.arrow_forward_ios,
              size: 16.w,
              color: context.colorsCustom.SecondaryElement,
            ),
    ),
  );
}
