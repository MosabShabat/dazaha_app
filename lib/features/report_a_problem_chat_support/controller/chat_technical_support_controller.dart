import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import '../../../core/network/utils/api_result.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:pusher_channels_flutter/pusher_channels_flutter.dart';
import '../../../core/constant/exports_libraries.dart';
import 'package:dio/dio.dart' as dio;
import '../../../core/helpers/app_shared_methods.dart';
import '../../../core/helpers/constants.dart';
import '../../../core/network/models/chat/general_message.dart';
import '../../../core/network/models/chat/message.dart';
import '../../../core/network/utils/api_error_model.dart';
import '../../../core/network/utils/app_response.dart';
import '../../../core/widgets/app_snackbar.dart';
import 'chat_technical_support_repo.dart';

class ChatTechnicalSupportController extends GetxController
    with WidgetsBindingObserver {
  final ChatTechnicalSupportRepo _chatRepo =
      Get.find<ChatTechnicalSupportRepo>();

  late PusherChannelsFlutter pusher;

  RxBool isLoading = true.obs;

  Rx<GeneralMessage>? generalMessage;
  final RxList<Message> messages = <Message>[].obs;
  Rx<Message>? message;
  final TextEditingController messageController = TextEditingController();

  Rx<dynamic> selectedMessageImage = Rx<dynamic>(null);

  final ScrollController scrollController = ScrollController();

  RxBool showNameTop = false.obs;

  RxBool isKeyboardVisible = false.obs;
  @override
  void onInit() {
    super.onInit();
    scrollController.addListener(scrollListener);
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void didChangeMetrics() {
    super.didChangeMetrics();
    final bottomInset = WidgetsBinding.instance.window.viewInsets.bottom;
    final keyboardIsVisible = bottomInset > 0;
    if (keyboardIsVisible != isKeyboardVisible.value) {
      isKeyboardVisible.value = keyboardIsVisible;
      if (keyboardIsVisible) {
        print("Keyboard opened");
        Future.delayed(Duration(milliseconds: 100), scrollToBottom);
      } else {
        print("Keyboard closed");
      }
    }
  }

  void getMessages(String receiverUuid) async {
    isLoading.value = true;
    final result = await _chatRepo.getMessages(receiverUuid);
    result.when(
      success: (response) {
        isLoading.value = false;
        if (response.status == true) {
          if (response.data != null) {
            generalMessage = GeneralMessage.fromJson(
              response.data as Map<String, dynamic>,
            ).obs;
            messages.clear();
            if (generalMessage?.value.message != null) {
              messages.addAll(generalMessage!.value.message!);
              messages.refresh();
              Future.delayed(Duration(milliseconds: 100), scrollToBottom);
            }
          } else {
            showSnackbarErrorApi(Get.context!, response.errors ?? [], null);
          }
        } else {
          isLoading.value = false;
          showErrorSnackbar(Get.context!, response.message ?? '');
        }
      },
      failure: (error) {
        isLoading.value = false;
        showSnackbarErrorApi(Get.context!, [error], null);
      },
    );
  }

  Future<void> initPusher() async {
    try {
      pusher = PusherChannelsFlutter.getInstance();
      await pusher.init(
        apiKey: MessageTypes.chatApiKey,
        cluster: MessageTypes.chatCluster,
        onEvent: onEvent,
        onConnectionStateChange: onConnectionStateChange,
        onError: onError,
      );

      await pusher.connect();
      await pusher.subscribe(channelName: await MessageTypes.chatChannelName);
      print("Pusher initialization created");
    } catch (e) {
      print("Pusher initialization failed: $e");
    }
  }

  void onEvent(PusherEvent event) {
    print('Event received: ${event.eventName} : ${event.data}');
    if (event.eventName == "MessageSent") {
      try {
        final generalMessageJson =
            jsonDecode(event.data) as Map<String, dynamic>;
        final message = Message.fromJson(generalMessageJson);
        messages.add(message);
        messages.refresh();
        Future.delayed(Duration(milliseconds: 100), scrollToBottom);
      } catch (e) {
        print("Failed to parse message: $e");
      }
    }
  }

  void onConnectionStateChange(String? currentState, String? previousState) {
    print(
      "Pusher connection state changed: $currentState (from $previousState)",
    );
  }

  void onError(String message, int? code, dynamic exception) {
    print("Pusher error: $message");
  }

  Future<void> sendMessage(
    String receiverUuid,
    String contentType,
    String content,
  ) async {
    final currentTime = DateTime.now();
    final formattedTime = DateFormat(
      'hh:mm a',
      AppSharedMethods.isAppLanguageArabic() ? 'ar' : 'en',
    ).format(currentTime);
    final newMessage = Message(
      content: content,
      isMe: true,
      contentType: contentType,
      timeAge: formattedTime,
    );
    messages.add(newMessage);
    messages.refresh();
    Future.delayed(Duration(milliseconds: 100), scrollToBottom);

    if (contentType == MessageTypes.messageText) {
      sendMessageRequest(receiverUuid, contentType, content, null);
    } else if (contentType == MessageTypes.messageImage) {
      sendMessageRequest(receiverUuid, contentType, null, selectedMessageImage);
    }
    messages.refresh();
    scrollToBottom();
  }

  Future<void> sendMessageRequest(
    String receiverUuid,
    String contentType,
    String? contentText,
    Rx<dynamic>? selectedMessageImage,
  ) async {
    try {
      final messageImageFile =
          (contentType == MessageTypes.messageImage &&
              selectedMessageImage?.value != null &&
              selectedMessageImage?.value is! String)
          ? await prepareMessageImage(selectedMessageImage!.value)
          : null;

      final result = await _chatRepo.sendMessage(
        receiverUuid: receiverUuid,
        contentType: contentType,
        contentText: contentText,
        contentImage: messageImageFile,
      );
      _handleSendMessageResponse(result);
    } catch (e) {
      showErrorSnackbar(
        Get.context!,
        'حدث خطأ أثناء إرسال الرسالة أو معالجة الصورة: $e',
      );
    }
  }

  Future<dio.MultipartFile> prepareMessageImage(File image) async {
    return await dio.MultipartFile.fromFile(
      image.path,
      filename: image.path.split('/').last,
    );
  }

  void _handleSendMessageResponse(ApiResult<AppResponse> result) {
    result.when(
      success: (response) async {
        if (response.status == true) {
        } else {
          showErrorSnackbar(Get.context!, response.message ?? '');
        }
      },
      failure: (error) {
        _showApiErrors([error]);
      },
    );
  }

  void _showApiErrors(List<ApiErrorModel> errors) {
    showSnackbarErrorApi(Get.context!, errors, null);
  }

  void scrollListener() {
    if (scrollController.offset > 130) {
      log('scroll true');
      showNameTop.value = true;
    } else {
      log('scroll false');

      showNameTop.value = false;
    }
  }

  void scrollToBottom() {
    if (scrollController.hasClients) {
      scrollController.animateTo(
        scrollController.position.maxScrollExtent,
        duration: Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    }
  }

  @override
  void onClose() {
    super.onClose();
    // disconnectPusher();
    WidgetsBinding.instance.removeObserver(this);
    scrollController.dispose();
  }

  // Future<void> disconnectPusher() async {
  //   try {
  //     await pusher.unsubscribe(channelName: await MessageTypes.chatChannelName);
  //     await pusher.disconnect();
  //     if (Get.isRegistered<DirectSupportController>()) {
  //       DirectSupportController controller = Get.find();
  //       controller.initPusher();
  //       controller.getChats(false);
  //     }

  //     print("Pusher disconnected");
  //   } catch (e) {
  //     print("Failed to disconnect Pusher: $e");
  //   }
  // }
}
