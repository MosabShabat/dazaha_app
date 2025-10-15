import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/app_delete_bottom_sheet_controller.dart';
import '../widgets/app_delete_bottom_sheet_content.dart';

Future<bool?> showAppDeleteBottomSheet(
  BuildContext context,
) async {
  if (Get.isRegistered<AppDeleteBottomSheetController>()) {
    Get.delete<AppDeleteBottomSheetController>();
  }

  final result = await showModalBottomSheet<bool>(
    context: context,
    isScrollControlled: true,
    builder: (context) {
      return Wrap(
        children: [
          Container(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12.0),
                topRight: Radius.circular(12.0),
              ),
            ),
            child: AppDeleteBottomSheetContent(),
          ),
        ],
      );
    },
  );
  return result;
}
