// translations_extensions.dart

import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

extension TranslationsExtension on BuildContext {
  String get appName => tr('app_name');
  String get login => tr('login');
  String get welcome => tr('welcome');
  String get mustLogin => tr('you_must_have_login');
  String get enterMobileNumberToRegisterOrLogin =>
      tr('enter_mobile_number_to_register_or_login');
  String get mobileNumber => tr('mobile_number');
  String get continuation => tr('continuation');
  String get pleaseSelectATimeSlot => tr('please_select_a_time_slot');
  String get registerNewUser => tr('register_new_user');
  String get firstName => tr('first_name');
  String get enterYourProfilePicture => tr('enter_your_profile_picture');
  String get enterAmount => tr('enter_amount');
  String get enterIdOr => tr('enter_id_or');
  String get enterVanOr => tr('enter_van_or');
  String get withdrawalSuccessfully => tr('withdrawal_successfully');
  String get enterFirstName => tr('enter_first_name');
  String get enterTheFullCode => tr('enter_the_full_code');
  String get enterTheExpectedPrice => tr('enter_the_expected_price');

  //enter_the_expected_price
  String get lastName => tr('last_name');
  String get enterLastName => tr('enter_last_name');
  String get email => tr('email');
  String get enterYourEmail => tr('enter_email');
  String get iAgreeTo => tr('i_agree_to');
  String get termsAndConditions => tr('terms_and_conditions');
  String get verification => tr('verification');
  String get registerAnAccount => tr('register_an_account');
  String get confirm => tr('confirm');
  String get yes => tr('yes');
  String get no => tr('no');
  String get areYouSureYouWantToLeave => tr('are_you_sure_you_want_to_leave');
  String get transportationAndDelivery => tr('transportation_and_delivery');
  String get buyForMe => tr('buy_for_me');
  String get removal => tr('removal');
  String get dedication => tr('dedication');
  String get latestAnnouncements => tr('latest_announcements');
  String get viewAll => tr('view_all');
  String get trackingLog => tr('tracking_log');
  String get deliveryFrom => tr('delivery_from');
  String get deliveryTo => tr('delivery_to');
  String get weDeliverBuyAndHandleEverythingForYou =>
      tr('we_deliver_buy_and_handle_everything_for_you');
  String get needSomethingDontWorry => tr('need_something_dont_worry');
  String get weDeliverYourItemsQuicklyAndSafely =>
      tr('we_deliver_your_items_quickly_and_safely');
  String get wellBringYouWhatYouNeed => tr('we_will_bring_you_what_you_need');
  String get removeAndRecycle => tr('remove_and_recycle');
  String get wellGetRidOfYourOldItems =>
      tr('we_will_get_rid_of_your_old_items');
  String get wellDeliverYourDonationsToThoseInNeed =>
      tr('we_will_deliver_your_donations_to_those_in_need');
  String get returnLostItems => tr('return_lost_items');
  String get pickUpFromMarket => tr('pick_up_from_market');
  String get deliverPurchases => tr('deliver_purchases');
  String get transportOfSmallItems => tr('transport_small_items');
  String get chooseTheDay => tr('choose_the_day');
  String get chooseTheAppropriateTimeForTransportation =>
      tr('choose_appropriate_time_for_transportation');
  String get youCanChooseSpecificTimesDuringTheDay =>
      tr('you_can_choose_specific_times_during_the_day');
  String get receiptPoint => tr('receipt_point');
  String get myCurrentLocation => tr('my_current_location');
  String get savedAddresses => tr('saved_addresses');
  String get addAddress => tr('add_address');
  String get editAddress => tr('edit_address');
  String get placeName => tr('place_name');
  String get exampleWorkHome => tr('example_work_home');
  String get city => tr('city');
  String get selectCity => tr('select_city');
  String get neighborhood => tr('neighborhood');
  String get selectNeighborhood => tr('select_neighborhood');
  String get street => tr('street');
  String get enterStreetName => tr('enter_street_name');
  String get locationOnMap => tr('location_on_map');
  String get selectLocation => tr('select_location');
  String get saveAddress => tr('save_address');
  String get receiptMethod => tr('receipt_method');
  String get location => tr('location');
  String get homeDoor => tr('home_door');
  String get stairs => tr('stairs');
  String get movingItemsRequiresClimbingStairs =>
      tr('moving_items_requires_climbing_stairs');
  String get garden => tr('garden');
  String get iWillMeetAndShowYouThePlace =>
      tr('i_will_meet_and_show_you_the_place');
  String get extra => tr('extra');
  String get carryingAssistanceAvailableUponReceipt =>
      tr('carrying_assistance_available_upon_receipt');
  String get deliveryPoint => tr('delivery_point');
  String get adDetails => tr('ad_details');
  String get offerTextMp => tr('offer_text_mp');
  String get whatDoYouNeedHelpWith => tr('what_do_you_need_help_with');
  String get forExampleACookAStoveABrokenPotABagOfFlour =>
      tr('for_example_a_cook_a_stove_a_broken_pot_a_bag_of_flour');
  String get aSimpleExplanationOfTheItems =>
      tr('a_simple_explanation_of_the_items');
  String get fromText => tr('from_text');
  String get toText => tr('to_text');
  String get chooseStartDate => tr('choose_start_date');
  String get chooseEndDate => tr('choose_end_date');
  String get selectDatesError => tr('select_dates_error');
  String get dateRangeError => tr('date_range_error');
  String get joinAsCap => tr('join_as_cap');
  String get offerDevSer => tr('offer_dev_ser');
  String get whatGiftWouldYouLikeToGive =>
      tr('what_gift_would_you_like_to_give');

