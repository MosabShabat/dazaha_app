import 'package:dazaha_app/core/helpers/app_assets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ItemAdDetailsController extends GetxController {
  final currentPage = 0.obs;

  final PageController pageController = PageController();

  final List<String> images = [
    AppAssets.svgs.test_image,
    AppAssets.svgs.test_image,
    AppAssets.svgs.test_image,
  ];

  @override
  void onInit() {
    super.onInit();
    pageController.addListener(() {
      final newPage = pageController.page?.round() ?? 0;
      if (currentPage.value != newPage) {
        currentPage.value = newPage;
      }
    });
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }
}
