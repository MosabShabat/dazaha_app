import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import '../../../../core/constant/exports_libraries.dart';
import '../../../../core/constant/exports_widgets.dart';
import '../network/utils/api_error_model.dart';
import '../theming/app_text_styles.dart';

void showSnackbarErrorApi(
  BuildContext context,
  List<ApiErrorModel> errors,
  SnackPosition? snackPosition,
) {
  final errorMessage = errors.map((e) => e.getAllErrors()).join('\n');
  showCustomSnackbar(
    context: context,
    svgIconPath: AppAssets.svgs.info_circle_icon,
    textTitle: context.error,
    text: errorMessage,
    snackPosition: snackPosition ?? SnackPosition.TOP,
  );
}

void showCustomSnackbar({
  required BuildContext context,
  required String svgIconPath,
  required String textTitle,
  required String text,
  SnackPosition snackPosition = SnackPosition.BOTTOM,
  TextStyle? titleStyle,
  TextStyle? messageStyle,
  Color? backgroundColor,
}) {
  Get.snackbar(
    '',
    '',
    icon: Row(
      children: [
        Container(
          height: 50.h,
          margin: const EdgeInsets.only(right: 6, left: 6),
          child: VerticalDivider(
            color: Colors.red,
            radius: BorderRadius.circular(4.r),
            width: 5.w,
            thickness: 5.w,
          ),
        ),
      ],
    ),
    titleText: Row(
      children: [
        Column(
          children: [
            verticalSpace(20.h),
            SvgPicture.asset(
              svgIconPath,
              width: 30.w,
              height: 30.w,
              fit: BoxFit.fill,
            ),
          ],
        ),
        Text(
          textTitle,
          style: titleStyle ?? AppTextStyles.font16Black700Bold(context),
        ),
      ],
    ),
    messageText: Row(
      children: [
        horizontalSpace(30.w),
        Text(
          text,
          style: messageStyle ?? AppTextStyles.font14Black500Medium(context),
        ),
      ],
    ),
    snackPosition: snackPosition,
    borderRadius: 8,
    duration: Duration(seconds: 3),
    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 12),
    backgroundColor: backgroundColor ?? Colors.white,
  );
}

void showAwosomCustomSnackbar({
  required BuildContext context,
  required String textTitle,
  required String text,
  required ContentType contentType,
}) {
  final snackBar = SnackBar(
    elevation: 0,
    behavior: SnackBarBehavior.floating,
    backgroundColor: Colors.transparent,
    margin: EdgeInsets.only(top: 16, left: 16, right: 16), // تحديد موقع الظهور
    content: AwesomeSnackbarContent(
      title: textTitle,
      message: text,
      contentType: contentType,
    ),
  );

  ScaffoldMessenger.of(context)
    ..hideCurrentSnackBar()
    ..showSnackBar(snackBar);
}

void showStyleCustomSnackbar({
  required BuildContext context,
  required String textTitle,
  required String text,
  required ContentType contentType,
  TextStyle? titleTextStyle,
  TextStyle? messageTextStyle,
}) {
  final snackBar = SnackBar(
    elevation: 0,
    behavior: SnackBarBehavior.floating,
    backgroundColor: Colors.transparent,
    margin: EdgeInsets.only(top: 16, left: 16, right: 16),
    content: Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            textTitle,
            style:
                titleTextStyle ??
                TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
          ),
          SizedBox(height: 8),
          Text(
            text,
            style:
                messageTextStyle ??
                TextStyle(fontSize: 14, color: Colors.black54),
          ),
        ],
      ),
    ),
  );

  ScaffoldMessenger.of(context)
    ..hideCurrentSnackBar()
    ..showSnackBar(snackBar);
}

void showSuccessSnackbar(BuildContext context, String message) {
  Get.snackbar(
    '',
    '',
    snackPosition: SnackPosition.TOP,
    backgroundColor: Colors.white,
    borderRadius: 12.r,
    margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
    padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
    duration: Duration(seconds: 3),
    titleText: Row(
      children: [
        SvgPicture.asset(AppAssets.svgs.ic_success, width: 24.w, height: 24.w),
        SizedBox(width: 8.w),
        Expanded(
          child: Text(
            message,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black,
              fontSize: 14.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    ),
    messageText: SizedBox.shrink(),
    icon: Container(
      height: 40.h,
      child: VerticalDivider(color: Colors.green, thickness: 3.w),
    ),
  );
}

void showErrorSnackbar(BuildContext context, String message) {
  Get.snackbar(
    '',
    '',
    snackPosition: SnackPosition.TOP,
    backgroundColor: Colors.white,
    borderRadius: 12.r,
    margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
    padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
    duration: Duration(seconds: 3),
    titleText: Row(
      children: [
        SvgPicture.asset(AppAssets.svgs.ic_error, width: 24.w, height: 24.w),
        SizedBox(width: 8.w),
        Expanded(
          child: Text(
            message,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black,
              fontSize: 14.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    ),
    messageText: SizedBox.shrink(),
    icon: Container(
      height: 40.h,
      child: VerticalDivider(color: Colors.amber, thickness: 3.w),
    ),
  );
}
// void showErrorSnackbar(
//   BuildContext context,
//   String message,
//   SnackPosition? snackPosition,
// ) {
//   showCustomSnackbar(
//     context: context,
//     svgIconPath: AppAssets.svgs.ic_error,
//     textTitle: context.error,
//     text: message,
//     snackPosition: snackPosition ?? SnackPosition.TOP,
//   );
// }

// void showSuccessSnackbar(BuildContext context, String message) {
//   showCustomSnackbar(
//     context: context,
//     svgIconPath: AppAssets.svgs.ic_success,
//     textTitle: context.error,
//     text: message,
//     snackPosition: SnackPosition.TOP,
//   );
