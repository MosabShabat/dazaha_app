import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../helpers/app_assets.dart';
import 'progress_controller.dart';

Widget ProgressView(BuildContext context) {
  final ProgressController _progressController = Get.find();
  return Obx(() {
    return Center(
      child: Transform.rotate(
        angle: _progressController.rotationAngle.value * (3.14159 / 180),
        child: SvgPicture.asset(
          AppAssets.svgs.icLogo,
          width: 50,
          height: 50,
        ),
      ),
    );
  });
}
