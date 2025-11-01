import '../../../../core/constant/exports_libraries.dart';
import '../../../../core/constant/exports_widgets.dart';
import '../../../../core/widgets/general_screen_widget.dart';
import '../../../../features/user_info/widgets/user_info_app_bar_widget.dart';
import '../../../core/widgets/app_loading_button.dart';
import '../controller/report_a_problem_controller.dart';
import '../widgets/report_problem_form.dart';

class ReportAProblemScreen extends StatelessWidget {
  final String referenceType;
  final String referenceUuid;

  ReportAProblemScreen({
    required this.referenceType,
    required this.referenceUuid,
  });

  @override
  Widget build(BuildContext context) {
    ReportAProblemController reportAProblemController = Get.find();
    return Scaffold(
      backgroundColor: context.colorsCustom.surfacePrimaryWhite,
      appBar: UserInfoAppBarWidget(
        context,
        Height: Width * 0.25,
        widget: Text(
          context.reportAProblem,
          style: context.textStyles.bodyLarge.bold.copyWith(
            color: context.colorsCustom.TextPrimary,
            fontSize: 20.sp,
          ),
        ),
      ),
      body: GeneralScreenWidget(
        context,
        wid: [
          ReportProblemForm(reportAProblemController),
          verticalSpace(Height.h / 6),
          _buildSaveButton(context, controller: reportAProblemController),
        ],
      ),
    );
  }

  Widget _buildSaveButton(
    BuildContext context, {
    required ReportAProblemController controller,
  }) {
    return Obx(() {
      return AppLoadingButton(
        text: context.send,
        onPressed: () async {
          controller.validateAndSubmit(referenceType, referenceUuid);
        },
        isLoading: controller.isButtonPressed.value,
        isEnabled: !controller.isButtonPressed.value,

        isWhiteProgress: true,
      );
    });
  }
}
