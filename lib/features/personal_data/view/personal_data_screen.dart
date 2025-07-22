import 'package:dazaha_app/core/constant/exports_libraries.dart';
import 'package:dazaha_app/core/constant/exports_widgets.dart';
import 'package:dazaha_app/core/widgets/bottom_navigation_bar_widget.dart';
import 'package:dazaha_app/core/widgets/def_app_bar_widget.dart';
import 'package:dazaha_app/core/widgets/general_screen_widget.dart';
import 'package:dazaha_app/features/auth/register/widgets/check_box_list_tail_widget.dart';
import 'package:dazaha_app/features/personal_data/widgets/camera_in_put_data_widget.dart';
import 'package:dazaha_app/features/personal_data/widgets/plate_number_widget.dart';
import 'package:dazaha_app/features/user_info/widgets/profile_image_widget.dart';
import 'package:dazaha_app/features/user_info/widgets/profile_info_edit_widget.dart';

class PersonalDataScreen extends StatelessWidget {
  const PersonalDataScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefAppBarWidget(context),
      body: GeneralScreenWidget(
        context,
        wid: [
          Text(
            context.personalInformation,
            style: context.textStyles.bodyLarge.bold.copyWith(
              color: context.colorsCustom.TextPrimary,
              fontSize: 20.sp,
            ),
          ),
          verticalSpace(20.h),
          ProfileImageWidget(context),
          verticalSpace(20.h),
          ProfileInfoEditWidget(context, isShow: false),
          verticalSpace(20.h),
          PlateNumberWidget(context),
          CameraInPutDataWidget(context, title: context.iDOrResidencyPhoto),
          verticalSpace(20.h),
          CameraInPutDataWidget(context, title: context.APictureOfTheVehicle),
          verticalSpace(10.h),
          CheckBoxListTailWidget(context),
          verticalSpace(20.h),
          BottomNavigationBarWidget(
            horizontalPadding: 0.0,
            text: context.send,
            context,
            GetScreen: () {
              Get.toNamed(Routes.captainMembershipRequestScreen);
            },
          ),
        ],
      ),
    );
  }
}
