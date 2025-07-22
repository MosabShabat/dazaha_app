import 'package:dazaha_app/core/constant/exports_libraries.dart';
import 'package:dazaha_app/core/constant/exports_widgets.dart';
import 'package:dazaha_app/core/widgets/bottom_navigation_bar_widget.dart';
import 'package:dazaha_app/core/widgets/general_screen_widget.dart';
import 'package:dazaha_app/features/home/view/home_screen.dart';
import 'package:dazaha_app/features/user_info/widgets/profile_image_widget.dart';
import 'package:dazaha_app/features/user_info/widgets/profile_info_edit_widget.dart';
import 'package:dazaha_app/features/user_info/widgets/user_info_app_bar_widget.dart';

class UserInfoScreen extends StatelessWidget {
  const UserInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colorsCustom.surfacePrimaryWhite,
      appBar: UserInfoAppBarWidget(Height:  Width * 0.25,
        context,
        widget: Text(
          context.personalInformation,
          style: context.textStyles.bodyLarge.bold.copyWith(
            color: context.colorsCustom.TextPrimary,
            fontSize: 20.sp,
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBarWidget(
        text: context.saveChanges,
        context,
        GetScreen: () {
          Get.offAll(
            HomeScreen(initialTabIndex: 4),
            transition: Transition.upToDown,
          );
        },
      ),
      body: GeneralScreenWidget(
        context,
        wid: [
          ProfileImageWidget(context),
          verticalSpace(20.h),
          ProfileInfoEditWidget(context,isShow: true),
        ],
      ),
    );
  }
}
