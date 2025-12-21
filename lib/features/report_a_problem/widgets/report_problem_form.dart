import '../../../../core/constant/exports_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../../../core/widgets/add_image_button.dart';
import '../../../core/widgets/image_thumbnail.dart';
import '../../auth/register/widgets/cus_register_info_widget.dart';
import '../controller/report_a_problem_controller.dart';

class ReportProblemForm extends StatelessWidget {
  final ReportAProblemController _reportProblemController;

  const ReportProblemForm(this._reportProblemController);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CusRegisterInfoWidget(
          context,
          titleText: context.problemName,
          titleTextColor: context.colorsCustom.TextPrimary,
          HintText: context.exampleIHaveADeliveryProblem,
          maxLines: 1,
          maxLength: null,
          HintTextColor: context.colorsCustom.TextPrimary,
          fontWeight: FontWeight.w300,
          controller: _reportProblemController.titleController,
        ),
        verticalSpace(10.h),
        _buildDescriptionField(context),
        _buildSelectionImages(context),
      ],
    );
  }

  Widget _buildTitleText(String text) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '${text}',
          style: Get.context!.textStyles.bodyMedium.medium.copyWith(
            color: Get.context!.colorsCustom.TextPrimary,
          ),
        ),
        horizontalSpace(5.w),
        Text(
          '${Get.context!.optional}',
          style: Get.context!.textStyles.bodySmall.regular.copyWith(
            color: Get.context!.colorsCustom.TextSecondary,
          ),
        ),
      ],
    );

    // Text(text, style: AppTextStyles.font12Black500Medium);
  }

  Widget _buildDescriptionField(BuildContext context) {
    return CusRegisterInfoWidget(
      context,
      titleText: context.descriptionOfTheProblem,
      titleTextColor: context.colorsCustom.TextPrimary,
      HintText: context.exampleThereIsAProblem,
      maxLines: 5,
      maxLength: null,
      HintTextColor: context.colorsCustom.TextPrimary,
      fontWeight: FontWeight.w300,
      controller: _reportProblemController.descriptionController,
    );
  }

  Widget _buildSelectionImages(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        verticalSpace(16.h),
        _buildTitleText(context.thePictures),
        verticalSpace(18.h),
        _buildImagePickerSection(),
      ],
    );
  }

  Widget _buildImagePickerSection() {
    return Obx(() {
      return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: SafeArea(
          child: Row(
            children: [
              AddImageButton(
                onImageSelected: (ImageSource source) {
                  _reportProblemController.pickImages(source);
                },
              ),
              horizontalSpace(8),
              ..._buildImageThumbnails(),
            ],
          ),
        ),
      );
    });
  }

  List<Widget> _buildImageThumbnails() {
    return _reportProblemController.listImages.map((image) {
      int index = _reportProblemController.listImages.indexOf(image);
      return Row(
        children: [
          Stack(
            children: [
              ImageThumbnail(
                image: image,
                index: index,
                onRemove: () {
                  _reportProblemController.removeImage(index);
                },
              ),
              Positioned(
                top: 6,
                right: 6,
                child: GestureDetector(
                  onTap: () => _reportProblemController.removeImage(index),
                  child: SvgPicture.asset(AppAssets.svgs.icClose),
                ),
              ),
            ],
          ),
          horizontalSpace(8),
        ],
      );
    }).toList();
  }
}
