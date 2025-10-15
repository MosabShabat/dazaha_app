import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'dart:io';

import '../../../core/helpers/app_shared_methods.dart';
import '../../../core/widgets/app_button_back.dart';


class ImagePreviewScreen extends StatelessWidget {
  final dynamic imageSource;

  ImagePreviewScreen(this.imageSource);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SafeArea(
        child: Stack(children: [
          PhotoView(
            imageProvider: _getImageProvider(imageSource),
          ),
          Positioned(
            top: 10,
            left: AppSharedMethods.isAppLanguageArabic() ? null : 16,
            right: AppSharedMethods.isAppLanguageArabic() ? 16 : null,
            child: AppButtonBack(context: context, color: Colors.white),
          ),
        ]),
      ),
    );
  }

  ImageProvider _getImageProvider(dynamic source) {
    if (source is String) {
      if (source.startsWith('http') || source.startsWith('https')) {
        return NetworkImage(source);
      } else {
        return FileImage(File(source));
      }
    } else if (source is File) {
      return FileImage(source);
    } else {
      return AssetImage('assets/images/default_image.png');
    }
  }


}
