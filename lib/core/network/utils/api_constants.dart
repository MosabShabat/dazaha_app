import '../../helpers/constants.dart';

class ApiConstants {
  AppConstants type = AppConstants();

  static final String apiBaseUrl = 'https://panel.dizzha.com/api/';
  static const String login = 'auth/send_code';
  static const String verifyCode = 'auth/verify_code';
  static const String register = 'auth/register';
  static const String home = 'home';
  // static const String bankData = 'profile/bank_data';
  static const String faq = 'faq';
  static const String aboutApp = 'about_app';
  static const String joinAsDriver = 'join_as_driver';
  static const String timesApi = 'user/orders/times?date=';
  static const String postOrders = 'user/orders/prepare';
  static const String summaryOrders = 'user/orders/summary';
  static const String confirmOrders = 'user/orders/confirm';
  static const String introUrl = 'user/orders/intro';
  static const String ordersUrl = 'user/orders';
  static const String addOffer = 'driver/orders/';
  static const String offers = 'driver/offers';
  static const String myOrder = 'user/my_orders';
  static const String payMentUrl = 'user/my_orders/payment/ready';
  static const String payUrl = 'user/my_orders/payment/pay';

  //user/orders/times?date=
  static const String chats = 'chats';
  static const String wallet = 'wallet';
  static const String notifications = 'notifications';

  // static const String search = 'search';
  static const String privacyPolicy = 'privacy_policy';
  static const String termsConditions = 'terms_conditions';
  static const String deleteAccount = 'delete_my_account';
  // static const String map = 'map';
  // static const String bestChef = 'best_chef';
  // static const String cookOthersOrders = 'chef/orders/cook_for_others';
  // static const String dishNow = 'dish_now';
  // static const String discountedDishes = 'discounted_dishes';
  // static const String dishDetails = 'dishes';
  // static const String chefDishDetails = 'profile/dish_now';
  // static const String updateBankData = 'profile/update_bank_data';
  // static const String chefSpecialOffersDetails = 'profile/special_offers';
  // static const String chefDishMenuDetails = 'profile/menu';
  // static const String favorites = 'favorites';
  static const String deleteAccountSend = 'profile/delete_my_account';
  // static const String addCart = 'cart/add';
  // static const String cart = 'cart';
  // static const String prepareToPay = 'cart/prepare_to_pay';
  // static const String cookMeReadyPay = 'user/orders/cook_for_me/payment/ready';
  // static const String readyToPay = 'payment/ready';
  static const String logout = 'auth/logout';
  static const String online = 'online';
  static const String profile = 'profile';
  // static const String pay = 'payment/pay';
  static const String requirements = 'requirements';
  // static const String cookMePay = 'user/orders/cook_for_me/payment/pay';
  static const String depositPay = 'wallet/deposit';
  static const String withdrawalPay = 'wallet/withdrawal';
  // static const String checkStatus = 'payment/check_status';
  // static const String userPurchases = 'user/orders/purchases';
  // static const String chefPurchases = 'chef/orders/purchases';
  // static const String chefOffers = 'chef/orders/offers';
  // static const String specialOrders = 'chef/orders/private';
  // static const String userPurchasesDetails = 'user/orders/purchases';
  // static const String userCookMeDetails = 'user/orders/cook_for_me';
  // static const String chefOfferDetials = 'chef/orders/offers';
  // static const String chefPurchasesDetails = 'chef/orders/purchases';
  // static const String userRating = 'user/orders/purchases';
  // static const String userRatingCookMe = 'user/orders/cook_for_me';
  // static const String JoinChefRequirements = 'auth/chef/requirements';
  // static const String requestToJoinChef = 'auth/chef/request_to_join';
  static const String reportProblem = 'report_problem';

  // static const String updateState = 'chef/orders/purchases';
  // static const String updateStateOffer = 'chef/orders/offers';
  // static const String updateStateOrder = 'user/orders/cook_for_me';

  // static const String updateStatePurchase = 'user/orders/purchases';

  static const String deliveryAddresses = 'delivery_addresses';
  static const String addAddress = 'delivery_addresses/store';
  static const String deleteAddress = 'delivery_addresses';
  // static const String deleteDish = 'profile/dish_now';
  static const String addressDetails = 'delivery_addresses';
  // static const String chefDetails = 'chefs';
  // static const String suggestedDishes =
  //     'user/orders/cook_for_me/suggested_dishes';
  // static const String cookMe = 'user/orders/cook_for_me';
  // static const String addDishNow = 'profile/dish_now/store';
  // static const String addSpecialOffer = '/profile/special_offers/store';
  // static const String addDishChefMenuNow = 'profile/menu/store';
  static const String updateMobile = 'profile/update_mobile';
  static const String updateProfile = 'profile/update';
  static const String verifyCodeUpdateMobile =
      'profile/verify_code_update_mobile';
  static const String postJoinAsDriver = 'profile/join_as_driver';

  //verify_code_update_mobile
  // static const String editDishNow = 'profile/dish_now/';
  // static const String editSpecialOffers = 'profile/special_offers';
  // static const String editDishMenu = 'profile/menu/';
  // static const String userCookMeOrders = 'user/orders/cook_for_me';
  // static const String chefDishes = 'profile/dish_now';
  // static const String chefs = 'chefs';
  // static const String chefDishesMenu = '/profile/menu';
  // static const String chefSpecialOffers = 'profile/special_offers';
  // static const String cancelOrder = 'user/orders/cook_for_me/';
  // static const String addOffer = 'chef/orders/cook_for_others/add_offer';
  // static const String accountVerificationRequest =
  //     'profile/account_verification_request';
}

class ApiTypes {
  // static const String notLogin = "not_login";
  // static const String login = "login";
  // static const String logout = "logout";
  // static const String all = "all";
  // static const String today = "today";
  // static const String notCompleted = "not_completed";
  // static const String completed = "completed";
  // static const String pending = "in_process";
}
