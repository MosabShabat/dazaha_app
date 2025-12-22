import '../../../../core/constant/exports_widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../features/report_a_problem_chat_support/widgets/receiver_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../core/helpers/constants.dart';
import '../../../core/helpers/app_shared_methods.dart';
import '../controller/chat_technical_support_controller.dart';
import 'image_message.dart';
import 'text_message.dart';

Widget MessageListView(
  BuildContext context,
  ChatTechnicalSupportController controller,
  bool isLiveSupport,
  String? receiverUuid,
  String? receiverImage,
  String? receiverName,
  bool? receiverVerify,
) {
  return Expanded(
    flex: 1,
    child: Obx(() {
      if (controller.isLoading.value && controller.messages.isEmpty) {
        return Center(
          child: AppSharedMethods.buildProgressViewWhite(context, false),
        );
      }

      // حتى لو كانت الرسائل فارغة، نعرض ListView (لتتمكن من إرسال واستقبال الرسائل)
      return ListView.builder(
        controller: controller.scrollController,
        itemCount: controller.messages.length + 1,
        itemBuilder: (context, index) {
          if (index == 0) {
            if (isLiveSupport) {
              return Center(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: Text(
                    context.liveSupport,
                    style: context.textStyles.bodyLarge.bold.copyWith(
                      color: context.colorsCustom.TextPrimary,
                      fontSize: 14.sp,
                    ),
                  ),
                ),
              );
            } else {
              return ReceiverData(
                context,
                receiverImage: receiverImage!,
                receiverName: receiverName!,
                receiverVerify: receiverVerify!,
              );
            }
          }

          if (controller.messages.isEmpty ||
              controller.messages[index - 1].contentType == null)
            return SizedBox.shrink();

          final message = controller.messages[index - 1];
          if (message.contentType == MessageTypes.messageText) {
            return TextMessage(
              context,
              message: message.content ?? "",
              time: message.timeAge ?? "",
              isMine: message.isMe!,
            );
          } else if (message.contentType == MessageTypes.messageImage) {
            return ImageMessage(
              context,
              message: message.content ?? "",
              time: message.timeAge ?? "",
              isMine: message.isMe!,
            );
          } else {
            return TextMessage(
              context,
              message: "voice",
              time: message.timeAge ?? "",
              isMine: message.isMe!,
            );
          }
        },
      );
    }),
  );
}
