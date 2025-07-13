import 'package:dazaha_app/core/constant/exports_libraries.dart';
import 'package:dazaha_app/core/helpers/theme_exports.dart';
import 'package:dazaha_app/core/widgets/bottom_navigation_bar_widget.dart';
import 'package:dazaha_app/core/widgets/def_app_bar_widget.dart';

import '../../../core/widgets/general_screen_widget.dart';

class SelectALocationOnTheMapScreen extends StatelessWidget {
  const SelectALocationOnTheMapScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colorsCustom.surfacePrimaryWhite,
      appBar: DefAppBarWidget(context),
      bottomNavigationBar: BottomNavigationBarWidget(
        text: context.choice,
        context,
        GetScreen: () {},
      ),

      body: GeneralScreenWidget(context, wid: []),
    );
  }
}
