import 'package:dazaha_app/core/constant/exports_libraries.dart';
import 'package:dazaha_app/core/helpers/spacing.dart';
import 'package:dazaha_app/core/helpers/theme_exports.dart';

Widget TextServiceWidget(
  BuildContext context, {
  text1,
  text2,
  color1,
  color2,
  size1,
  size2,
  fontFamily1,
  fontFamily2,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text(
        text1,
        textAlign: TextAlign.start,
        maxLines: 3,
        style: context.textStyles.titleLarge.bold.copyWith(
          color: color1,
          fontFamily: fontFamily1,
          fontSize: size1,
        ),
      ),
      verticalSpace(5.h),
      text2 == ''
          ? Container()
          : Text(
              text2,
              textAlign: TextAlign.start,
              maxLines: 3,
              style: context.textStyles.labelLarge.regular.copyWith(
                color: color2,
                fontFamily: fontFamily2,
                fontSize: size2,
              ),
            ),
    ],
  );
}