  //what_gift_would_you_like_to_give
  String get forExampleSize => tr('example_size_weight');
  String get whatAreTheSizesOfTheItems => tr('what_are_the_sizes_of_the_items');
  String get small => tr('small');
  String get mediumText => tr('medium');
  String get large => tr('large');
  String get aLotOfItems => tr('a_lot_of_items');
  String get howWasYourExperienceWith => tr('how_was_your_experience_with');

  //how_was_your_experience_with
  String get doYouNeedHelpers => tr('do_you_need_helpers');
  String get priceDetails => tr('price_details');
  String get ourPriceEstimate => tr('our_price_estimate');
  String get howMuchWouldYouLikeToPay => tr('how_much_would_you_like_to_pay');
  String get theHigherYourPrice => tr('the_higher_your_price');
  String get adSummary => tr('ad_summary');
  String get convenientTimeForMoving => tr('convenient_time_for_moving');
  String get whenIsItAppropriate =>
      tr('when_is_it_appropriate_for_you_to_remove_items');
  String get theAppropriateTimeForGifting =>
      tr('the_appropriate_time_for_gifting');

  //the_appropriate_time_for_gifting
  String get date => tr('date');
  String get time => tr('time');
  String get address => tr('address');
  String get details => tr('details');
  String get aBriefExplanationOfTheItems =>
      tr('brief_explanation_of_the_items');
  String get chats => tr('chats');
  String get chatsEmptyTitle => tr('chats_empty_title');
  String get chatsEmptyDescription => tr('chats_empty_description');

  String get postTheAd => tr('post_the_ad');
  String get priceOffers => tr('price_offers');
  String get weWillPublishYourAdAfterReviewingTheDetails =>
      tr('we_will_publish_your_ad_after_reviewing_the_details');
  String get youWillReceiveANotificationWithEveryUpdate =>
      tr('you_will_receive_notification');
  String get myAds => tr('my_ads');
  String get orderID => tr('order_id');

