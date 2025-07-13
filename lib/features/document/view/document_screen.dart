import 'package:dazaha_app/core/constant/exports_libraries.dart';
import 'package:dazaha_app/core/helpers/theme_exports.dart';
import 'package:dazaha_app/core/widgets/general_screen_widget.dart';

class DocumentScreen extends StatelessWidget {
  const DocumentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colorsCustom.surfacePrimaryWhite,
      body: GeneralScreenWidget(
        context,
        wid: [
          Text(
            'DocumentScreen',
            style: context.textStyles.headlineSmall.extraBold.copyWith(
              color: context.colorsCustom.TextPrimary,
            ),
          ),
        ],
      ),
    );
  }
}
