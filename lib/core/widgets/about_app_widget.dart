import '../../../../core/constant/exports_libraries.dart';
import '../../../../core/constant/exports_widgets.dart';
import '../../../../core/helpers/constants.dart';
import '../../../../core/widgets/app_shimmers/custom_shimmer.dart';
import '../../../../features/auth/terms_and_conditions/controller/terms_and_conditions_controller.dart';
import 'package:flutter_html/flutter_html.dart';

Widget buildTitle(BuildContext context, String infoType) {
  String titleText;
  if (infoType == AppConstants.aboutApplication) {
    titleText = context.aboutTheApp;
  } else if (infoType == AppConstants.privacyPolicy) {
    titleText = context.privacyPolicy;
  } else if (infoType == AppConstants.termsConditions) {
    titleText = context.termsAndConditions;
  } else {
    titleText = '';
  }
  return Text(
    titleText,
    style: context.textStyles.bodySmall.medium.copyWith(
      color: context.colorsCustom.TextPrimary,
    ),
  );
}

Widget buildDescription(
  BuildContext context, {
  required TermsAndConditionsController DescriptionController,
}) {
  return Obx(() {
    return DescriptionController.isLoading.isTrue
        ? SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: List.generate(15, (index) {
                return CustomShimmer(
                  width: index % 2 == 0 ? 300.w : 100.w,
                  height: index % 2 == 0 ? 10.h : 5.h,
                ).paddingSymmetric(vertical: 15.h, horizontal: 0.w);
              }),
            ),
          )
        : Html(
            data: DescriptionController.appInfo?.value.description ?? '',
            style: {"*": Style(fontFamily: 'Tajawal', fontSize: FontSize(14))},
          );
  });
}