  String get home => tr('home');
  String get choice => tr('choice');
  String get startYourJourneyNow => tr('start_your_journey_now!');
  String get enterPickupAndDropOffLocationDetailsToProceed =>
      tr('enter_pickup_and_drop_off_location_details_to_proceed');
  String get storeName => tr('store_name');
  String get chooseFromMap => tr('choose_from_map');
  String get enterStoreName => tr('enter_store_name');
  String get writeAnyStore => tr('write_any_store');
  String get recentAddresses => tr('recent_addresses');
  String get clearAll => tr('clear_all');
  String get historyEmpty => tr('history_empty');
  String get dataEmpty => tr('data_empty');
  String get writeTheNameOfTheItemEgTomatoBreadSoap =>
      tr('write_the_name_of_the_item_eg_tomato_bread_soap');
  String get piece => tr('piece');
  String get kilo => tr('kilo');
  String get addANewCategory => tr('add_a_new_category');
  String get deletedSuccessfully => tr('deleted_successfully');
  String get toRetreat => tr('to_retreat');
  String get summary => tr('summary');
  String get shoppingList => tr('shopping_list');
  String get send => tr('send');
  String get displaySuccessfullyUpdated => tr('display_successfully_updated');
  //display_successfully_updated
  String get all => tr('all');
  String get receiveOffers => tr('receive_offers');
  String get underDelivery => tr('under_delivery');
  String get complete => tr('complete');
  String get today => tr('today');
  String get yesterday => tr('yesterday');
  String get search => tr('search');
  String get filter => tr('filter');
  String get reset => tr('reset');
  String get ViewYourRequestsByServiceType =>
      tr('view_your_requests_by_service_type');
  String get orderDetails => tr('order_details');
  String get thePrice => tr('the_price');
  String get highestRated => tr('highest_rated');
  String get acceptance => tr('acceptance');
  String get sizeOfItems => tr('size_of_items');
  String get currency => tr('currency');
  String get enterCouponHere => tr('enter_coupon_here');
  String get assistants => tr('assistants');
  String get acceptTheOffer => tr('accept_the_offer');
  String get doYouWantToAcceptTheOffer => tr('do_you_want_to_accept_the_offer');
  String get offeredPriceQuote => tr('offered_price_quote');
  String get transferDate => tr('transfer_date');
  String get presenter => tr('presenter');
  String get ifYouAcceptTheOfferTheOrder =>
      tr('if_you_accept_the_offer_the_order');
  String get payment => tr('payment');
  String get discountCoupon => tr('discount_coupon');
  String get enterTheCoupon => tr('enter_the_coupon');
  String get implementation => tr('implementation');
  String get paymentMethod => tr('payment_method');
  String get applePay => tr('apple_pay');
  String get zainCash => tr('zain_cash');
  String get cardPayment => tr('card_payment');
  String get paymentSummary => tr('payment_summary');
  String get subtotal => tr('sub_total');
  String get valueAddedTax => tr('value_added_tax');
  String get totalAmount => tr('total_amount');
  String get payNow => tr('pay_now');
  String get paymentCompletedSuccessfully =>
      tr('payment_completed_successfully');
  String get trackYourOrderStatusAndSee =>
      tr('track_your_order_status_and_see');
  String get orderTracking => tr('order_tracking');
  String get verificationCode => tr('verification_code');
  String get enterTheDigitCode => tr('enter_the_digit_code_sent_to_you_on');
  String get iDidNotReceiveTheCode => tr('i_did_not_receive_the_code');
  String get resend => tr('resend');

  String get trackTheFlight => tr('track_the_flight');
  String get tracking => tr('tracking');
  String get deliveryPoints => tr('delivery_points');
  String get flightCaptain => tr('flight_captain');
  String get invoice => tr('invoice');
  String get invoiceNumber => tr('invoice_number');
  String get serviceAmount => tr('service_amount');
  String get reportAProblem => tr('report_a_problem');
  String get tripEvaluation => tr('trip_evaluation');
  String get message => tr('message');
  String get rateYourExperience => tr('rate_your_experience');
  String get submitEvaluation => tr('submit_evaluation');
  String get createYourAd => tr('create_your_ad');
  String get profile => tr('profile');
  String get goArriveEarn => tr('go_arrive_earn');
  String get placeOrdersAnd => tr('place_orders_and_start_earning_easily');
  String get joinNow => tr('join_now');
  String get wallet => tr('wallet');
  String get dividendPortfolio => tr('dividend_portfolio');

  //dividend_portfolio
  String get theLanguage => tr('the_language');
  String get arabic => tr('arabic');
  String get english => tr('english');
  String get deliveryAddresses => tr('delivery_addresses');
  String get help => tr('help');
  // String get helpersText => tr('helpers');
  String get aboutTheApp => tr('about_the_app');
  String get settings => tr('settings');
  String get logOut => tr('log_out');
  String get chooseLanguage => tr('choose_language');
  String get personalInformation => tr('personal_information');
  String get update => tr('update');
  String get saveChanges => tr('save_changes');
  String get updateMobileNumber => tr('update_mobile_number');
  String get enterTheNewMobileNumberToUpdate =>
      tr('enter_the_new_mobile_number_to_update');
  String get next => tr('next');
  String get edit => tr('edit');
  String get operationFailedTryAgain => tr('operation_failed_try_again');
  String get operationSuccessful => tr('operation_successful');

