import 'package:cached_network_image/cached_network_image.dart';
import '../../../../core/constant/exports_widgets.dart';
import '../../../../core/constant/exports_libraries.dart';
import 'full_screen_image_viewer.dart';
import 'info_cat_row_widget.dart';

Widget SliverAppBarWidget(
  BuildContext context, {
  required PageController sliController,
  required int imagesLen,
  required dynamic imageItem,
  required String price,
  required String distance,
  required int type,
}) {
  return SliverAppBar(
    pinned: false,
    automaticallyImplyLeading: false,
    leading: Padding(
      padding: EdgeInsets.all(10.0.w),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 8.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40.r),
          color: context.colorsCustom.surfacePrimaryWhite,
        ),
        child: const Center(child: Icon(Icons.arrow_back_ios)),
      ).onTap(() => Get.back()),
    ),
    expandedHeight: 300.h,
    flexibleSpace: Stack(
      fit: StackFit.expand,
      children: [
        // ✅ الصور + إمكانية السحب من أي مكان
        Listener(
          behavior: HitTestBehavior.translucent,
          onPointerDown: (_) {}, // يسمح بالتفاعل في جميع المناطق
          child: GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: () {
              // فتح العرض الكامل عند الضغط
              Get.to(
                () => FullScreenImageViewer(
                  images: type == 1
                      ? [imageItem]
                      : imageItem
                            .map<String>((e) => e.image as String)
                            .toList(),
                  initialIndex: sliController.page?.toInt() ?? 0,
                ),
              );
            },
            child: Stack(
              fit: StackFit.expand,
              children: [
                type == 1
                    ? CachedNetworkImage(
                        imageUrl: imageItem,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      )
                    : PageView.builder(
                        controller: sliController,
                        itemCount: imagesLen,
                        physics: const BouncingScrollPhysics(),
                        itemBuilder: (context, index) {
                          return CachedNetworkImage(
                            imageUrl: imageItem[index].image,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          );
                        },
                      ),

                // ✅ الظل السفلي لا يمنع السحب
                IgnorePointer(
                  ignoring: true,
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      height: 120.h,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                          colors: [
                            context.colorsCustom.surfacePrimaryBlack
                                .withOpacity(0.85),
                            context.colorsCustom.surfacePrimaryBlack
                                .withOpacity(0.0),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),

        // ✅ InfoCatRowWidget ثابت ولا يمنع السحب
        Positioned(
          left: 0,
          right: 0,
          bottom: 0,
          child: IgnorePointer(
            ignoring: true,
            child: InfoCatRowWidget(context, distance: distance, price: price),
          ),
        ),
      ],
    ),
  );
}
