import 'dart:developer';
import '../../../../core/network/models/faq/faq_model.dart';
import '../../../../core/network/models/faq/faq_model_item.dart';
import '../../../../core/network/utils/api_result.dart';
import '../../../../../core/widgets/app_snackbar.dart';
import '../../../core/constant/exports_libraries.dart';
import 'faq_repo.dart';

class FAQController extends GetxController {
  final FaqRepo _faqRepo = Get.find<FaqRepo>();
  RxBool isLoading = true.obs;
  Rx<FaqModel>? faqModel;

  var faqModelItems = <FaqModelItem>[].obs;
  var isExpanded = <bool>[].obs;

  @override // ✅ مهم جدًا
  void onInit() {
    super.onInit();
    getFAQ();
  }

  void getFAQ() async {
    isLoading.value = true;
    final result = await _faqRepo.getFAQ();
    result.when(
      success: (response) {
        isLoading.value = false;
        if (response.status == true) {
          if (response.data != null) {
            faqModel = FaqModel.fromJson(
              response.data as Map<String, dynamic>,
            ).obs;

            faqModelItems.assignAll(faqModel!.value.faqModelItem ?? []);
            isExpanded.assignAll(
              List.generate(faqModelItems.length, (_) => false),
            );

            log('faqModelItems.length ${faqModelItems.length}');
          }
        } else {
          showErrorSnackbar(
            Get.context!,
            response.message ?? '',
            FirstColor: Colors.red,
          );
        }
      },
      failure: (error) {
        isLoading.value = false;
        showSnackbarErrorApi(Get.context!, [error], null);
      },
    );
  }

  void toggleExpanded(int index) {
    isExpanded[index] = !isExpanded[index];
  }
}
//countries_item_model