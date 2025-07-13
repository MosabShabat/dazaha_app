// import 'package:dazaha_app/core/constant/exports_widgets.dart';
// import 'package:dazaha_app/core/constant/exports_libraries.dart';

// class SplashScreen extends StatefulWidget {
//   const SplashScreen({super.key});

//   @override
//   State<SplashScreen> createState() => _SplashScreenState();
// }

// class _SplashScreenState extends State<SplashScreen>
//     with TickerProviderStateMixin {
//   @override
//   void initState() {
//     super.initState();
//     changeScreen();
//   }

//   changeScreen() {
//     Future.delayed(const Duration(seconds: 3), () {
//       Get.offAllNamed(Routes.loginScreen);

//       // Get.offAll(() => LoginScreen(), transition: Transition.fade);
//       // GetStorage().read(
//       //           'token',
//       //         ) ==
//       //         null
//       //     ? Get.offAll(
//       //         () => LoginScreen(),
//       //         transition: Transition.fade,
//       //       )
//       //     : Get.offAll(
//       //         () => HomeScreen(
//       //           initialTabIndex: 0,
//       //         ),
//       //         transition: Transition.fade,
//       //       );
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         width: Width,
//         height: Height,
//         color: context.colorsCustom.surfacePrimaryWhite,
//         child: Center(
//           child: Image.asset(
//             logo_png_app_icon,
//             width: Width / 2,
//             height: Height / 2,
//           ),
//         ),
//       ),
//     );
//   }
// }
