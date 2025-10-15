import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shimmer/shimmer.dart';
import '../../../../core/constant/exports_libraries.dart';
import '../../../../core/constant/exports_widgets.dart';
import '../../../../core/helpers/app_shared_methods.dart';

Widget ProfileImageWidget(
  BuildContext context, {
  required dynamic image,
  required dynamic controller,
}) {
  Future<void> _pickImage(ImageSource source) async {
    final XFile? picked = await ImagePicker().pickImage(source: source);
    if (picked != null) controller.setSelectedImage(File(picked.path));
  }

  void _showImageSourceOptions() {
    AppSharedMethods.showImageSourceOptions(
      context: context,
      onImageSelected: _pickImage,
    );
  }

  Widget _buildAvatar() {
    final selected = controller.selectedUserImage.value;

    if (selected is String && selected.startsWith('http')) {
      return CachedNetworkImage(
        imageUrl: selected,
        imageBuilder: (context, imageProvider) =>
            CircleAvatar(radius: 42.5.r, backgroundImage: imageProvider),
        placeholder: (_, __) => Shimmer.fromColors(
          baseColor: Colors.grey[300]!,
          highlightColor: Colors.grey[100]!,
          child: CircleAvatar(
            radius: 42.5.r,
            backgroundColor: Colors.grey[200],
          ),
        ),
        errorWidget: (_, __, ___) =>
            CircleAvatar(radius: 42.5.r, backgroundColor: Colors.grey[200]),
      );
    } else if (selected is File) {
      return CircleAvatar(radius: 42.5.r, backgroundImage: FileImage(selected));
    } else {
      return CircleAvatar(
        radius: 42.5.r,
        backgroundColor: Colors.grey[300],
        child: Icon(Icons.person, size: 40.r, color: Colors.white),
      );
    }
  }

  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Stack(
        clipBehavior: Clip.none,
        children: [
          _buildAvatar(),
          Positioned(
            bottom: -0.0.h,
            child: CircleAvatar(
              radius: 13.5.r,
              backgroundColor: context.colorsCustom.TealGreenSecondary,
              child: SvgPicture.asset(AppAssets.svgs.gallery_edit_icon),
            ).onTap(_showImageSourceOptions),
          ),
        ],
      ),
    ],
  );
}
