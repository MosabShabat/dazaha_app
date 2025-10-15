import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../core/helpers/constants.dart';
import '../../../../../core/theming/app_text_styles.dart';
import '../../../core/routes/routes.dart';
import '../../../core/widgets/app_shimmers/custom_shimmer.dart';

Widget ImageMessage(BuildContext context,{
  required String message,
  required String time,
  required bool isMine,
}) {
  return Column(
    children: [
      _buildImageBubble(message, isMine),
      _buildMessageTime(context,time, isMine),
    ],
  );
}

Widget _buildImageBubble(String message, bool isMine) {
  return Align(
    alignment: isMine ? Alignment.centerRight : Alignment.centerLeft,
    child: GestureDetector(
      onTap: () {
        Get.toNamed(
          Routes.imagePreviewScreen,
          arguments: {AppConstants.imageSource: message},
        );
      },
      behavior: HitTestBehavior.opaque,
      child: Container(
        margin: EdgeInsets.only(right: isMine ? 0 : 24, left: isMine ? 24 : 0),
        padding: EdgeInsets.all(10),
        decoration: _buildBubbleDecoration(isMine),
        child: ClipRRect(
          borderRadius: _buildBubbleBorderRadius(isMine),
          child: _buildImage(message),
        ),
      ),
    ),
  );
}

BoxDecoration _buildBubbleDecoration(bool isMine) {
  return BoxDecoration(
    borderRadius: BorderRadius.only(
      bottomLeft: Radius.circular(isMine ? 10 : 0),
      bottomRight: Radius.circular(isMine ? 0 : 10),
      topLeft: Radius.circular(10),
      topRight: Radius.circular(10),
    ),
  );
}

BorderRadius _buildBubbleBorderRadius(bool isMine) {
  return BorderRadius.only(
    bottomLeft: Radius.circular(isMine ? 10 : 0),
    bottomRight: Radius.circular(isMine ? 0 : 10),
    topLeft: Radius.circular(10),
    topRight: Radius.circular(10),
  );
}

Widget _buildImage(String message) {
  if (message.startsWith('http')) {
    return Image.network(
      message,
      width: 150,
      height: 150,
      fit: BoxFit.cover,
      loadingBuilder: (context, child, loadingProgress) {
        if (loadingProgress == null) return child;
        return CustomShimmer(width: 150, height: 150);
      },
      errorBuilder: (context, error, stackTrace) {
        return Icon(Icons.error, color: Colors.red);
      },
    );
  } else {
    return Image.file(
      File(message),
      width: 150,
      height: 150,
      fit: BoxFit.cover,
    );
  }
}

Widget _buildMessageTime(BuildContext context,String time, bool isMine) {
  return Align(
    alignment: isMine ? Alignment.centerRight : Alignment.centerLeft,
    child: Container(
      margin: EdgeInsets.only(right: 12, left: 12, top: 4, bottom: 16),
      child: Text(time, style: AppTextStyles.font10Grey400Regular(context)),
    ),
  );
}
