import '../../../core/constant/exports_libraries.dart';
import '../../../core/constant/exports_widgets.dart';
import '../../../features/select_store_name/widgets/snack_bar_widget.dart';

Future<dynamic> MyOfferToCustomerWidget(
  BuildContext context, {
  required IsShowRow,
  required title,
  required onTap,
}) {
  return showModalBottomSheet(
    context: context,
    isScrollControlled: false,
    backgroundColor: Colors.transparent,
    builder: (context) {
      Future.delayed(const Duration(seconds: 3), () {
        Get.back();
      });
      return deleteConfirmationBottomSheet(
        context,
        buttonText: context.myOffers,
        isShow: false,
        onTap: onTap,
        title: title == '1' ? context.yourOfferHasReachedTheCustomer : title,
        isShowRow: IsShowRow,
      );
    },
  );
}
