import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';
import 'package:get/get.dart';

class FullScreenImageViewer extends StatelessWidget {
  final List<String> images;
  final int initialIndex;

  const FullScreenImageViewer({
    super.key,
    required this.images,
    this.initialIndex = 0,
  });

  @override
  Widget build(BuildContext context) {
    final PageController controller = PageController(initialPage: initialIndex);

    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          PhotoViewGallery.builder(
            pageController: controller,
            itemCount: images.length,
            builder: (context, index) {
              return PhotoViewGalleryPageOptions(
                imageProvider: NetworkImage(images[index]),
                heroAttributes: PhotoViewHeroAttributes(tag: images[index]),
                minScale: PhotoViewComputedScale.contained * 1,
                maxScale: PhotoViewComputedScale.covered * 2,
              );
            },
            backgroundDecoration: const BoxDecoration(color: Colors.black),
            scrollPhysics: const BouncingScrollPhysics(),
            loadingBuilder: (context, event) => const Center(
              child: CircularProgressIndicator(color: Colors.white),
            ),
          ),

          // زر إغلاق
          Positioned(
            top: 40,
            left: 10,
            child: IconButton(
              icon: const Icon(Icons.close, color: Colors.white, size: 30),
              onPressed: () => Get.back(),
            ),
          ),
        ],
      ),
    );
  }
}
