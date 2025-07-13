import 'package:dazaha_app/core/constant/exports_libraries.dart';
import 'package:dazaha_app/core/constant/exports_widgets.dart';
import 'package:lottie/lottie.dart';

Widget TopEnmWidget(BuildContext context) {
  return Positioned(
    top: -220.h,
    left: 0,
    right: 0,
    child: Lottie.asset(AppAssets.json.done_json),

  );
}
