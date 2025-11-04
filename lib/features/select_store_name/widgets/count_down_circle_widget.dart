import '../../../core/constant/exports_widgets.dart';
import '../../../core/constant/exports_libraries.dart';

Widget CountdownCircleWidget(BuildContext context, {required int seconds}) {
  return StreamBuilder<int>(
    stream: Stream.periodic(
      const Duration(seconds: 1),
      (x) => seconds - x - 1,
    ).take(seconds),
    builder: (context, snapshot) {
      final value = snapshot.data ?? seconds;
      return SizedBox(
        width: 24.w,
        height: 24.w,
        child: Stack(
          alignment: Alignment.center,
          children: [
            CircularProgressIndicator(
              value: value / seconds,
              strokeWidth: 3,
              color: context.colorsCustom.TealGreenSecondary,
              backgroundColor: context.colorsCustom.surfacePrimaryWhite,
            ),
            Text(
              value > 0 ? value.toString() : "0",
              style: TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.w400,
                color: context.colorsCustom.TextPrimary,
              ),
            ),
          ],
        ),
      );
    },
  );
}
