import 'dart:developer';
import 'dart:io';
import 'package:easy_localization/easy_localization.dart';
import 'package:dio/dio.dart' as dio;
import '../../../core/network/utils/api_error_model.dart';
import '../../../core/network/utils/api_result.dart';
import '../../../core/network/utils/app_response.dart';
import '../../../core/helpers/app_shared_methods.dart';
import '../../../core/helpers/constants.dart';
import '../../../core/widgets/app_snackbar.dart';
import '../../../core/constant/exports_libraries.dart';
import '../../../core/network/models/chat/general_message.dart';
import '../../../core/network/models/chat/message.dart';
import 'chat_technical_support_repo.dart';

// استدعاء كلاس Reverb و WebsocketResponse (ضع الملف حيث تريده ومساره صحيح)
import 'reverb_options.dart';
import 'web_socket_response.dart';

class ChatTechnicalSupportController extends GetxController
    with WidgetsBindingObserver {
  final String receiverUuid;
  ChatTechnicalSupportController(this.receiverUuid);
  final ChatTechnicalSupportRepo _chatRepo = Get.find();

  late SimpleFlutterReverb reverb;

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

    final receiver = receiverUuid;
    print("Receiver UUID: $receiver");
    initReverb(receiver); // ✅ اشترك أولاً
    getMessages(receiver); // ثم جلب الرسائل السابقة
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
        WidgetsBinding.instance.addPostFrameCallback((_) {
          scrollToBottom();
        });
      } else {
        print("Keyboard closed");
      }
    }
  }

  void addIncomingMessage(Message newMessage) {
    messages.add(newMessage);
    // Scroll to bottom بعد التأكد من إضافة الرسالة
    WidgetsBinding.instance.addPostFrameCallback((_) => scrollToBottom());
  }

  /// ====== Reverb init and listen (replace Pusher) ======
  void initReverb(String channel) async {
    print("🟢 Initializing Reverb connection to channel: $channel");
    reverb = SimpleFlutterReverb(
      options: ReverbOptions(
        scheme: 'wss',
        host: 'panel.dizzha.com',
        port: 443,
        appKey: 'kdgjxo6cgzq8ldqdqjhn',
      ),
    );
    reverb.listen((event) {
      if (event.event == 'specialist-chat.message') {
        try {
          if (event.data != null) {
            final message = Message.fromJson(event.data!);
            addIncomingMessage(message); // استخدم الطريقة الجديدة
          }
        } catch (e) {
          print('❌ Failed to parse incoming message: $e');
        }
      }
    }, channel);

    // reverb.listen((event) {
    //   print("📩 WebSocket Event received: ${event.event}");
    //   print("Received event: ${event.event}, data: ${event.data}");

    //   if (event.event == 'specialist-chat.message') {
    //     try {
    //       final message = Message.fromJson(event.data!);
    //       log('message: ${message.content}');
    //       messages.add(message);
    //       messages.refresh(); // ✅ refresh لضمان تحديث Obx
    //       scrollToBottom();
    //     } catch (e) {
    //       print('❌ Failed to parse incoming message: $e');
    //     }
    //     //c585c34f-9e82-4dbc-b935-83559f0bacb6
    //   }
    // }, channel);
  }

  /// ====== Fetch messages using your repo (كما كان في الأصل) ======
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
              scrollToBottom(); // تمرير تلقائي بعد إضافة الرسالة
            }
          } else {
            showSnackbarErrorApi(Get.context!, response.errors ?? [], null);
          }
        } else {
          isLoading.value = false;
          if (response.message!.contains('No query results for model')) {
            log('Error: ${response.message}');
          } else {
            showErrorSnackbar(
              Get.context!,
              response.message ?? '',
              FirstColor: Colors.red,
            );
          }
        }
      },
      failure: (error) {
        isLoading.value = false;
        log('❌ Error fetching messages: $error');
        // if (error) {

        // }
        showSnackbarErrorApi(Get.context!, [error], null);
      },
    );
  }

  /// ====== Send message (keeps original flow) ======
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
    scrollToBottom(); // تمرير تلقائي بعد إضافة الرسالة

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
          // نجاح الإرسال — الخادم قد يرسل نفس الرسالة عبر WebSocket
        } else {
          showErrorSnackbar(Get.context!, response.message ?? '');
        }
      },
      failure: (error) {
        log('kkkkkkkkkkkkkkkkkkkkkk');
        log('❌ Error fetching messages: $error');

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
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (scrollController.hasClients) {
        scrollController.animateTo(
          scrollController.position.maxScrollExtent +
              50, // إضافة بعض المسافة لضمان ظهور آخر رسالة
          duration: Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  @override
  void onClose() {
    super.onClose();
    try {
      reverb.close();
    } catch (e) {
      print("⚠️ Error closing reverb: $e");
    }
    WidgetsBinding.instance.removeObserver(this);
    scrollController.dispose();
  }
}
