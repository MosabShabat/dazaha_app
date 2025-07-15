import 'package:dazaha_app/core/constant/exports_widgets.dart';
import 'package:dazaha_app/core/widgets/bottom_navigation_bar_widget.dart';
import 'package:dazaha_app/core/widgets/general_screen_widget.dart';
import 'package:dazaha_app/features/auth/login/widgets/login_text_field_widget.dart';
import 'package:dazaha_app/features/user_info/widgets/user_info_app_bar_widget.dart';
import '../../../core/constant/exports_libraries.dart';

class UpdateMobileNumberScreen extends StatelessWidget {
  const UpdateMobileNumberScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colorsCustom.surfacePrimaryWhite,
      appBar: UserInfoAppBarWidget(
        context,
        widget: Text(
          context.updateMobileNumber,
          style: context.textStyles.bodyLarge.bold.copyWith(
            color: context.colorsCustom.TextPrimary,
            fontSize: 20.sp,
          ),
        ),
      ),
      body: GeneralScreenWidget(
        context,
        wid: [
          Text(
            context.enterTheNewMobileNumberToUpdate,
            style: context.textStyles.bodyMedium.medium.copyWith(
              color: context.colorsCustom.TextSecondary,
            ),
          ),
          verticalSpace(10.h),
          LoginTextFieldWidget(context),
          verticalSpace(40.h),
          BottomNavigationBarWidget(
            text: context.next,
            context,
            GetScreen: () {
              Get.toNamed(Routes.verCodeMobileScreen);
            },
          ),
        ],
      ),
    );
  }
}
