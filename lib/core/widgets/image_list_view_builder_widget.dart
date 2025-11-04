import 'package:cached_network_image/cached_network_image.dart';
import '../../features/item_ad_details/widgets/sliver_app_bar_widgets/full_screen_image_viewer.dart';
import '../constant/exports_libraries.dart';
import '../constant/exports_widgets.dart';

Widget ImageListViewBuilderWidget(
  BuildContext context, {
  required imagesLen,
  required imagesItem,
}) {
  return SizedBox(
    height: imagesLen == 1 ? 200.w : 175.w,
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
              height: imagesLen == 1 ? 200.w : 150.w,
              width: imagesLen == 1 ? 200.w : 150.w,
              fit: BoxFit.fill,
            ).box
            .withRounded(value: 8.r)
            .clip(Clip.antiAlias)
            .margin(EdgeInsets.symmetric(horizontal: 8.w))
            .width(imagesLen == 1 ? 200.w : 150.w)
            .height(imagesLen == 1 ? 200.w : 150.w)
            .make()
            .onTap(() {
              List<String> images = [imagesItem[index].image ?? ''];
              for (var i = 0; i < images.length; i++) {
                print(images[i]);
              }
              Get.to(
                () => FullScreenImageViewer(images: images, initialIndex: 0),
              );
            });
      },
    ),
  );
}
