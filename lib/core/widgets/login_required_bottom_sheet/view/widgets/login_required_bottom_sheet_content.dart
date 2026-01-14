import '../../../../../../core/helpers/constants.dart';

import '../../../../../../core/constant/exports_widgets.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../../../core/widgets/app_text_button.dart';
import 'package:lottie/lottie.dart';
import '../../../../../../core/theming/app_text_styles.dart';
import '../../../../../../core/widgets/app_drag_indicator_bottom_sheet.dart';
import '../../../../../features/choose_the_service/controller/order_data_controller.dart';
import '../../controller/login_required_bottom_sheet_controller.dart';

class LoginRequiredBottomSheetContent extends StatelessWidget {
  final typeSelected;

  LoginRequiredBottomSheetContent({super.key, this.typeSelected});

  late final LoginRequiredBottomSheetController _controller;

  @override
  Widget build(BuildContext context) {
    _controller = Get.put(LoginRequiredBottomSheetController());
    final orderDataController = Get.find<OrderDataController>();

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 8.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          verticalSpace(15),
          AppBuildDragIndicatorBottomSheet(context),
          verticalSpace(16),
          _buildHeader(context),
          verticalSpace(12),
          Center(
            child: Lottie.asset(
              AppAssets.json.jsonLoginRequired,
              width: 150,
              height: 150,
              fit: BoxFit.fill,
            ),
          ),
          verticalSpace(16),
          _buildCenterText(context),
          verticalSpace(50),
          AppTextButton(
            context,
            buttonText: context.login,
            onPressed: () {
              AppConstants.typeItemSelected = '${typeSelected}';
              orderDataController.setTypeItemSelected('${typeSelected}');
              print(
                '====================111111111111111111111111==========================',
              );
              print(
                'AppConstants.typeItemSelected : ${AppConstants.typeItemSelected}',
              );
              print(
                '=====================111111111111111111111111=========================',
              );

              _controller.login();
            },
          ),
          verticalSpace(12),
          AppTextButton(
            context,
            buttonText: context.no,
            onPressed: () => Get.back(),
            backgroundColor: context.colorsCustom.moreLightGray,
            textStyle: AppTextStyles.font16Black500Medium(context),
          ),
          verticalSpace(24),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Text(
      context.login,
      style: AppTextStyles.font14Black700Bold(context),
    );
  }

  Widget _buildCenterText(BuildContext context) {
    return Center(
      child: Text(
        context.mustLogin,
        style: AppTextStyles.font16Black500Medium(context),
      ),
    );
  }
}
