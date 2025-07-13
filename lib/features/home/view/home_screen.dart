// ignore: must_be_immutable
import 'package:dazaha_app/core/constant/exports_libraries.dart';
import 'package:dazaha_app/core/helpers/theme_exports.dart';
import 'package:dazaha_app/core/routes/routes.dart';
import 'package:dazaha_app/core/widgets/exit_dialog.dart';
import 'package:dazaha_app/core/widgets/nav_bars_items_widget.dart';
import 'package:dazaha_app/features/document/view/document_screen.dart';
import 'package:dazaha_app/features/home_page/view/home_page_screen.dart';
import 'package:dazaha_app/features/person/view/person_screen.dart';
import 'package:dazaha_app/features/my_ads/views/transportation_and_delivery_screen.dart';

// ignore: must_be_immutable
class HomeScreen extends StatefulWidget {
  final int initialTabIndex;

  HomeScreen({Key? key, required this.initialTabIndex}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late RxInt currentIndex;

  @override
  void initState() {
    super.initState();
    currentIndex = widget.initialTabIndex.obs;
  }

  @override
  Widget build(BuildContext context) {
    var navBody = [
      HomePageScreen(),
      TransportationAndDeliveryScreen(),
      Container(),
      DocumentScreen(),
      PersonScreen(),
    ];

    // ignore: deprecated_member_use
    return WillPopScope(
      onWillPop: () async {
        showDialog(
          barrierDismissible: false,
          context: context,
          builder: (context) => exitDialog(context),
        );
        return false;
      },
      child: Obx(() {
        return Scaffold(
          body: Column(
            children: [Expanded(child: navBody.elementAt(currentIndex.value))],
          ),
          bottomNavigationBar: BottomNavigationBar(
            elevation: 0,

            backgroundColor: context.colorsCustom.surfacePrimaryWhite,
            currentIndex: currentIndex.value,
            selectedItemColor: context.colorsCustom.TealGreenSecondary,
            selectedIconTheme: IconThemeData(
              color: context.colorsCustom.TealGreenSecondary,
              size: 35,
            ),
            selectedLabelStyle: context.textStyles.bodyLarge.bold,
            type: BottomNavigationBarType.fixed,
            items: navBarsItems,
            onTap: (value) {
              setState(() {
                if (value == 2) {
                  Get.toNamed(Routes.chooseTheServiceScreen);
                } else {
                  currentIndex.value = value;
                }
              });
            },
          ),
        );
      }),
    );
  }
}