  //operation_failed_try_again
  String get delete => tr('delete');
  String get deleteTheAd => tr('delete_the_ad');
  String get doYouWantToDeleteTheAd => tr('do_you_want_to_delete_the_ad');

  String get weAreHereToHelp => tr('we_are_here_to_help');
  String get liveSupport => tr('live_support');
  String get frequentlyAskedQuestions => tr('frequently_asked_questions');
  String get problemName => tr('problem_name');
  String get exampleIHaveADeliveryProblem =>
      tr('example_i_have_a_delivery_problem');
  String get descriptionOfTheProblem => tr('description_of_the_problem');
  String get exampleThereIsAProblem => tr('example_there_is_a_problem');
  String get thePictures => tr('the_pictures');
  String get optional => tr('optional');
  String get yourReportSuccessfully =>
      tr('your_report_has_been_sent_successfully');
  String get weWillContactYou => tr('we_will_contact_you');
  String get ok => tr('ok');
  String get tapAgainToExitTheApp => tr('tap_again_to_exit_the_app');
  String get notifications => tr('notifications');
  String get yourAvailableBalance => tr('your_available_balance');
  String get withdrawABalance => tr('withdraw_a_balance');
  String get rechargeBalance => tr('recharge_balance');
  String get recordMovements => tr('record_movements');
  String get howMuchDoYouWantToWithdraw =>
      tr('how_much_do_you_want_to_withdraw');
  String get howMuchDoYouWantToDis => tr('how_much_do_you_want_to_dis');
  //how_much_do_you_want_to_dis
  String get weWillPrepareTheAmount => tr('we_will_prepare_the_amount');
  String get withdrawalRequest => tr('withdrawal_request');
  String get balanceWithdrawalRequest => tr('balance_withdrawal_request');
  String get youWillReceiveANotificationAsSoon =>
      tr('you_will_receive_a_notification_as_soon');
  String get doneText => tr('done');
  String get selectTheTransactionTypeAndStatus =>
      tr('select_the_transaction_type_and_status');
  String get income => tr('income');
  String get successful => tr('successful');
  String get failed => tr('failed');
  String get startYourJourneyAsACaptain =>
      tr('start_your_journey_as_a_captain');
  String get offerDeliveryServicesAndEarn =>
      tr('offer_delivery_services_and_earn');
  String get whyJoinAsACaptain => tr('why_join_as_a_captain');
  String get guaranteedAdditionalIncome => tr('guaranteed_additional_income');
  String get flexibilityInTime => tr('flexibility_in_time');
  String get easeOfHandling => tr('ease_of_handling');
  String get simpleAndFastApplicationNoRExperienceRequired =>
      tr('simple_and_fast_application_no_experience_required');
  String get readyOrders => tr('ready_orders');
  String get everyDayYouHaveTheOpportunity =>
      tr('every_day_you_have_the_opportunity');
  String get liveTechnicalSupport => tr('live_technical_support');
  String get ourTeamIs => tr('our_team_is_here_to_help_you_anytime');
  String get startNow => tr('start_now');
  String get plateNumber => tr('plate_number');
  String get enterTheCarPlateNumber => tr('enter_the_car_plate_number');
  String get exampleZ33245 => tr('exampleZ33245');
  String get iDOrResidencyPhoto => tr('iD_or_residency_photo');
  String get addAPhoto => tr('add_a_photo');
  String get APictureOfTheVehicle => tr('a_picture_of_the_vehicle');
  String get youHaveSuccessfullyApplied => tr('you_have_successfully_applied');
  String get yourInformationWillBeReviewed =>
      tr('your_information_will_be_reviewed');
  String get advertiser => tr('advertiser');
  String get addAnOffer => tr('add_an_offer');
  String get setYourPriceAndBe => tr('set_your_price_and_be');
  String get askingPrice => tr('asking_price');
  String get expectedPrice => tr('expected_price');
  String get joinAsAnAssistant => tr('join_as_an_assistant');

