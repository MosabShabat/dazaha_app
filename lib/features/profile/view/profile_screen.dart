import 'package:dazaha_app/core/constant/exports_libraries.dart';
import 'package:dazaha_app/core/constant/exports_widgets.dart';
import 'package:dazaha_app/features/profile/widgets/profile_app_bar_widget.dart';
import 'package:dazaha_app/features/profile/widgets/profile_list_view_items_widget.dart';
import 'package:dazaha_app/features/profile/widgets/top_container_widget.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colorsCustom.surfacePrimaryWhite,
      appBar: ProfileAppBarWidget(context),
      body: Column(
        children: [
          verticalSpace(20.h),
          TopContainerWidget(context),
          verticalSpace(20.h),
          //ListProfileIcons
          ProfileListViewItemsWidget(context),
          Text(
            'PersonScreen',
            style: context.textStyles.headlineSmall.extraBold.copyWith(
              color: context.colorsCustom.TextPrimary,
            ),
          ),
        ],
      ),
    );
  }
}
