import '../../../../core/constant/exports_widgets.dart';
import 'package:flutter/widgets.dart';
import '../../../../../core/theming/app_text_styles.dart';

Widget TextMessage(
  BuildContext context, {
  required String message,
  required String time,
  required bool isMine,
}) {
  return Column(
    children: [
      _buildMessageBubble(context, message, isMine),
      _buildMessageTime(context, time, isMine),
    ],
  );
}

Widget _buildMessageBubble(BuildContext context, String message, bool isMine) {
  return Align(
    alignment: isMine ? Alignment.centerRight : Alignment.centerLeft,
    child: Container(
      margin: EdgeInsets.only(right: isMine ? 10 : 24, left: isMine ? 24 : 10),
      padding: EdgeInsets.all(10),
      decoration: _buildBubbleDecoration(context, isMine),
      child: Text(
        message,
        style: isMine
            ? AppTextStyles.font14White500Medium(context, 1.7)
            : AppTextStyles.font14Black500Medium(context),
        textAlign: isMine ? TextAlign.start : TextAlign.end,
      ),
    ),
  );
}

BoxDecoration _buildBubbleDecoration(BuildContext context, bool isMine) {
  return BoxDecoration(
    color: isMine
        ? context.colorsCustom.TealGreenSecondary
        : context.colorsCustom.CardBackgroundLightGray,
    borderRadius: BorderRadius.only(
      topLeft: Radius.circular(10),
      topRight: Radius.circular(10),
      bottomLeft: isMine ? Radius.circular(10) : Radius.zero,
      bottomRight: isMine ? Radius.zero : Radius.circular(10),
    ),
  );
}

Widget _buildMessageTime(BuildContext context, String time, bool isMine) {
  return Align(
    alignment: isMine ? Alignment.centerRight : Alignment.centerLeft,
    child: Container(
      margin: EdgeInsets.only(right: 12, left: 12, top: 4, bottom: 16),
      child: Text(time, style: AppTextStyles.font10Grey400Regular(context)),
    ),
  );
}
