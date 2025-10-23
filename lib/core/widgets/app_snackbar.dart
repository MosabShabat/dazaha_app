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
    initColor: Colors.red,
    svgColor: Colors.red,
    svgIconPath: AppAssets.svgs.info_circle_icon,
    textTitle: errorMessage,
    text: '',
    snackPosition: snackPosition ?? SnackPosition.TOP,
  );
}

void showCustomSnackbar({
  required BuildContext context,
  required String svgIconPath,
  required String textTitle,
  required String text,
  required initColor,
  SnackPosition snackPosition = SnackPosition.BOTTOM,
  TextStyle? titleStyle,
  TextStyle? messageStyle,
  Color? backgroundColor,
  svgColor,
}) {
  Get.snackbar(
    '',
    '',
    icon: Row(
      children: [
        Container(
          height: 50.h,
          margin: EdgeInsets.only(right: 6, left: 6, bottom: 6.h, top: 6.h),
          child: VerticalDivider(
            color: initColor,
            radius: BorderRadius.circular(4.r),
            width: 5.w,
            thickness: 5.w,
          ),
        ),
        SvgPicture.asset(
          svgIconPath,
          width: 22.w,
          height: 22.w,
          fit: BoxFit.fill,
          color: svgColor == null ? Colors.white : svgColor,
        ),
      ],
    ),
    titleText: Row(
      children: [
        Text(
          textTitle,
          style: titleStyle ?? AppTextStyles.font16Black700Bold(context),
        ),
      ],
    ),
    messageText: Row(
      children: [
        text == ''
            ? SizedBox.shrink()
            : Text(
                text,
                style:
                    messageStyle ?? AppTextStyles.font14Black500Medium(context),
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

void showErrorSnackbar(
  BuildContext context,
  String message, {
  SnackPosition? snackPosition,
  FirstColor,
}) {
  showCustomSnackbar(
    context: context,
    initColor: FirstColor == null ? Colors.red : FirstColor,
    svgIconPath: AppAssets.svgs.ic_error,
    textTitle: message,
    text: '',
    svgColor: FirstColor,
    snackPosition: snackPosition ?? SnackPosition.TOP,
  );
}

void showSuccessSnackbar(
  BuildContext context,
  String message, {
  SnackPosition? snackPosition,
}) {
  showCustomSnackbar(
    context: context,
    initColor: Colors.green,
    svgIconPath: AppAssets.svgs.ic_success,
    textTitle: context.error,
    text: '',
    snackPosition: SnackPosition.TOP,
  );
}
