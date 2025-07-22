import 'package:dazaha_app/core/constant/exports_libraries.dart';
import 'package:dazaha_app/core/constant/exports_widgets.dart';
import 'package:dazaha_app/features/select_store_name/widgets/snack_bar_widget.dart';

Future<dynamic> MyOfferToCustomerWidget(
  BuildContext context, {
  required IsShowRow,
  required title,
}) {
  return showModalBottomSheet(
    context: context,
    isScrollControlled: false,
    backgroundColor: Colors.transparent,
    builder: (context) {
      // Start the delayed close
      Future.delayed(const Duration(seconds: 3), () {
        if (Navigator.of(context).canPop()) {
          Navigator.of(context).pop();
        }
      });
      return deleteConfirmationBottomSheet(
        context,
        buttonText: context.myOffers,
        isShow: false,
        onTap: () {},
        title: title,
        isShowRow: IsShowRow,
      );
    },
  );
}
