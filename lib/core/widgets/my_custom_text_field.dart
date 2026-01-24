import 'dart:io';

import '../../../../core/constant/exports_libraries.dart';

Widget MyTextField(
  BuildContext context, {
  TextEditingController? controller,
  String? initialValue,
  bool obscureText = false,
  String? hintText,
  Widget? suffixIcon,
  int? maxLines,
  bool readOnly = false,
  Widget? prefixIcon,
  Function(String)? onSubmitted,
  double? Radius,
  required KeyboardDoneController keyboardDoneController,
  Color? fillColor,
  Color? hintStyleColor,
  Color? enabledBorderColor,
  String? HintTextFontFamily,
  double? HintTextFontSize,
  int? maxLength,
  TextAlign? textAlign,
  TextDirection? textDirection,
  TextStyle? style,
  Color? BorderSideColor,
  VoidCallback? onTap,
  FontWeight? fontWeight,
  String? Function(String?)? validator,
  keyboardType,
  onChanged,
  counterText,
  textAlignVertical,
  isDense,
  contentPadding,
  textInputAction,
  FocusNode? focusNode,
  bool showDoneButton = false,
}) {
  if (initialValue != null && controller != null && controller.text.isEmpty) {
    controller.text = initialValue;
  }
  final doneController = keyboardDoneController;
  final VoidCallback? userOnTap = onTap;
  final Function(String)? userOnSubmitted = onSubmitted;
  return TextFormField(
    focusNode: focusNode,

    controller: controller,
    obscureText: obscureText,
    readOnly: readOnly,
    // onTap: onTap,
    validator: validator,
    onChanged: onChanged,

    // onFieldSubmitted:
    //     onSubmitted ??
    //     (_) {
    //       FocusManager.instance.primaryFocus?.unfocus();
    //     },
    keyboardType:
        keyboardType ??
        (maxLines != null && maxLines > 1
            ? TextInputType.multiline
            : TextInputType.name),

    onTap: () {
      if (Platform.isIOS) {
        doneController.show(context);
      }
      userOnTap?.call(); // يحافظ على منطقك السابق
    },

    onEditingComplete: () {
      doneController.hide();
    },

    onFieldSubmitted: (value) {
      doneController.hide();
      userOnSubmitted?.call(value); // ⭐ منطقك
      FocusManager.instance.primaryFocus?.unfocus();
    },
    maxLines: maxLines,
    maxLength: maxLength,
    textAlign: textAlign ?? TextAlign.start,
    textDirection: textDirection,
    textInputAction: textInputAction ?? TextInputAction.done,
    textAlignVertical: textAlignVertical, // ⭐ مهم
    style: style,
    decoration: InputDecoration(
      isDense: isDense, // ⭐ يقلل padding الافتراضي
      contentPadding: contentPadding,
      filled: true,
      fillColor: fillColor,
      counterText: counterText,
      hintText: hintText,
      hintStyle: TextStyle(
        fontFamily: HintTextFontFamily,
        color: hintStyleColor,
        fontWeight: fontWeight,
        fontSize: HintTextFontSize,
      ),
      suffixIcon: suffixIcon,
      prefixIcon: prefixIcon != null
          ? Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.w),
              child: prefixIcon,
            )
          : null,
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(Radius ?? 8),
        borderSide: BorderSide(
          width: 1,
          color: enabledBorderColor ?? Colors.grey,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(Radius ?? 8),
        borderSide: BorderSide(width: 1, color: BorderSideColor ?? Colors.blue),
      ),
    ),
  );
}

class KeyboardDoneButton extends StatelessWidget {
  final VoidCallback onDone;

  const KeyboardDoneButton({super.key, required this.onDone});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Container(
        height: 44,
        color: Colors.grey.shade200,
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: TextButton(
          onPressed: onDone,
          child: Text('Done', style: TextStyle(fontSize: 18.sp)),
        ),
      ),
    );
  }
}

class KeyboardDoneController {
  OverlayEntry? _overlayEntry;

  void show(BuildContext context) {
    if (_overlayEntry != null) return;

    _overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        bottom: MediaQuery.of(context).viewInsets.bottom,
        left: 0,
        right: 0,
        child: KeyboardDoneButton(
          onDone: () {
            hide();
            FocusManager.instance.primaryFocus?.unfocus();
          },
        ),
      ),
    );

    Overlay.of(context).insert(_overlayEntry!);
  }

  void hide() {
    _overlayEntry?.remove();
    _overlayEntry = null;
  }
}
