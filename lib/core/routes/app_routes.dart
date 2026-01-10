import '../../../features/profile/widgets/programmer_info_widget.dart';

import '../../core/helpers/constants.dart';
import '../../features/about_the_application/binding/about_the_application_binding.dart';
import '../../features/about_the_application/view/about_the_application_screen.dart';
import '../../features/ad_details/bindings/ad_details_bindings.dart';
import '../../features/ad_details/view/ad_details_screen.dart';
import '../../features/add_a_delivery_address/bindings/add_a_delivery_address_bindings.dart';
import '../../features/add_a_delivery_address/view/add_a_delivery_address_screen.dart';
import '../../features/add_cus_loac/binding/add_cus_loac_binding.dart';
import '../../features/add_cus_loac/view/add_cus_loac_screen.dart';
import '../../features/all_ads/binding/all_ads_binding.dart';
import '../../features/all_ads/view/all_ads_screen.dart';
import '../../features/auth/login/binding/login_binding.dart';
import '../../features/auth/login/view/login_screen.dart';
import '../../features/auth/register/binding/register_binding.dart';
import '../../features/auth/register/view/register_screen.dart';
import '../../features/auth/terms_and_conditions/bindings/terms_and_conditions_bindings.dart';
import '../../features/auth/terms_and_conditions/view/terms_and_conditions_screen.dart';
import '../../features/auth/verification_code/binding/verification_code_binding.dart';
import '../../features/auth/verification_code/view/verification_code_screen.dart';
import '../../features/balance_withdrawal_request/binding/balance_withdrawal_request_binding.dart';
import '../../features/balance_withdrawal_request/view/balance_withdrawal_request_screen.dart';
import '../../features/advertisement_summary/bindings/advertisement_summary_bindings.dart';
import '../../features/advertisement_summary/view/advertisement_summary_screen.dart';
import '../../features/booking_date/bindings/booking_date_bindings.dart';
import '../../features/booking_date/view/booking_date_screen.dart';
import '../../features/captain_joins/binding/captain_joins_binding.dart';
import '../../features/captain_joins/view/captain_joins_screen.dart';
import '../../features/captain_membership_request/binding/captain_membership_request_binding.dart';
import '../../features/captain_membership_request/view/captain_membership_request_screen.dart';
import '../../features/choose_the_service/bindings/choose_the_service_bindings.dart';
import '../../features/choose_the_service/view/choose_the_service_screen.dart';
import '../../features/delete_my_account/binding/delete_my_account_binding.dart';
import '../../features/delete_my_account/view/delete_my_account_screen.dart';
import '../../features/direct_suppor_map/binding/direct_support_map_binding.dart';
import '../../features/direct_suppor_map/views/direct_support_map_screen.dart';
import '../../features/my_offer_ad_details/bindings/my_offer_ad_details_binding.dart';
import '../../features/my_offer_ad_details/view/my_offer_ad_details_screen.dart';
import '../../features/notifications/binding/notifications_binding.dart';
import '../../features/notifications/view/notifications_screen.dart';
import '../../features/personal_data/binding/personal_data_binding.dart';
import '../../features/personal_data/view/personal_data_screen.dart';
import '../../features/pick_up_method_upon_delivery/bindings/pick_up_method_upon_delivery_bindings.dart';
import '../../features/pick_up_method_upon_delivery/view/pick_up_method_upon_delivery_screen.dart';
import '../../features/pick_up_point/bindings/pick_up_point_bindings.dart';
import '../../features/pick_up_point/view/pick_up_point_screen.dart';
import '../../features/price_details/bindings/price_details_bindings.dart';
import '../../features/price_details/view/price_details_screen.dart';
import '../../features/price_details_review/binding/price_details_review_binding.dart';
import '../../features/price_details_review/view/price_details_review_screen.dart';
import '../../features/remove_and_recycle_service_features/binding/remove_and_recycle_service_features_binding.dart';
import '../../features/remove_and_recycle_service_features/view/remove_and_recycle_service_features_screen.dart';
import '../../features/report_a_problem/binding/report_a_problem_binding.dart';
import '../../features/report_a_problem/view/report_a_problem_screen.dart';
import '../../features/report_a_problem_chat_support/binding/report_a_problem_chat_support_binding.dart';
import '../../features/report_a_problem_chat_support/view/report_a_problem_chat_support_screen.dart';
import '../../features/report_review_details/binding/report_review_details_binding.dart';
import '../../features/report_review_details/view/report_review_details_screen.dart';
import '../../features/review_details/bindings/review_details_bindings.dart';
import '../../features/review_details/view/review_details_screen.dart';
import '../../features/saved_delivery_addresses/binding/saved_delivery_addresses_binding.dart';
import '../../features/saved_delivery_addresses/view/saved_delivery_addresses_screen.dart';
import '../../features/select_a_location_on_the_map/bindings/select_a_location_on_the_map_bindings.dart';
import '../../features/select_a_location_on_the_map/view/select_a_location_on_the_map_screen.dart';
import '../../features/document/bindings/document_bindings.dart';
import '../../features/document/view/document_screen.dart';
import '../../features/home/bindings/home_bindings.dart';
import '../../features/home/view/home_screen.dart';
import '../../features/home_page/bindings/home_page_bindings.dart';
import '../../features/home_page/view/home_page_screen.dart';
import '../../features/profile/bindings/profile_bindings.dart';
import '../../features/profile/view/profile_screen.dart';
import '../../features/select_a_location_on_the_map_store/bindings/select_a_location_on_the_map_store_bindings.dart';
import '../../features/select_a_location_on_the_map_store/view/select_a_location_on_the_map_store_screen.dart';
import '../../features/select_store_name/bindings/select_store_name_binding.dart';
import '../../features/select_store_name/view/select_store_name_screen.dart';
import '../../features/item_ad_details/bindings/item_ad_details_binding.dart';
import '../../features/item_ad_details/view/item_ad_details_screen.dart';
import '../../features/my_ad_pay_ment/binding/my_ad_pay_ment_binding.dart';
import '../../features/my_ad_pay_ment/view/my_ad_pay_ment_screen.dart';
import '../../features/my_ads/bindings/transportation_and_delivery_bindings.dart';
import '../../features/my_ads/views/transportation_and_delivery_screen.dart';
import '../../features/my_ads_details/bindings/my_ads_details_bindings.dart';
import '../../features/my_ads_details/view/my_ads_details_screen.dart';
import '../../features/review_pay_ment/binding/review_pay_ment_binding.dart';
import '../../features/review_pay_ment/view/review_pay_ment_sreen.dart';
import '../../features/settings/binding/settings_binding.dart';
import '../../features/settings/view/settings_screen.dart';
import '../../features/buy_me/bindings/buy_me_binding.dart';
import '../../features/buy_me/views/buy_me_screen.dart';
import '../../features/summary/bindings/summary_binding.dart';
import '../../features/summary/view/summary_screen.dart';
import '../../features/update_mobile_number/binding/update_mobile_number_binding.dart';
import '../../features/update_mobile_number/view/update_mobile_number_screen.dart';
import '../../features/user_info/binding/user_info_binding.dart';
import '../../features/user_info/view/user_info_screen.dart';
import '../../features/ver_code_mobile/view/ver_code_mobile_screen.dart';
import '../../features/wallet/binding/wallet_binding.dart';
import '../../features/wallet/view/wallet_screen.dart';
import '../../features/we_are_here_to_help/binding/we_are_here_to_help_binding.dart';
import '../../features/we_are_here_to_help/view/we_are_here_to_help_screen.dart';
import 'package:get/get.dart';
import '../../features/report_a_problem_chat_support/widgets/image_preview.dart';
import '../../features/ver_code_mobile/binding/ver_code_mobile_binding.dart';
import 'routes.dart';

