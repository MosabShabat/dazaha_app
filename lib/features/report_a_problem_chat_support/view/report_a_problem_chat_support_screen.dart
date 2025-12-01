import '../../../../core/constant/exports_libraries.dart';
import '../../../../core/constant/exports_widgets.dart';
import '../../../core/helpers/app_shared_methods.dart';
import '../../../core/theming/app_text_styles.dart';
import '../../../core/widgets/app_button_back.dart';
import '../controller/chat_technical_support_controller.dart';
import '../widgets/message_action_bar.dart';
import '../widgets/messages_list_view.dart';

class ReportAProblemChatSupportScreen extends StatelessWidget {
  late final ChatTechnicalSupportController controller;

  final String? receiverUuid, receiverImage, receiverName;
  final bool? receiverVerify;

  final bool isLiveSupport;
  ReportAProblemChatSupportScreen({
    required this.isLiveSupport,
    this.receiverUuid,
    this.receiverImage,
    this.receiverName,
    this.receiverVerify,
  }) {
    controller = Get.put(
      ChatTechnicalSupportController(receiverUuid ?? 'technical_support'),
    );
  }

  @override
  Widget build(BuildContext context) {
    // controller.initReverb(receiverUuid ?? 'technical_support');
    // controller.getMessages(receiverUuid ?? 'technical_support');

    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                AppButtonBack(
                  context: context,
                  paddingLeft: AppSharedMethods.isAppLanguageArabic() ? 0 : 10,
                  paddingRight: AppSharedMethods.isAppLanguageArabic() ? 10 : 0,
                ),
                Obx(() {
                  return controller.showNameTop.isTrue
                      ? Padding(
                          padding: const EdgeInsets.only(top: 14),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                receiverName ?? context.liveSupport,
                                style: AppTextStyles.font14Black400Regular(
                                  context,
                                ),
                              ),
                            ],
                          ),
                        )
                      : Container();
                }),
              ],
            ),
            MessageListView(
              context,
              controller,
              isLiveSupport,
              receiverUuid,
              receiverImage,
              receiverName,
              receiverVerify,
            ),
            MessageActionBar(
              context,
              receiverUuid ?? 'technical_support',
              controller,
            ),
          ],
        ),
      ),
    );
  }
}
