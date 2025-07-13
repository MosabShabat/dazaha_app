import 'package:dazaha_app/features/ad_details/bindings/ad_details_bindings.dart';
import 'package:dazaha_app/features/ad_details/view/ad_details_screen.dart';
import 'package:dazaha_app/features/auth/login/binding/login_binding.dart';
import 'package:dazaha_app/features/auth/login/view/login_screen.dart';
import 'package:dazaha_app/features/auth/register/binding/register_binding.dart';
import 'package:dazaha_app/features/auth/register/view/register_screen.dart';
import 'package:dazaha_app/features/auth/terms_and_conditions/bindings/terms_and_conditions_bindings.dart';
import 'package:dazaha_app/features/auth/terms_and_conditions/view/terms_and_conditions_screen.dart';
import 'package:dazaha_app/features/auth/verification_code/binding/verification_code_binding.dart';
import 'package:dazaha_app/features/auth/verification_code/view/verification_code_screen.dart';
import 'package:dazaha_app/features/buy_me/select_a_location_on_the_map/bindings/select_a_location_on_the_map_store_bindings.dart';
import 'package:dazaha_app/features/buy_me/select_store_name/bindings/select_store_name_binding.dart';
import 'package:dazaha_app/features/buy_me/store_name/bindings/buy_me_binding.dart';
import 'package:dazaha_app/features/buy_me/store_name/views/buy_me_screen.dart';
import 'package:dazaha_app/features/buy_me/summary/bindings/summary_binding.dart';
// import 'package:dazaha_app/features/choose_the_service/transportation_and_delivery/ad_details/bindings/ad_details_bindings.dart';
// import 'package:dazaha_app/features/choose_the_service/transportation_and_delivery/ad_details/view/ad_details_screen.dart';
import 'package:dazaha_app/features/advertisement_summary/bindings/advertisement_summary_bindings.dart';
import 'package:dazaha_app/features/advertisement_summary/view/advertisement_summary_screen.dart';
import 'package:dazaha_app/features/booking_date/bindings/booking_date_bindings.dart';
import 'package:dazaha_app/features/booking_date/view/booking_date_screen.dart';
import 'package:dazaha_app/features/choose_the_service/bindings/choose_the_service_bindings.dart';
import 'package:dazaha_app/features/choose_the_service/view/choose_the_service_screen.dart';
import 'package:dazaha_app/features/direct_suppor_map/binding/direct_support_map_binding.dart';
import 'package:dazaha_app/features/direct_suppor_map/views/direct_support_map_screen.dart';
import 'package:dazaha_app/features/direct_support/binding/direct_support_binding.dart';
import 'package:dazaha_app/features/direct_support/views/direct_support_screen.dart';
// import 'package:dazaha_app/features/choose_the_service/transportation_and_delivery/drop_dff_point/bindings/drop_dff_point_bindings.dart';
// import 'package:dazaha_app/features/choose_the_service/transportation_and_delivery/drop_dff_point/view/drop_dff_point_screen.dart';
import 'package:dazaha_app/features/pick_up_method_upon_delivery/bindings/pick_up_method_upon_delivery_bindings.dart';
import 'package:dazaha_app/features/pick_up_method_upon_delivery/view/pick_up_method_upon_delivery_screen.dart';
import 'package:dazaha_app/features/pick_up_point/bindings/pick_up_point_bindings.dart';
import 'package:dazaha_app/features/pick_up_point/view/pick_up_point_screen.dart';
import 'package:dazaha_app/features/price_details/bindings/price_details_bindings.dart';
import 'package:dazaha_app/features/price_details/view/price_details_screen.dart';
import 'package:dazaha_app/features/price_details_review/binding/price_details_review_binding.dart';
import 'package:dazaha_app/features/price_details_review/view/price_details_review_screen.dart';
import 'package:dazaha_app/features/remove_and_recycle_service_features/binding/remove_and_recycle_service_features_binding.dart';
import 'package:dazaha_app/features/remove_and_recycle_service_features/view/remove_and_recycle_service_features_screen.dart';
// import 'package:dazaha_app/features/choose_the_service/transportation_and_delivery/pick_up_point/bindings/pick_up_point_bindings.dart';
// import 'package:dazaha_app/features/choose_the_service/transportation_and_delivery/pick_up_point/view/pick_up_point_screen.dart';
// import 'package:dazaha_app/features/choose_the_service/transportation_and_delivery/price_details/bindings/price_details_bindings.dart';
// import 'package:dazaha_app/features/choose_the_service/transportation_and_delivery/price_details/view/price_details_screen.dart';
import 'package:dazaha_app/features/review_details/bindings/review_details_bindings.dart';
import 'package:dazaha_app/features/review_details/view/review_details_screen.dart';
import 'package:dazaha_app/features/select_a_location_on_the_map/bindings/select_a_location_on_the_map_bindings.dart';
import 'package:dazaha_app/features/select_a_location_on_the_map/view/select_a_location_on_the_map_screen.dart';
import 'package:dazaha_app/features/document/bindings/document_bindings.dart';
import 'package:dazaha_app/features/document/view/document_screen.dart';
import 'package:dazaha_app/features/home/bindings/home_bindings.dart';
import 'package:dazaha_app/features/home/view/home_screen.dart';
import 'package:dazaha_app/features/home_page/bindings/home_page_bindings.dart';
import 'package:dazaha_app/features/home_page/view/home_page_screen.dart';
import 'package:dazaha_app/features/person/bindings/person_bindings.dart';
import 'package:dazaha_app/features/person/view/person_screen.dart';
import 'package:dazaha_app/features/select_a_location_on_the_map_store/view/select_a_location_on_the_map_store_screen.dart';
import 'package:dazaha_app/features/select_store_name/view/select_store_name_screen.dart';
// import 'package:dazaha_app/features/splash/splash_screen.dart';
import 'package:dazaha_app/features/item_ad_details/bindings/item_ad_details_binding.dart';
import 'package:dazaha_app/features/item_ad_details/view/item_ad_details_screen.dart';
import 'package:dazaha_app/features/my_ad_pay_ment/binding/my_ad_pay_ment_binding.dart';
import 'package:dazaha_app/features/my_ad_pay_ment/view/my_ad_pay_ment_screen.dart';
import 'package:dazaha_app/features/my_ads/bindings/transportation_and_delivery_bindings.dart';
import 'package:dazaha_app/features/my_ads/views/transportation_and_delivery_screen.dart';
import 'package:dazaha_app/features/my_ads_details/bindings/my_ads_details_bindings.dart';
import 'package:dazaha_app/features/my_ads_details/view/my_ads_details_screen.dart';
import 'package:dazaha_app/features/price_cat_details/bindings/price_cat_details_binding.dart';
import 'package:dazaha_app/features/price_cat_details/view/price_cat_details_screen.dart';
import 'package:dazaha_app/features/review_pay_ment/binding/review_pay_ment_binding.dart';
import 'package:dazaha_app/features/review_pay_ment/view/review_pay_ment_sreen.dart';
import 'package:dazaha_app/features/summary/view/summary_screen.dart';
import 'package:get/get.dart';
import 'routes.dart';

