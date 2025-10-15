import '../../../../core/constant/exports_libraries.dart';
import '../../../../core/constant/exports_widgets.dart';
import '../../../../core/helpers/constants.dart';
import '../../../../core/widgets/about_app_widget.dart';
import '../../../../core/widgets/general_screen_widget.dart';
import '../../../../features/auth/terms_and_conditions/controller/terms_and_conditions_controller.dart';
import '../../../../features/user_info/widgets/user_info_app_bar_widget.dart';

class AboutTheApplicationScreen extends StatelessWidget {
  AboutTheApplicationScreen({super.key});
  final TermsAndConditionsController _controller = Get.find();

  @override
  Widget build(BuildContext context) {
    _controller.aboutApp();
    return Scaffold(
      backgroundColor: context.colorsCustom.surfacePrimaryWhite,
      appBar: UserInfoAppBarWidget(
        Height: Width * 0.25,
        context,
        widget: Text(
          context.aboutTheApp,
          style: context.textStyles.bodyLarge.bold.copyWith(
            color: context.colorsCustom.TextPrimary,
            fontSize: 20.sp,
          ),
        ),
      ),
      body: GeneralScreenWidget(
        context,
        wid: [
          verticalSpace(20.h),
          buildTitle(context, AppConstants.aboutApplication),
          verticalSpace(12),
          buildDescription(context, DescriptionController: _controller),
        ],
      ),
    );
  }
}
