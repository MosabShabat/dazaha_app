import '../../../core/constant/exports_libraries.dart';
import '../../../core/constant/exports_widgets.dart';
import '../../../../core/widgets/app_progress_loading/progress_controller.dart';

Widget ProgressViewWhite(
  BuildContext context,
  bool isWhite, {
  double width = 20.0,
  double height = 20.0,
}) {
  final ProgressController _progressController = Get.find();
  return Obx(() {
    return Center(
      child: Transform.rotate(
        angle: _progressController.rotationAngle.value * (3.14159 / 180),
        child:
            //  isWhite
            //     ?
            CircularProgressIndicator(
              strokeWidth: 2.w,
              color: isWhite
                  ? Colors.white
                  : context.colorsCustom.TealGreenSecondary,
            ).box.size(width, width).make(),
        //  SvgPicture.asset(
        //     AppAssets.svgs.icLogoWhite,
        //     width: width,
        //     height: height,
        //   )
        // : CircularProgressIndicator(
        //     strokeWidth: 3.w,
        //     color: context.colorsCustom.TealGreenSecondary,
        //   ),
        // SvgPicture.asset(
        //     AppAssets.svgs.icLogoWhite,
        //     width: width,
        //     height: height,
        //     color: context.colorsCustom.TealGreenSecondary,
        //   ),
      ),
    );
  });
}