  //join_as_an_assistant
  String get yourPriceForDisplay => tr('your_price_for_display');
  String get yourPriceHere => tr('your_price_here');
  String get yourOfferHasReachedTheCustomer =>
      tr('your_offer_has_reached_the_customer');
  String get myOffers => tr('my_offers');
  String get displayManagement => tr('display_management');
  String get advertisingManagement => tr('advertising_management');
  String get onHold => tr('on_hold');

  String get offerDetails => tr('offer_details');
  String get published => tr('published');
  String get viewPrice => tr('view_price');
  String get presentedOffer => tr('presented_offer');
  String get startTheJourney => tr('start_the_journey');
  String get iArrivedHome => tr('i_arrived_home');
  String get endTheTrip => tr('end_the_trip');
  String get doYouWantToEndTheTrip => tr('do_you_want_to_end_the_trip');
  String get makeSureYouHave => tr('make_sure_you_have');
  String get quoteOptions => tr('quote_options');
  String get deleteQuote => tr('delete_quote');
  String get doYouWantToDeleteTheQuote => tr('do_you_want_to_delete_the_quote');
  String get ifYouLikeYou =>
      tr('if_you_like_you_can_send_a_new_offer_after_deletion');
  String get yesDeleteTheOffer => tr('yes_delete_the_offer');
  String get theQuoteHasBeenSuccessfullyDeleted =>
      tr('the_quote_has_been_successfully_deleted');
  String get amount => tr('amount');

  String get pleaseEnterYourPhoneNumber => tr('please_enter_your_phone_number');
  String get error => tr('error');
  String get enterPhoneNumber => tr('enter_phone_number');

  String get enterPhoneForLoginOrSignup =>
      tr('enter_phone_for_login_or_signup');
  String get countryCode => tr('country_code');
  String get privacyPolicy => tr('privacy_policy');
  String get camera => tr('camera');
  String get photoGallery => tr('photo_gallery');
  String get addressDeletedSuccessfully => tr('address_deleted_successfully');
  String get locationEmptyTitle => tr('location_empty_title');
  String get locationEmptyDescrition => tr('location_empty_descrition');
  String get selectCountry => tr('select_country');
  String get locationDisabled => tr('location_disabled');
  String get enableLocation => tr('enable_location');
  String get enable => tr('enable');
  String get unknownPlace => tr('unknown_place');
  String get currentLocation => tr('current_location');
  String get enterValidPhoneNumber => tr('enter_valid_phone_number');
  String get addressUpdatedSuccessfully => tr('address_updated_successfully');
  String get addressAddedSuccessfully => tr('address_added_successfully');
  String get deleteAddress => tr('delete_address');
  String get deleteAddressMessage => tr('delete_address_message');
  String get enterTitle => tr('enter_title');
  String get enterDescriptionProblem => tr('enter_description_problem');
  String get successProblem => tr('success_problem');
  String get successOrder => tr('success_order');
  String get theDataHasBeenUpdatedSuccessfully =>
      tr('the_data_has_been_updated_successfully');
  String get enterDescription => tr('enter_description');
  //enter_description
  String get notificationEmptyTitle => tr('notification_empty_title');
  String get notificationEmptyDescription =>
      tr('notification_empty_description');
  String get CreateYourDedication => tr('create_your_dedication');
  String get DeleteMyAccount => tr('delete_my_account');
  String get accountDeletedSuccessfully => tr('account_deleted_successfully');
  String get deleteAccountConfirm => tr('delete_account_confirm');
  String get deleteDescription => tr('delete_description');
  String get yesDelete => tr('yes_delete.');
  String get unknownLocation => tr('unknown_location');
  String get noInternetConnection => tr('no_internet_connection');
  String get positiveEvaluation => tr('positive_evaluation');
  String get ads => tr('ad');
  String get distance => tr('distance');
  String get km => tr('km');
  String get youMustDriver => tr('you_must_register_as_a_driver');
  String get theDriverApplicationIsUnder =>
      tr('the_driver_application_is_under');

  //"لا يوجد اتصال بالإنترنت"

  //the_driver_application_is_under
}
