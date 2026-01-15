import '../../../core/constant/exports_widgets.dart';
import 'package:keyboard_actions/keyboard_actions.dart';

import '../../../core/constant/exports_libraries.dart';

Widget InPutPriceWidget(
  BuildContext context, {
  required isShow,
  FW,
  textColor,
  hintText,
  FZ,
  initialValue,
  controller,
  currency,maxHeight,
}) {
  final FocusNode priceFocus = FocusNode();

  return ConstrainedBox(
    constraints: BoxConstraints(minHeight: 0, maxHeight:maxHeight?? 80.h),
    child: KeyboardActions(
      config: KeyboardActionsConfig(
        keyboardActionsPlatform: KeyboardActionsPlatform.IOS,
        actions: [
          KeyboardActionsItem(
            focusNode: priceFocus,
            toolbarButtons: [
              (node) => TextButton(
                onPressed: () => node.unfocus(),
                child: const Text(
                  'Done',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min, // ⭐ مهم
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (isShow)
            Text(
              context.howMuchWouldYouLikeToPay,
              style: context.textStyles.bodyMedium.medium,
            ),
          verticalSpace(10.h),
          MyTextField(
            focusNode: priceFocus,
            textAlign: TextAlign.center,
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
            controller: controller,
            hintText: hintText ?? '0.0',
            onSubmitted: (_) => priceFocus.unfocus(),
            suffixIcon: Text(
              currency ?? 'د.ع',
            ).box.padding(EdgeInsets.symmetric(vertical: 10.h)).make(),
          ),
        ],
      ),
    ),
  );
}
