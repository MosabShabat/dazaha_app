import 'package:dazaha_app/features/about_the_application/binding/about_the_application_binding.dart';
import 'package:dazaha_app/features/about_the_application/view/about_the_application_screen.dart';
import 'package:dazaha_app/features/ad_details/bindings/ad_details_bindings.dart';
import 'package:dazaha_app/features/ad_details/view/ad_details_screen.dart';
import 'package:dazaha_app/features/add_a_delivery_address/bindings/add_a_delivery_address_bindings.dart';
import 'package:dazaha_app/features/add_a_delivery_address/view/add_a_delivery_address_screen.dart';
import 'package:dazaha_app/features/add_cus_loac/binding/add_cus_loac_binding.dart';
import 'package:dazaha_app/features/add_cus_loac/view/add_cus_loac_screen.dart';
import 'package:dazaha_app/features/all_ads/binding/all_ads_binding.dart';
import 'package:dazaha_app/features/all_ads/view/all_ads_screen.dart';
import 'package:dazaha_app/features/auth/login/binding/login_binding.dart';
import 'package:dazaha_app/features/auth/login/view/login_screen.dart';
import 'package:dazaha_app/features/auth/register/binding/register_binding.dart';
import 'package:dazaha_app/features/auth/register/view/register_screen.dart';
import 'package:dazaha_app/features/auth/terms_and_conditions/bindings/terms_and_conditions_bindings.dart';
import 'package:dazaha_app/features/auth/terms_and_conditions/view/terms_and_conditions_screen.dart';
import 'package:dazaha_app/features/auth/verification_code/binding/verification_code_binding.dart';
import 'package:dazaha_app/features/auth/verification_code/view/verification_code_screen.dart';
import 'package:dazaha_app/features/balance_withdrawal_request/binding/balance_withdrawal_request_binding.dart';
import 'package:dazaha_app/features/balance_withdrawal_request/view/balance_withdrawal_request_screen.dart';
// import 'package:dazaha_app/features/buy_me/select_a_location_on_the_map/bindings/select_a_location_on_the_map_store_bindings.dart';
// import 'package:dazaha_app/features/buy_me/select_store_name/bindings/select_store_name_binding.dart';
// import 'package:dazaha_app/features/buy_me/store_name/bindings/buy_me_binding.dart';
// import 'package:dazaha_app/features/buy_me/store_name/views/buy_me_screen.dart';
// import 'package:dazaha_app/features/buy_me/summary/bindings/summary_binding.dart';
import 'package:dazaha_app/features/advertisement_summary/bindings/advertisement_summary_bindings.dart';
import 'package:dazaha_app/features/advertisement_summary/view/advertisement_summary_screen.dart';
import 'package:dazaha_app/features/booking_date/bindings/booking_date_bindings.dart';
import 'package:dazaha_app/features/booking_date/view/booking_date_screen.dart';
// import 'package:dazaha_app/features/buy_me/store_name/bindings/buy_me_binding.dart';
import 'package:dazaha_app/features/captain_joins/binding/captain_joins_binding.dart';
import 'package:dazaha_app/features/captain_joins/view/captain_joins_screen.dart';
import 'package:dazaha_app/features/captain_membership_request/binding/captain_membership_request_binding.dart';
import 'package:dazaha_app/features/captain_membership_request/view/captain_membership_request_screen.dart';
import 'package:dazaha_app/features/choose_the_service/bindings/choose_the_service_bindings.dart';
import 'package:dazaha_app/features/choose_the_service/view/choose_the_service_screen.dart';
import 'package:dazaha_app/features/direct_suppor_map/binding/direct_support_map_binding.dart';
import 'package:dazaha_app/features/direct_suppor_map/views/direct_support_map_screen.dart';
import 'package:dazaha_app/features/direct_support/binding/direct_support_binding.dart';
import 'package:dazaha_app/features/direct_support/views/direct_support_screen.dart';
import 'package:dazaha_app/features/my_offer_ad_details/bindings/my_offer_ad_details_binding.dart';
import 'package:dazaha_app/features/my_offer_ad_details/view/my_offer_ad_details_screen.dart';
import 'package:dazaha_app/features/notifications/binding/notifications_binding.dart';
import 'package:dazaha_app/features/notifications/view/notifications_screen.dart';
import 'package:dazaha_app/features/personal_data/binding/personal_data_binding.dart';
import 'package:dazaha_app/features/personal_data/view/personal_data_screen.dart';
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
import 'package:dazaha_app/features/report_a_problem/binding/report_a_problem_binding.dart';
import 'package:dazaha_app/features/report_a_problem/view/report_a_problem_screen.dart';
import 'package:dazaha_app/features/report_a_problem_chat_support/binding/report_a_problem_chat_support_binding.dart';
import 'package:dazaha_app/features/report_a_problem_chat_support/view/report_a_problem_chat_support_screen.dart';
import 'package:dazaha_app/features/report_review_details/binding/report_review_details_binding.dart';
import 'package:dazaha_app/features/report_review_details/view/report_review_details_screen.dart';
import 'package:dazaha_app/features/review_details/bindings/review_details_bindings.dart';
import 'package:dazaha_app/features/review_details/view/review_details_screen.dart';
import 'package:dazaha_app/features/saved_delivery_addresses/binding/saved_delivery_addresses_binding.dart';
import 'package:dazaha_app/features/saved_delivery_addresses/view/saved_delivery_addresses_screen.dart';
import 'package:dazaha_app/features/select_a_location_on_the_map/bindings/select_a_location_on_the_map_bindings.dart';
import 'package:dazaha_app/features/select_a_location_on_the_map/view/select_a_location_on_the_map_screen.dart';
import 'package:dazaha_app/features/document/bindings/document_bindings.dart';
import 'package:dazaha_app/features/document/view/document_screen.dart';
import 'package:dazaha_app/features/home/bindings/home_bindings.dart';
import 'package:dazaha_app/features/home/view/home_screen.dart';
import 'package:dazaha_app/features/home_page/bindings/home_page_bindings.dart';
import 'package:dazaha_app/features/home_page/view/home_page_screen.dart';
import 'package:dazaha_app/features/profile/bindings/profile_bindings.dart';
import 'package:dazaha_app/features/profile/view/profile_screen.dart';
import 'package:dazaha_app/features/select_a_location_on_the_map_store/bindings/select_a_location_on_the_map_store_bindings.dart';
import 'package:dazaha_app/features/select_a_location_on_the_map_store/view/select_a_location_on_the_map_store_screen.dart';
import 'package:dazaha_app/features/select_store_name/bindings/select_store_name_binding.dart';
import 'package:dazaha_app/features/select_store_name/view/select_store_name_screen.dart';
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
import 'package:dazaha_app/features/store_name/bindings/buy_me_binding.dart';
import 'package:dazaha_app/features/store_name/views/buy_me_screen.dart';
import 'package:dazaha_app/features/summary/bindings/summary_binding.dart';
import 'package:dazaha_app/features/summary/view/summary_screen.dart';
import 'package:dazaha_app/features/summary_my_ad_det/binding/summary_my_ad_det_binding.dart';
import 'package:dazaha_app/features/summary_my_ad_det/view/summary_my_ad_det_screen.dart';
import 'package:dazaha_app/features/update_mobile_number/binding/update_mobile_number_binding.dart';
import 'package:dazaha_app/features/update_mobile_number/view/update_mobile_number_screen.dart';
import 'package:dazaha_app/features/user_info/binding/user_info_binding.dart';
import 'package:dazaha_app/features/user_info/view/user_info_screen.dart';
import 'package:dazaha_app/features/ver_code_mobile/binding/ver_code_mobile_binding.dart';
import 'package:dazaha_app/features/ver_code_mobile/view/ver_code_mobile_screen.dart';
import 'package:dazaha_app/features/wallet/binding/wallet_binding.dart';
import 'package:dazaha_app/features/wallet/view/wallet_screen.dart';
import 'package:dazaha_app/features/we_are_here_to_help/binding/we_are_here_to_help_binding.dart';
import 'package:dazaha_app/features/we_are_here_to_help/view/we_are_here_to_help_screen.dart';
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
      name: Routes.profileScreen,
      page: () => ProfileScreen(),
      binding: ProfileBindings(),
    ),
    GetPage(
      name: Routes.chooseTheServiceScreen,
      page: () => ChooseTheServiceScreen(),
      binding: ChooseTheServiceBindings(),
      transition: Transition.downToUp,
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
      page: () {
        final caseItem = Get.arguments as int; // make sure it's an int
        return MyAdsDetailsScreen(caseItem: caseItem);
      },
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
      transition: Transition.leftToRight,
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
      transition: Transition.leftToRight,
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
      name: Routes.bookingDateScreen,
      page: () => BookingDateScreen.fromRoute(),
      binding: BookingDateBindings(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: Routes.priceDetailsScreen,
      page: () => PriceDetailsScreen.fromRoute(),
      binding: PriceDetailsBindings(),
      transition: Transition.rightToLeft,
    ),

    GetPage(
      name: Routes.summaryMyAdDetScreen,
      page: () => SummaryMyAdDetScreen(),
      binding: SummaryMyAdDetBinding(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: Routes.userInfoScreen,
      page: () => UserInfoScreen(),
      binding: UserInfoBinding(),
      transition: Transition.leftToRight,
    ),
    GetPage(
      name: Routes.updateMobileNumberScreen,
      page: () => UpdateMobileNumberScreen(),
      binding: UpdateMobileNumberBinding(),
      transition: Transition.leftToRight,
    ),

    GetPage(
      name: Routes.verCodeMobileScreen,
      page: () => VerCodeMobileScreen(),
      binding: VerCodeMobileBinding(),
      transition: Transition.leftToRight,
    ),
    GetPage(
      name: Routes.addADeliveryAddressScreen,
      page: () => AddADeliveryAddressScreen(),
      binding: AddADeliveryAddressBindings(),
      transition: Transition.leftToRight,
    ),
    GetPage(
      name: Routes.addCusLoacScreen,
      page: () => AddCusLoacScreen(),
      binding: AddCusLoacBinding(),
      transition: Transition.leftToRight,
    ),
    GetPage(
      name: Routes.aboutTheApplicationScreen,
      page: () => AboutTheApplicationScreen(),
      binding: AboutTheApplicationBinding(),
      transition: Transition.leftToRight,
    ),
    GetPage(
      name: Routes.savedDeliveryAddressesScreen,
      page: () => SavedDeliveryAddressesScreen(),
      binding: SavedDeliveryAddressesBinding(),
      transition: Transition.leftToRight,
    ),
    GetPage(
      name: Routes.weAreHereToHelpScreen,
      page: () => WeAreHereToHelpScreen(),
      binding: WeAreHereToHelpBinding(),
      transition: Transition.leftToRight,
    ),
    GetPage(
      name: Routes.reportAProblemScreen,
      page: () => ReportAProblemScreen(),
      binding: ReportAProblemBinding(),
      transition: Transition.leftToRight,
    ),
    GetPage(
      name: Routes.reportReviewDetailsScreen,
      page: () => ReportReviewDetailsScreen(),
      binding: ReportReviewDetailsBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: Routes.reportAProblemChatSupportScreen,
      page: () => ReportAProblemChatSupportScreen(),
      binding: ReportAProblemChatSupportBinding(),
      transition: Transition.leftToRight,
    ),
    GetPage(
      name: Routes.notificationsScreen,
      page: () => NotificationsScreen(),
      binding: NotificationsBinding(),
      transition: Transition.leftToRight,
    ),
    GetPage(
      name: Routes.walletScreen,
      page: () => WalletScreen(),
      binding: WalletBinding(),
      transition: Transition.leftToRight,
    ),

    GetPage(
      name: Routes.balanceWithdrawalRequestScreen,
      page: () => BalanceWithdrawalRequestScreen(),
      binding: BalanceWithdrawalRequestBinding(),
      transition: Transition.fade,
    ),

    GetPage(
      name: Routes.captainJoinsScreen,
      page: () => CaptainJoinsScreen(),
      binding: CaptainJoinsBinding(),
      transition: Transition.downToUp,
    ),

    GetPage(
      name: Routes.personalDataScreen,
      page: () => PersonalDataScreen(),
      binding: PersonalDataBinding(),
      transition: Transition.fadeIn,
    ),

    GetPage(
      name: Routes.allAdsScreen,
      page: () => AllAdsScreen(),
      binding: AllAdsBinding(),
      transition: Transition.leftToRight,
    ),
    GetPage(
      name: Routes.captainMembershipRequestScreen,
      page: () => CaptainMembershipRequestScreen(),
      binding: CaptainMembershipRequestBinding(),
      transition: Transition.fadeIn,
    ),

    GetPage(
      name: Routes.myOfferAdDetailsScreen,
      page: () => MyOfferAdDetailsScreen(),
      binding: MyOfferAdDetailsBinding(),
      transition: Transition.rightToLeft,
    ),
    //CaptainMembershipRequestScreen
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
