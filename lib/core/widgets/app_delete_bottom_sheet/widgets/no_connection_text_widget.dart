import 'package:lottie/lottie.dart';
import '../../../../features/home/controller/home_controller.dart';
import '../../../constant/exports_widgets.dart';
import '../../../constant/exports_libraries.dart';

Widget NoConnectionTextWidget(BuildContext context, HomeController controller) {
  return Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Lottie.asset(
          AppAssets.json.wifiConnect,
          width: 150.w,
          height: 150.h,
          fit: BoxFit.fill,
        ),
        verticalSpace(20.h),
        Text(
          context.noInternetConnection,
          style: context.textStyles.titleLarge.bold.copyWith(
            color: context.colorsCustom.TextPrimary,
          ),
        ),
        verticalSpace(20.h),
        Obx(() {
          return ElevatedButton(
                onPressed: controller.isLoading.value
                    ? null // منع الضغط أثناء التحميل
                    : () async {
                        await controller.checkInternetStatus();
                      },
                style: ElevatedButton.styleFrom(
                  backgroundColor: context
                      .colorsCustom
                      .TealGreenSecondary, // يمكن تعديل اللون حسب التصميم
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                ),
                child: controller.isLoading.value
                    ? SizedBox(
                        width: 20.w,
                        height: 20.h,
                        child: CircularProgressIndicator(
                          color: Colors.white,
                          strokeWidth: 2,
                        ),
                      )
                    : Text(
                        context.update,
                        style: TextStyle(fontSize: 16.sp, color: Colors.white),
                      ),
              ).box
              .width(Width.w)
              .height(56.h)
              .customRounded(BorderRadiusGeometry.circular(8.r))
              .margin(EdgeInsets.symmetric(horizontal: 16.w))
              .color(context.colorsCustom.TealGreenSecondary)
              .make();
        }),
      ],
    ),
  );
}
