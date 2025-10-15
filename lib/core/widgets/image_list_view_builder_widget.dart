import 'package:cached_network_image/cached_network_image.dart';
import '../constant/exports_libraries.dart';
import '../constant/exports_widgets.dart';

Widget ImageListViewBuilderWidget(
  BuildContext context, {
  required imagesLen,
  required imagesItem,
}) {
  return SizedBox(
    height: 175.w,
    width: Width.w,
    child: ListView.builder(
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      itemCount: imagesLen,
      physics: imagesLen == 1
          ? NeverScrollableScrollPhysics()
          : BouncingScrollPhysics(),
      itemBuilder: (context, index) {
        final imgFile = imagesItem[index];
        return CachedNetworkImage(
              imageUrl: (imgFile.image ?? ''),
              height: 150.w,
              width: 150.w,
              fit: BoxFit.fill,
            ).box
            .withRounded(value: 8.r)
            .clip(Clip.antiAlias)
            .margin(EdgeInsets.symmetric(horizontal: 8.w))
            .width(imagesLen == 1 ? 345.w : 150.w)
            .height(imagesLen == 1 ? 175.h : 150.w)
            .make();
      },
    ),
  );
}
