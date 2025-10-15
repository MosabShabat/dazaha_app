import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomCachedImage extends StatelessWidget {
  final String imageUrl;
  final double width;
  final double height;
  final double borderRadius;
  final Color? borderColor;
  final BoxFit fit;

  const CustomCachedImage({
    Key? key,
    required this.imageUrl,
    required this.width,
    required this.height,
    this.borderRadius = 4.5,
    this.borderColor,
    this.fit = BoxFit.cover,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: borderColor != null ? Border.all(color: borderColor!, width: 1) : null,
        borderRadius: BorderRadius.circular(borderRadius +1),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(borderRadius),
        child: CachedNetworkImage(
          imageUrl: imageUrl,
          imageBuilder: (context, imageProvider) => Container(
            width: width.w,
            height: height.h,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: imageProvider,
                fit: fit,
              ),
            ),
          ),
          placeholder: (context, url) => Container(
            width: width.w,
            height: height.h,
            color: Colors.grey.shade200,
          ),
          errorWidget: (context, url, error) => Container(
            width: width.w,
            height: height.h,
            color: Colors.grey,
            child: Icon(Icons.error, color: Colors.red),
          ),
        ),
      ),
    );
  }
}
