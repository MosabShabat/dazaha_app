import 'package:dazaha_app/core/constant/exports_libraries.dart';
import 'package:dazaha_app/core/constant/exports_widgets.dart';
import 'package:dazaha_app/core/widgets/def_app_bar_widget.dart';
import 'package:dazaha_app/core/widgets/general_screen_widget.dart';
import 'package:dazaha_app/features/auth/register/widgets/check_box_list_tail_widget.dart';
import 'package:dazaha_app/features/auth/register/widgets/in_put_data_widget.dart';
import 'package:dazaha_app/features/home/view/home_screen.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: context.colorsCustom.surfacePrimaryWhite,
      appBar: DefAppBarWidget(context),
      bottomNavigationBar:
          GeneralBottomAppWidget(
                context,
                text: context.verification,
                onTap: () {
                  Get.off(
                    () => HomeScreen(initialTabIndex: 0),
                    transition: Transition.downToUp,
                  );
                },
              ).box
              .padding(
                EdgeInsetsGeometry.symmetric(horizontal: 16.w, vertical: 20.h),
              )
              .make(),
      body: GeneralScreenWidget(
        context,
        wid: [
          verticalSpace(20.h),
          Text(
            context.registerNewUser,
            style: context.textStyles.headlineSmall.extraBold.copyWith(
              color: context.colorsCustom.surfacePrimaryBlack,
            ),
          ),
          verticalSpace(40.h),
          InPutDataWidget(context),
          CheckBoxListTailWidget(context),
          verticalSpace(0.18.sh),
        ],
      ),
    );
  }
}
