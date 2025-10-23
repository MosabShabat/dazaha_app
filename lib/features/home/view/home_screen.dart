import '../../../core/helpers/constants.dart';

import '../../../core/constant/exports_libraries.dart';
import '../../../core/routes/app_routes.dart';
import '../../../core/routes/routes.dart';
import '../controller/home_controller.dart';
import '../widgets/custom_bottom_navigation_bar.dart';

// ignore: must_be_immutable
class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final HomeController navigationController = Get.find();

  final List<String> pagesRoutes = [
    Routes.homePageScreen,
    Routes.transportationAndDeliveryScreen,
    Routes.chooseTheServiceScreen,
    AppConstants.isDriver == 1
        ? Routes.documentScreen
        : AppConstants.isDriver == 2
        ? Routes.captainMembershipRequestScreen
        : Routes.captainJoinsScreen,
    Routes.profileScreen,
  ];

  DateTime? _lastBackPressed;

  @override
  Widget build(BuildContext context) {
    // إذا وصلنا arguments فيها selectedIndex نحدثه
    final args = Get.arguments;
    if (args != null && args['selectedIndex'] != null) {
      navigationController.selectedIndex.value = args['selectedIndex'];
    }

    return WillPopScope(
      onWillPop: () async {
        // إذا المستخدم ليس في الصفحة الرئيسية (index 0)، نرجعه للصفحة الرئيسية
        if (navigationController.selectedIndex.value != 0) {
          navigationController.selectedIndex.value = 0;
          return false;
        }

        // التحقق من الضغط المزدوج للخروج
        final now = DateTime.now();
        if (_lastBackPressed == null ||
            now.difference(_lastBackPressed!) > const Duration(seconds: 2)) {
          _lastBackPressed = now;

          // عرض Toast باستخدام showToast من Controller
          navigationController.showToast(
            context,
            "اضغط مرة أخرى للخروج من التطبيق",
            Colors.black87,
          );

          return false; // لا تخرج بعد الضغط الأول
        }

        return true; // خروج بعد الضغط الثاني
      },
      child: Scaffold(
        body: Obx(() {
          final currentPage =
              pagesRoutes[navigationController.selectedIndex.value];
          return Navigator(
            key: GlobalKey<NavigatorState>(), // يحافظ على حالة Navigator
            onGenerateRoute: (settings) {
              final pageConfig = AppRouter().routes.firstWhere(
                (route) => route.name == currentPage,
              );

              return GetPageRoute(
                routeName: currentPage,
                page: pageConfig.page,
                binding: pageConfig.binding,
              );
            },
          );
        }),
        bottomNavigationBar: Obx(() {
          // إذا كنا في صفحة chooseTheServiceScreen نخفي البار
          if (navigationController.selectedIndex.value == 2 ||
              (AppConstants.isDriver != 1 &&
                  navigationController.selectedIndex.value == 3)) {
            return SizedBox.shrink();
          }
          return Theme(
            data: Theme.of(context).copyWith(
              splashFactory: NoSplash.splashFactory,
              highlightColor: Colors.transparent,
              splashColor: Colors.transparent,
              hoverColor: Colors.transparent,
            ),
            child: CustomBottomNavigationBar(),
          );
        }),
      ),
    );
  }
}
