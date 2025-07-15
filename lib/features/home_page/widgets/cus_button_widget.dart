import 'package:dazaha_app/core/constant/exports_libraries.dart';

Widget CusButtonWidget(
  BuildContext context, {
  required backGroundColor,
  required W,
  required H,
  required radius,
  // required text,
  // required textStyle,
  // required isText,
  required widget,
}) {
  return GestureDetector(
    onTap: () {},
    child: Container(
      width: W,
      height: H,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        color: backGroundColor,
      ),
      child: Center(child: widget),
    ),
  );
}
