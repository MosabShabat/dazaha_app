import '../../../core/constant/exports_widgets.dart';
import '../../../../core/widgets/app_progress_loading/progress_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

Widget ProgressViewWhite(
  BuildContext context,
  bool isWhite, {
  double width = 35.0,
  double height = 35.0,
}) {
  final ProgressController _progressController = Get.find();
  return Obx(() {
    return Center(
      child: Transform.rotate(
        angle: _progressController.rotationAngle.value * (3.14159 / 180),
        child: isWhite
            ? SvgPicture.asset(
                AppAssets.svgs.icLogoWhite,
                width: width,
                height: height,
              )
            : SvgPicture.asset(
                AppAssets.svgs.icLogoWhite,
                width: width,
                height: height,
                color: context.colorsCustom.TealGreenSecondary,
              ),
      ),
    );
  });
}