class AppRouter {
  List<GetPage> get routes => [
    // GetPage(name: Routes.splashScreen, page: () => SplashScreen()),
    GetPage(
      name: Routes.loginScreen,
      page: () {
        final resatAll = Get.arguments?[AppConstants.resatAll] as bool? ?? true;
        return LoginScreen(resatAll: resatAll);
      },
      binding: LoginBinding(),
      transition: Transition.noTransition,
    ),

    GetPage(
      name: Routes.registerScreen,
      page: () {
        final phoneNumber = Get.arguments[AppConstants.phoneNumber] as String;
        final code = Get.arguments[AppConstants.code] as String;
        return RegisterScreen(phoneNumber: phoneNumber, code: code);
      },
      binding: RegisterBinding(),
      transition: Transition.noTransition,
    ),
    GetPage(
      name: Routes.termsAndConditionsScreen,
      page: () {
        final infoType = Get.arguments[AppConstants.infoType] as String;
        return TermsAndConditionsScreen(infoType: infoType);
      },
      // page: () => TermsAndConditionsScreen(),
      binding: TermsAndConditionsBindings(),
      transition: Transition.noTransition,
    ),
    GetPage(
      name: Routes.homeScreen,
      page: () => HomeScreen(),
      binding: HomeBindings(),
      transition: Transition.noTransition,
    ),
    GetPage(
      name: Routes.homePageScreen,
      page: () => HomePageScreen(),
      binding: HomePageBindings(),
      transition: Transition.noTransition,
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
      name: Routes.programmerInfoWidget,
      page: () => ProgrammerInfoWidget(),
    ),
    //programmerInfoWidget
    GetPage(
      name: Routes.chooseTheServiceScreen,
      page: () => ChooseTheServiceScreen(),
      binding: ChooseTheServiceBindings(),
      transition: Transition.noTransition,
    ),

    GetPage(
      name: Routes.reviewPayMentScreen,
      page: () => ReviewPayMentScreen(),
      binding: ReviewPayMentBinding(),
      transition: Transition.noTransition,
    ),
    GetPage(
      name: Routes.pickUpMethodUpOnDeliveryScreen,
      page: () => PickUpMethodUpOnDeliveryScreen(),
      binding: PickUpMethodUponDeliveryBindings(),
      transition: Transition.noTransition,
    ),
    GetPage(
      name: Routes.myAdPayMentScreen,
      page: () => MyAdPayMentScreen(),
      binding: MyAdPayMentBinding(),
      transition: Transition.noTransition,
    ),
    GetPage(
      name: Routes.itemAdDetailsScreen,
      page: () => ItemAdDetailsScreen(),
      binding: ItemAdDetailsBinding(),
      transition: Transition.noTransition,
    ),
    GetPage(
      name: Routes.myAdsDetailsScreen,
      page: () => MyAdsDetailsScreen(),
      binding: MyAdsDetailsBindings(),
      transition: Transition.noTransition,
    ),

    GetPage(
      name: Routes.advertisementSummaryScreen,
      page: () => AdvertisementSummaryScreen(),
      binding: AdvertisementSummaryBindings(),
      transition: Transition.noTransition,
    ),
    GetPage(
      name: Routes.reviewDetailsScreen,
      page: () => ReviewDetailsScreen(),
      binding: ReviewDetailsBindings(),
      transition: Transition.noTransition,
    ),
    GetPage(
      name: Routes.selectALocationOnTheMapScreen,
      page: () => SelectALocationOnTheMapScreen(),
      binding: SelectALocationOnTheMapBindings(),
      transition: Transition.noTransition,
    ),
    GetPage(
      name: Routes.buyMeScreen,
      page: () => buyMeScreen(),
      binding: BuyMeBinding(),
      transition: Transition.noTransition,
    ),
    GetPage(
      name: Routes.selectALocationOnTheMapStoreScreen,
      page: () => SelectALocationOnTheMapStoreScreen(),
      binding: SelectALocationOnTheMapStoreBindings(),
      transition: Transition.noTransition,
    ),

    GetPage(
      name: Routes.selectStoreNameScreen,
      page: () => SelectStoreNameScreen(),
      binding: SelectStoreNameBinding(),
      transition: Transition.noTransition,
    ),
    GetPage(
      name: Routes.summaryScreen,
      page: () => SummaryScreen(),
      binding: SummaryBinding(),
      transition: Transition.noTransition,
    ),
    GetPage(
      name: Routes.verificationCodeScreen,
      page: () {
        final phoneNumber = Get.arguments[AppConstants.phoneNumber] as String;
        final resetAll = Get.arguments[AppConstants.resatAll] as bool;

        return verificationCodeScreen(
          phoneNumber: phoneNumber,
          resatAll: resetAll,
        );
      },
      binding: VerificationCodeBinding(),
      transition: Transition.noTransition,
    ),

    GetPage(
      name: Routes.directSupportMapScreen,
      page: () => DirectSupportMapScreen(),
      binding: DirectSupportMapBinding(),
      transition: Transition.noTransition,
    ),

    GetPage(
      name: Routes.priceDetailsReviewScreen,
      page: () => PriceDetailsReviewScreen(),
      binding: PriceDetailsReviewBinding(),
      transition: Transition.noTransition,
    ),
    GetPage(
      //numOfPages
      name: Routes.removeAndRecycleServiceFeaturesScreen,
      page: () {
        return RemoveAndRecycleServiceFeaturesScreen();
      },

      binding: RemoveAndRecycleServiceFeaturesBinding(),
      transition: Transition.downToUp,
    ),
    GetPage(
      name: Routes.pickUpPointScreen,
      page: () => PickUpPointScreen.fromRoute(),
      binding: PickUpPointBindings(),
      transition: Transition.noTransition,
    ),
    GetPage(
      name: Routes.adDetailsScreen,
      page: () => AdDetailsScreen.fromRoute(),
      binding: AdDetailsBindings(),
      transition: Transition.noTransition,
    ),
    GetPage(
      name: Routes.bookingDateScreen,
      page: () => BookingDateScreen.fromRoute(),
      binding: BookingDateBindings(),
      transition: Transition.noTransition,
    ),
    GetPage(
      name: Routes.priceDetailsScreen,
      page: () => PriceDetailsScreen.fromRoute(),
      binding: PriceDetailsBindings(),
      transition: Transition.noTransition,
    ),

    GetPage(
      name: Routes.userInfoScreen,
      page: () => UserInfoScreen(),
      binding: UserInfoBinding(),
      transition: Transition.noTransition,
    ),
    GetPage(
      name: Routes.updateMobileNumberScreen,
      page: () {
        final resatAll = Get.arguments?[AppConstants.resatAll] as bool? ?? true;
        return UpdateMobileNumberScreen(resatAll: resatAll);
      },
      binding: UpdateMobileNumberBinding(),
      transition: Transition.noTransition,
    ),

    GetPage(
      name: Routes.verCodeMobileScreen,
      page: () {
        final phoneNumber = Get.arguments[AppConstants.phoneNumber] as String;
        final resetAll = Get.arguments[AppConstants.resatAll] as bool;

        return VerCodeMobileScreen(
          phoneNumber: phoneNumber,
          resatAll: resetAll,
        );
      },
      binding: VerCodeMobileBinding(),
      transition: Transition.noTransition,
    ),
    GetPage(
      name: Routes.addADeliveryAddressScreen,
      page: () => AddADeliveryAddressScreen(),
      binding: AddADeliveryAddressBindings(),
      transition: Transition.noTransition,
    ),
    GetPage(
      name: Routes.addCusLoacScreen,
      page: () => AddCusLoacScreen(),
      binding: AddCusLoacBinding(),
      transition: Transition.noTransition,
    ),
    GetPage(
      name: Routes.aboutTheApplicationScreen,
      page: () => AboutTheApplicationScreen(),
      binding: AboutTheApplicationBinding(),
      transition: Transition.noTransition,
    ),
    GetPage(
      name: Routes.savedDeliveryAddressesScreen,
      page: () => SavedDeliveryAddressesScreen(),
      binding: SavedDeliveryAddressesBinding(),
      transition: Transition.noTransition,
    ),
    GetPage(
      name: Routes.weAreHereToHelpScreen,
      page: () {
        final userName = Get.arguments[AppConstants.userName] as String;
        return WeAreHereToHelpScreen(username: userName);
      },
      binding: WeAreHereToHelpBinding(),
      transition: Transition.noTransition,
    ),
    GetPage(
      name: Routes.reportAProblemScreen,
      page: () {
        final referenceType =
            Get.arguments[AppConstants.referenceType] as String;
        final referenceUuid =
            Get.arguments[AppConstants.referenceUuid] as String;
        return ReportAProblemScreen(
          referenceType: referenceType,
          referenceUuid: referenceUuid,
        );
      },
      binding: ReportAProblemBinding(),
      transition: Transition.noTransition,
    ),
    GetPage(
      name: Routes.imagePreviewScreen,
      page: () {
        final dynamic imageSource = Get.arguments[AppConstants.imageSource];
        return ImagePreviewScreen(imageSource);
      },
      transition: Transition.noTransition,
    ),
    GetPage(
      name: Routes.reportReviewDetailsScreen,
      page: () => ReportReviewDetailsScreen(),
      binding: ReportReviewDetailsBinding(),
      transition: Transition.noTransition,
    ),
    GetPage(
      name: Routes.reportAProblemChatSupportScreen,
      page: () {
        final args = Get.arguments ?? {};

        final isLiveSupport = args[AppConstants.liveSupport] as bool? ?? false;
        final receiverUuid = args[AppConstants.uuid] as String?;
        final receiverImage = args[AppConstants.receiverImage] as String?;
        final receiverName = args[AppConstants.receiverName] as String?;
        final receiverVerify = args[AppConstants.receiverVerify] as bool?;

        return ReportAProblemChatSupportScreen(
          isLiveSupport: isLiveSupport,
          receiverUuid: receiverUuid,
          receiverImage: receiverImage,
          receiverName: receiverName,
          receiverVerify: receiverVerify,
        );
      },
      // page: () => ReportAProblemChatSupportScreen(),
      binding: ReportAProblemChatSupportBinding(),
      transition: Transition.noTransition,
    ),
    GetPage(
      name: Routes.notificationsScreen,
      page: () => NotificationsScreen(),
      binding: NotificationsBinding(),
      transition: Transition.noTransition,
    ),
    GetPage(
      name: Routes.walletScreen,
      page: () => WalletScreen(),
      binding: WalletBinding(),
      transition: Transition.noTransition,
    ),

    GetPage(
      name: Routes.balanceWithdrawalRequestScreen,
      page: () => BalanceWithdrawalRequestScreen(),
      binding: BalanceWithdrawalRequestBinding(),
      transition: Transition.noTransition,
    ),

    GetPage(
      name: Routes.captainJoinsScreen,
      page: () => CaptainJoinsScreen(),
      binding: CaptainJoinsBinding(),
      transition: Transition.noTransition,
    ),

    GetPage(
      name: Routes.personalDataScreen,
      page: () => PersonalDataScreen(),
      binding: PersonalDataBinding(),
      transition: Transition.noTransition,
    ),

    GetPage(
      name: Routes.allAdsScreen,
      page: () => AllAdsScreen(),
      binding: AllAdsBinding(),
      transition: Transition.noTransition,
    ),
    GetPage(
      name: Routes.captainMembershipRequestScreen,
      page: () => CaptainMembershipRequestScreen(),
      binding: CaptainMembershipRequestBinding(),
      transition: Transition.noTransition,
    ),

    GetPage(
      name: Routes.myOfferAdDetailsScreen,
      page: () => MyOfferAdDetailsScreen(),
      binding: MyOfferAdDetailsBinding(),
      transition: Transition.noTransition,
    ),
    GetPage(
      name: Routes.settingsScreen,
      page: () => SettingsScreen(),
      binding: SettingsBinding(),
      transition: Transition.noTransition,
    ),
    GetPage(
      name: Routes.deleteMyAccountScreen,
      page: () => DeleteMyAccountScreen(),
      binding: DeleteMyAccountBinding(),
      transition: Transition.noTransition,
    ),

    //SettingsScreen
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
