import '../../../core/constant/exports_libraries.dart';
import '../../../core/constant/exports_widgets.dart';
import '../../../core/helpers/app_shared_methods.dart';
import '../../../core/widgets/app_button_back.dart';
import '../../../core/widgets/app_snackbar.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../controller/wallet_controller.dart';

class PaymentWebViewScreen extends StatefulWidget {
  final String paymentUrl;

  const PaymentWebViewScreen({super.key, required this.paymentUrl});

  @override
  State<PaymentWebViewScreen> createState() => _PaymentWebViewScreenState();
}

class _PaymentWebViewScreenState extends State<PaymentWebViewScreen> {
  late final WebViewController _controller;
  bool _isLoading = true;
  final WalletController _walletController = Get.find();

  @override
  void initState() {
    super.initState();

    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageStarted: (url) {
            setState(() => _isLoading = true);
            // 👀 Listen to URL changes
            if (url.contains('/payment/success')) {
              Navigator.of(context).pop();
              _walletController.amountController.clear();
              _walletController.getWallet();
              _walletController.resetControllerState();
              _walletController.refreshController.refreshCompleted();
              showSuccessSnackbar(context, '${context.operationSuccessful}');
            } else if (url.contains('/payment/failure')) {
              Navigator.of(context).pop();
              _walletController.getWallet();
              _walletController.resetControllerState();
              _walletController.refreshController.refreshCompleted();

              showErrorSnackbar(
                context,
                '${context.operationFailedTryAgain}',
                FirstColor: Colors.red,
              );
            }
          },
          onPageFinished: (url) => setState(() => _isLoading = false),
          onWebResourceError: (error) {
            debugPrint("WebView error: $error");
          },
        ),
      )
      ..loadRequest(Uri.parse(widget.paymentUrl));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colorsCustom.surfacePrimaryWhite,
      appBar: AppBar(
        leading: AppButtonBack(
          context: context,
          color: context.colorsCustom.surfacePrimaryWhite,
        ),
        backgroundColor: context.colorsCustom.TealGreenSecondary,
      ),
      body:
          Stack(
                children: [
                  WebViewWidget(controller: _controller),
                  if (_isLoading)
                    Container(
                      width: Width.w,
                      height: Height.h,
                      color: context.colorsCustom.surfacePrimaryWhite,
                      child: Center(
                        child: AppSharedMethods.buildProgressViewWhite(
                          context,
                          false,
                        ),
                      ),
                    ),
                ],
              ).box
              .width(Width.w)
              .height(Height.h)
              .color(context.colorsCustom.surfacePrimaryWhite)
              .make(),
    );
  }
}
