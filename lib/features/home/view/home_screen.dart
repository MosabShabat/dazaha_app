import '../../../core/constant/exports_widgets.dart';
import '../../../core/constant/exports_libraries.dart';
import '../../../core/widgets/app_delete_bottom_sheet/widgets/no_connection_text_widget.dart';
import '../../home_page/controller/home_page_controller.dart';
import '../controller/home_controller.dart';
import '../widgets/custom_bottom_navigation_bar.dart';

// ignore: must_be_immutable
class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final HomeController navigationController = Get.find();
  final HomePageController homeController = Get.find();

  final List<String> pagesRoutes = [
    Routes.homePageScreen,
    Routes.transportationAndDeliveryScreen,
    Routes.chooseTheServiceScreen,
    Routes.documentScreen,
    Routes.profileScreen,
  ];

  DateTime? _lastBackPressed;

  @override
  Widget build(BuildContext context) {
    navigationController.updateStatusBar(0);
    final args = Get.arguments;
    int? tabIndex;

    if (args != null) {
      if (args['selectedIndex'] != null) {
        navigationController.selectedIndex.value =
            int.tryParse(args['selectedIndex'].toString()) ?? 0;
      }

      if (args['tabIndex'] != null) {
        tabIndex = int.tryParse(args['tabIndex'].toString()) ?? 0;
      }
    }
    // حفظ tabIndex في HomeController ليتم تمريره لاحقًا
    if (tabIndex != null) {
      navigationController.extraTabIndex.value = tabIndex;
    }

    return WillPopScope(
      onWillPop: () async {
        if (navigationController.selectedIndex.value != 0) {
          navigationController.selectedIndex.value = 0;
          return false;
        }

        final now = DateTime.now();
        if (_lastBackPressed == null ||
            now.difference(_lastBackPressed!) > const Duration(seconds: 2)) {
          _lastBackPressed = now;
          navigationController.showToast(
            context,
            context.tapAgainToExitTheApp,
            Colors.black87,
          );
          return false;
        }
        return true;
      },
      child: Obx(() {
        // إذا لا يوجد إنترنت → يظهر فقط NoConnectionTextWidget
        if (navigationController.isOffline.value) {
          return Scaffold(body: NoConnectionTextWidget(context));
        }

        // الإنترنت موجود → صفحة التطبيق مع BottomNavigationBar
        final currentPage =
            pagesRoutes[navigationController.selectedIndex.value];

        return Scaffold(
          body: Navigator(
            key: GlobalKey<NavigatorState>(),
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
          ),
          bottomNavigationBar: Obx(() {
            if (navigationController.selectedIndex.value == 2) {
              return const SizedBox.shrink();
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
        );
      }),
    );
  }
}
