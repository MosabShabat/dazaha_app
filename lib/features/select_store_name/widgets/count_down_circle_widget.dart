import 'package:dazaha_app/core/constant/exports_libraries.dart';
import 'package:dazaha_app/core/constant/exports_widgets.dart';

Widget CountdownCircleWidget(BuildContext context, {required seconds}) {
  return TweenAnimationBuilder<double>(
    tween: Tween<double>(begin: seconds.toDouble(), end: 0),
    duration: Duration(seconds: seconds),
    builder: (context, value, child) {
      return SizedBox(
        width: 20.w, // adjust size
        height: 20.w,
        child: Stack(
          alignment: Alignment.center,
          children: [
            CircularProgressIndicator(
              value: value / seconds,
              strokeWidth: 2,
              color: context.colorsCustom.TealGreenSecondary,
              backgroundColor: context.colorsCustom.surfacePrimaryWhite,
            ),
            Text(
              value.ceil().toString(),
              style: TextStyle(
                fontSize: 10,
                color: context.colorsCustom.TextPrimary,
              ),
            ),
          ],
        ),
      );
    },
  );
}
