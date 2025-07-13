import 'package:dazaha_app/core/constant/exports_libraries.dart';
import 'package:dazaha_app/core/helpers/app_assets.dart';

final List<BottomNavigationBarItem> navBarsItems = [
  BottomNavigationBarItem(
    label: '',
    icon: SvgPicture.asset(AppAssets.svgs.home),
    activeIcon: SvgPicture.asset(AppAssets.svgs.home_bold),
  ),
  BottomNavigationBarItem(
    label: '',
    icon: SvgPicture.asset(AppAssets.svgs.box),
    activeIcon: SvgPicture.asset(AppAssets.svgs.box_bold),
  ),
  BottomNavigationBarItem(
    label: '',
    icon: Container(
      // color: redColor,
      // padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Color(0xFF119892).withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 6,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: SvgPicture.asset(
        AppAssets.svgs.Frame20,
        width: 40.w,
        height: 40.w,
      ),
    ),
    activeIcon: Container(
      // padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Color(0xFF119892).withOpacity(0.05),
            spreadRadius: 2,
            blurRadius: 6,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: SvgPicture.asset(
        AppAssets.svgs.Frame20,
        width: 40.w,
        height: 40.w,
      ),
    ),
  ),

  BottomNavigationBarItem(
    label: '',
    icon: SvgPicture.asset(AppAssets.svgs.document),
    activeIcon: SvgPicture.asset(AppAssets.svgs.document_bold),
  ),
  BottomNavigationBarItem(
    label: '',
    icon: SvgPicture.asset(AppAssets.svgs.Group120788),
    activeIcon: SvgPicture.asset(AppAssets.svgs.user_bold),
  ),
];
