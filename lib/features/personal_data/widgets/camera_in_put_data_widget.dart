import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:dotted_decoration/dotted_decoration.dart';
import '../../../../core/constant/exports_libraries.dart';
import '../../../core/constant/exports_widgets.dart';
import '../../../core/helpers/app_shared_methods.dart';
import '../controller/personal_data_controller.dart';

/// دالة عامة لبناء واجهة اختيار الصورة (ID أو السيارة)
Widget _buildCameraInputWidget(
  BuildContext context, {
  required String title,
  required Rx<dynamic> imageRx,
  required Function(File) onImageSelected,
}) {
  void _pickImage() {
    AppSharedMethods.showImageSourceOptions(
      context: context,
      onImageSelected: (ImageSource source) async {
        final picked = await ImagePicker().pickImage(source: source);
        if (picked != null) onImageSelected(File(picked.path));
      },
    );
  }

  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        title,
        style: context.textStyles.bodyMedium.medium.copyWith(
          color: context.colorsCustom.TextPrimary,
        ),
      ),
      verticalSpace(10.h),
      Obx(() {
        final selected = imageRx.value;
        if (selected is File) {
          return Container(
            width: Width.w,
            height: 180.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.r),
              color: context.colorsCustom.CardBorder,
              image: DecorationImage(
                image: FileImage(selected),
                fit: BoxFit.fill,
              ),
            ),
          );
        }
        return Container(
          width: Width.w,
          height: 180.h,
          decoration: DottedDecoration(
            borderRadius: BorderRadius.circular(8.r),
            color: context.colorsCustom.CardBorder,
            shape: Shape.box,
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  AppAssets.svgs.gallery_add_icon,
                  width: 32.w,
                  height: 32.h,
                ),
                verticalSpace(5.h),
                Text(
                  context.addAPhoto,
                  style: context.textStyles.bodySmall.medium.copyWith(
                    color: context.colorsCustom.TextSecondary,
                  ),
                ),
              ],
            ).onTap(_pickImage),
          ),
        );
      }),
    ],
  );
}

/// واجهة اختيار صورة الهوية أو الإقامة
Widget CameraInPutDataIdImageWidget(
  BuildContext context, {
  required String title,
  required PersonalDataController controller,
}) => _buildCameraInputWidget(
  context,
  title: title,
  imageRx: controller.selectedIdImage,
  onImageSelected: controller.selectedIdImage,
);

/// واجهة اختيار صورة المركبة
Widget CameraInPutDataVehicleImageWidget(
  BuildContext context, {
  required String title,
  required PersonalDataController controller,
}) => _buildCameraInputWidget(
  context,
  title: title,
  imageRx: controller.selectedVehicleImage,
  onImageSelected: controller.selectedVehicleImage,
);
