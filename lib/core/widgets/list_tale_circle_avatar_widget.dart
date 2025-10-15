import 'package:cached_network_image/cached_network_image.dart';
import '../../../../core/constant/exports_libraries.dart';

Widget ListTaleCircleAvatarWidget({
  required backGroundColor,
  required img,
  required sizImg,
  required sizeCircleAvatar,
}) {
  return CircleAvatar(
    backgroundColor: backGroundColor,
    maxRadius: sizeCircleAvatar,
    child: CachedNetworkImage(
      imageUrl: img,
      fit: BoxFit.contain,
      width: sizImg,
      height: sizImg,
    ),
    // SvgPicture.asset(img, width: sizImg, height: sizImg),
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
