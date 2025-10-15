import '../../../core/constant/exports_widgets.dart';
import '../../../core/network/utils/api_result.dart';

import '../../../../core/constant/exports_libraries.dart';
import '../../../core/helpers/constants.dart';
import '../../../core/widgets/app_snackbar.dart';
import '../../../core/widgets/app_snackbar_with_button.dart';
import '../../my_offer_ad_details/controller/my_offer_ad_details_controller.dart';
import 'rating_repo.dart';

class PriceDetailsReviewController extends GetxController {
  RxInt selectedRating = 0.obs;
  final RatingRepo _ratingRepo = Get.find<RatingRepo>();
  final MyOfferAdDetailsController _myOfferAdDetailsController = Get.find();

  RxBool isButtonPressed = false.obs;

  Future<void> postRating(BuildContext context) async {
    _setButtonPressed(true);
    try {
      final result = await _ratingRepo.postRating('${selectedRating.value}');
      result.when(
        success: (response) {
          _setButtonPressed(false);
          if (response.status == true) {
            showSnackbarWithButton(
              Get.context!,
              Get.context!.successful,
              AppConstants.success,
              showButton: false,
            );
            AppConstants.orderUuid = AppConstants.orderUuid;
            if (AppConstants.typeReq == 'offer') {
              _myOfferAdDetailsController.onInit();
              Get.toNamed(Routes.myOfferAdDetailsScreen);
            }
          } else {
            showErrorSnackbar(Get.context!, response.message ?? '');
          }
        },
        failure: (error) {
          _setButtonPressed(false);
          showSnackbarErrorApi(Get.context!, [error], null);
        },
      );
    } catch (_) {
      _setButtonPressed(false);
      showErrorSnackbar(context, 'An error occurred');
    }
  }

  void _setButtonPressed(bool value) => isButtonPressed.value = value;
}
