import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/login_required_bottom_sheet_controller.dart';
import 'widgets/login_required_bottom_sheet_content.dart';

void showLoginRequiredBottomSheet(BuildContext context) {
  
  if (Get.isRegistered<LoginRequiredBottomSheetController>()) {
    Get.delete<LoginRequiredBottomSheetController>();
  }
  showModalBottomSheet(
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
            child: LoginRequiredBottomSheetContent(),
          ),
        ],
      );
    },
  );
}
