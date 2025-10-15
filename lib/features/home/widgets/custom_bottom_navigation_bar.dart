import '../../../core/constant/exports_libraries.dart';
import '../../../core/constant/exports_widgets.dart';
import '../../../core/theming/app_text_styles.dart';
import '../controller/home_controller.dart';
import 'bottom_navbar_item.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final HomeController navigationController = Get.find();

  CustomBottomNavigationBar({super.key});

  BottomNavigationBarItem _buildNavItem({
    required String asset,
    required String activeAsset,
    required int index,
  }) {
    return BottomNavigationBarItem(
      label: '',
      icon: BottomNavBarItem(
        assetName: asset,
        isSelected: navigationController.selectedIndex.value == index,
      ),
      activeIcon: SvgPicture.asset(activeAsset),
    );
  }

  BottomNavigationBarItem _buildMiddleButton() {
    return BottomNavigationBarItem(
      label: '',
      icon: _buildCircleIcon(0.2),
      activeIcon: _buildCircleIcon(0.05),
    );
  }

  Widget _buildCircleIcon(double opacity) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Color(0xFF119892).withOpacity(opacity),
            spreadRadius: 2,
            blurRadius: 6,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: SvgPicture.asset(
        AppAssets.svgs.Frame20,
        width: 55.w,
        height: 55.w,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => BottomNavigationBar(
        currentIndex: navigationController.selectedIndex.value,
        backgroundColor: context.colorsCustom.surfacePrimaryWhite,
        type: BottomNavigationBarType.fixed,
        selectedLabelStyle: AppTextStyles.font13Primary400Regular(
          context,
          context.colorsCustom.TealGreenSecondary,
        ),
        unselectedLabelStyle: AppTextStyles.font13Black400Regular(context),
        elevation: 0,
        selectedItemColor: context.colorsCustom.TealGreenSecondary,
        onTap: navigationController.onTabChanged,
        items: [
          _buildNavItem(
            asset: AppAssets.svgs.home,
            activeAsset: AppAssets.svgs.home_bold,
            index: 0,
          ),
          _buildNavItem(
            asset: AppAssets.svgs.box,
            activeAsset: AppAssets.svgs.box_bold,
            index: 1,
          ),
          _buildMiddleButton(),
          _buildNavItem(
            asset: AppAssets.svgs.document,
            activeAsset: AppAssets.svgs.document_bold,
            index: 3,
          ),
          _buildNavItem(
            asset: AppAssets.svgs.Group120788,
            activeAsset: AppAssets.svgs.user_bold,
            index: 4,
          ),
        ],
      ),
    );
  }
}