class AppRouter {
  List<GetPage> get routes => [
    // GetPage(name: Routes.splashScreen, page: () => SplashScreen()),
    GetPage(
      name: Routes.loginScreen,
      page: () => LoginScreen(),
      binding: LoginBinding(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: Routes.registerScreen,
      page: () => RegisterScreen(),
      binding: RegisterBinding(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: Routes.termsAndConditionsScreen,
      page: () => TermsAndConditionsScreen(),
      binding: TermsAndConditionsBindings(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: Routes.homeScreen,
      page: () => HomeScreen(initialTabIndex: 0),
      binding: HomeBindings(),
      transition: Transition.fade,
    ),
    GetPage(
      name: Routes.homePageScreen,
      page: () => HomePageScreen(),
      binding: HomePageBindings(),
      transition: Transition.fade,
    ),
    GetPage(
      name: Routes.transportationAndDeliveryScreen,
      page: () => TransportationAndDeliveryScreen(),
      binding: TransportationAndDeliveryBindings(),
    ),
    GetPage(
      name: Routes.documentScreen,
      page: () => DocumentScreen(),
      binding: DocumentBindings(),
    ),
    GetPage(
      name: Routes.personScreen,
      page: () => PersonScreen(),
      binding: PersonBindings(),
    ),
    GetPage(
      name: Routes.chooseTheServiceScreen,
      page: () => ChooseTheServiceScreen(),
      binding: ChooseTheServiceBindings(),
      transition: Transition.downToUp,
    ),
    GetPage(
      name: Routes.bookingDateScreen,
      page: () => BookingDateScreen(),
      binding: BookingDateBindings(),
      transition: Transition.fade,
    ),
    GetPage(
      name: Routes.reviewPayMentScreen,
      page: () => ReviewPayMentScreen(),
      binding: ReviewPayMentBinding(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: Routes.pickUpMethodUpOnDeliveryScreen,
      page: () => PickUpMethodUpOnDeliveryScreen(),
      binding: PickUpMethodUponDeliveryBindings(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: Routes.myAdPayMentScreen,
      page: () => MyAdPayMentScreen(),
      binding: MyAdPayMentBinding(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: Routes.itemAdDetailsScreen,
      page: () => ItemAdDetailsScreen(),
      binding: ItemAdDetailsBinding(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: Routes.myAdsDetailsScreen,
      page: () => MyAdsDetailsScreen(),
      binding: MyAdsDetailsBindings(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: Routes.advertisementSummaryScreen,
      page: () => AdvertisementSummaryScreen(),
      binding: AdvertisementSummaryBindings(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: Routes.reviewDetailsScreen,
      page: () => ReviewDetailsScreen(),
      binding: ReviewDetailsBindings(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: Routes.selectALocationOnTheMapScreen,
      page: () => SelectALocationOnTheMapScreen(),
      binding: SelectALocationOnTheMapBindings(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: Routes.buyMeScreen,
      page: () => buyMeScreen(),
      binding: BuyMeBinding(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: Routes.selectALocationOnTheMapStoreScreen,
      page: () => SelectALocationOnTheMapStoreScreen(),
      binding: SelectALocationOnTheMapStoreBindings(),
      transition: Transition.rightToLeft,
    ),

    GetPage(
      name: Routes.selectStoreNameScreen,
      page: () => SelectStoreNameScreen(),
      binding: SelectStoreNameBinding(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: Routes.summaryScreen,
      page: () => SummaryScreen(),
      binding: SummaryBinding(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: Routes.verificationCodeScreen,
      page: () => verificationCodeScreen(),
      binding: VerificationCodeBinding(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: Routes.priceCatDetailsScreen,
      page: () => PriceCatDetailsScreen(),
      binding: PriceCatDetailsBinding(),
      transition: Transition.rightToLeft,
    ),

    GetPage(
      name: Routes.directSupportScreen,
      page: () => DirectSupportScreen(),
      binding: DirectSupportBinding(),
      transition: Transition.rightToLeft,
    ),

    GetPage(
      name: Routes.directSupportMapScreen,
      page: () => DirectSupportMapScreen(),
      binding: DirectSupportMapBinding(),
      transition: Transition.rightToLeft,
    ),

    GetPage(
      name: Routes.priceDetailsReviewScreen,
      page: () => PriceDetailsReviewScreen(),
      binding: PriceDetailsReviewBinding(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: Routes.removeAndRecycleServiceFeaturesScreen,
      page: () => RemoveAndRecycleServiceFeaturesScreen(),
      binding: RemoveAndRecycleServiceFeaturesBinding(),

      transition: Transition.downToUp,
    ),
    GetPage(
      name: Routes.pickUpPointScreen,
      page: () => pickUpPointScreen.fromRoute(),
      binding: PickUpPointBindings(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: Routes.adDetailsScreen,
      page: () => AdDetailsScreen.fromRoute(),
      binding: AdDetailsBindings(),
      transition: Transition.rightToLeft,
    ),

    GetPage(
      name: Routes.priceDetailsScreen,
      page: () => PriceDetailsScreen.fromRoute(),
      binding: PriceDetailsBindings(),
      transition: Transition.rightToLeft,
    ),
    //adDetailsScreen
    // GetPage(
    //   name: Routes.moyasarPaymentMethodScreen,
    //   binding: MoyasarPaymentMethodBinding(),
    //   page: () {
    //     final transactionId =
    //         Get.arguments[AppConstants.transactionId] as String;
    //     final publishableApiKey =
    //         Get.arguments[AppConstants.publishableApiKey] as String;
    //     final amount = Get.arguments[AppConstants.amount] as int;
    //     final description = Get.arguments[AppConstants.description] as String?;
    //     final merchantId = Get.arguments[AppConstants.merchantId] as String;
    //     return MoyasarPaymentMethodScreen(
    //       transactionId: transactionId,
    //       publishableApiKey: publishableApiKey,
    //       amount: amount,
    //       description: description,
    //       merchantId: merchantId,
    //     );
    //   },
    //   transition: Transition.noTransition,
    // ),
  ];
}
