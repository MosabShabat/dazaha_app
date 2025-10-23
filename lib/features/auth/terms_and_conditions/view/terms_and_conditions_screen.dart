import '../../../../core/helpers/constants.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/helpers/theme_exports.dart';
import '../../../../core/widgets/about_app_widget.dart';
import '../../../../core/widgets/def_app_bar_widget.dart';
import '../../../../features/auth/terms_and_conditions/controller/terms_and_conditions_controller.dart';
import '../../../../core/constant/exports_libraries.dart';

class TermsAndConditionsScreen extends StatelessWidget {
  final String infoType;
  final TermsAndConditionsController _controller = Get.put(
    TermsAndConditionsController(),
  );

  TermsAndConditionsScreen({required this.infoType});
  @override
  Widget build(BuildContext context) {
    if (infoType == AppConstants.aboutApplication) {
      _controller.aboutApp();
    } else if (infoType == AppConstants.privacyPolicy) {
      _controller.privacyPolicy();
    } else if (infoType == AppConstants.termsConditions) {
      _controller.termsConditions();
    }
    AppConstants.statusBar();

    return Scaffold(
      appBar: DefAppBarWidget(context),
      body: SafeArea(
        child: Container(
          width: Width.w,
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          context.termsAndConditions,
                          style: context.textStyles.headlineSmall.extraBold
                              .copyWith(
                                color: context.colorsCustom.TextPrimary,
                              ),
                        ),
                        verticalSpace(25.h),
                        buildTitle(context, infoType),
                        verticalSpace(12),
                        buildDescription(
                          context,
                          DescriptionController: _controller,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
