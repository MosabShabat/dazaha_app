import '../../../../core/constant/exports_libraries.dart';

Widget CusButtonWidget(
  BuildContext context, {
  required Color backGroundColor,
  required double W,
  required double H,
  required double radius,
  required Widget widget,
  VoidCallback? onTap,
}) {
  return SizedBox(
    width: W,
    height: H,
    child: Material(
      color: backGroundColor,
      borderRadius: BorderRadius.circular(radius),
      child: InkWell(
        borderRadius: BorderRadius.circular(radius),
        onTap: onTap,
        splashColor: Colors.white24,
        highlightColor: Colors.white10,
        child: Center(child: widget),
      ),
    ),
  );
}
