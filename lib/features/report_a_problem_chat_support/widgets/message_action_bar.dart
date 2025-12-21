import 'dart:io';

import '../../../../core/constant/exports_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../../core/helpers/app_shared_methods.dart';
import '../../../../../core/helpers/constants.dart';
import '../../../../../core/theming/app_text_styles.dart';
import '../controller/chat_technical_support_controller.dart';

Widget MessageActionBar(
  BuildContext context,
  String receiverUuid,
  ChatTechnicalSupportController controller,
) {
  return Padding(
    padding: const EdgeInsets.only(right: 16, left: 16, bottom: 24, top: 8),
    child: Container(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
      decoration: BoxDecoration(
        color: context.colorsCustom.CardBackgroundLightGray,
        borderRadius: BorderRadius.circular(25.0),
      ),
      child: Row(
        children: [
          horizontalSpace(8),
          GestureDetector(
            onTap: () {
              AppSharedMethods.showImageSourceOptions(
                context: context,
                isCamera: false,
                onImageSelected: (ImageSource source) async {
                  final ImagePicker _picker = ImagePicker();
                  final XFile? pickedImage = await _picker.pickImage(
                    source: source,
                  );
                  if (pickedImage != null) {
                    controller.selectedMessageImage.value = File(
                      pickedImage.path,
                    );

                    final imagePath = pickedImage.path;
                    controller.sendMessage(
                      receiverUuid,
                      MessageTypes.messageImage,
                      imagePath,
                    );
                  }
                },
              );
            },
            child: SvgPicture.asset(
              AppAssets.svgs.gallery_icon,
              width: 24,
              height: 24,
            ),
          ),
          horizontalSpace(8),
          Expanded(
            child: TextField(
              controller: controller.messageController,
              style: AppTextStyles.font14Black400Regular(context),
              decoration: InputDecoration(
                hintText: context.message,
                hintStyle: AppTextStyles.font12Grey400Regular(context),
                border: InputBorder.none,
              ),
              maxLines: 5,
              minLines: 1,
            ),
          ),
          horizontalSpace(8),
          GestureDetector(
            onTap: () {
              final text = controller.messageController.text.trim();
              if (text.isNotEmpty) {
                controller.sendMessage(
                  receiverUuid,
                  MessageTypes.messageText,
                  text,
                );
                controller.messageController.clear();
              }
            },
            child: SvgPicture.asset(
              AppAssets.svgs.send_icon,
              width: 24,
              height: 24,
            ),
          ),
          horizontalSpace(8),
        ],
      ),
    ),
  );
}
