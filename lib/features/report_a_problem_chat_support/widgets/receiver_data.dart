import 'package:cached_network_image/cached_network_image.dart';
import '../../../../core/constant/exports_libraries.dart';
import '../../../../core/constant/exports_widgets.dart';


Widget ReceiverData(
  BuildContext context, {
  required String receiverImage,
  required String receiverName,
  required bool receiverVerify,
}) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 8),
    child: Column(
      children: [
        CircleAvatar(
          radius: 50,
          backgroundColor: context.colorsCustom.CardBackgroundLightGray,
          child: CachedNetworkImage(
            imageUrl: receiverImage,
            imageBuilder: (context, imageProvider) =>
                CircleAvatar(radius: 50, backgroundImage: imageProvider),
          ),
        ),
        verticalSpace(8),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              receiverName,
              maxLines: 1,
              textAlign: TextAlign.center,
              style: context.textStyles.bodyLarge.bold.copyWith(
                color: context.colorsCustom.TextPrimary,
                fontSize: 14.sp,
              ),
            ),
            horizontalSpace(2),
            receiverVerify
                ? SvgPicture.asset(
                    AppAssets.svgs.icAccountVerification,
                    width: 16,
                    height: 16,
                  )
                : Container(),
          ],
        ),
        verticalSpace(8),
      ],
    ),
  );
}
