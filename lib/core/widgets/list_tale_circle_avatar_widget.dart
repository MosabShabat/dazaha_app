import 'package:dazaha_app/core/constant/exports_libraries.dart';


Widget ListTaleCircleAvatarWidget({
  required backGroundColor,
  required img,
  required sizImg,
  required sizeCircleAvatar,
}) {
  return CircleAvatar(
    backgroundColor: backGroundColor,
    maxRadius: sizeCircleAvatar,
    child: SvgPicture.asset(img, width: sizImg, height: sizImg),
  );
}

Widget IconCircleAvatarWidget({
  required backGroundColor,
  required sizeCircleAvatar,
  required icon,
  required sizIcon,
  required colorIcon,
}) {
  return CircleAvatar(
    backgroundColor: backGroundColor,
    maxRadius: sizeCircleAvatar,
    child: Icon(icon, size: sizIcon, color: colorIcon),
  );
}
