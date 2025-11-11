import 'dart:async';
import 'dart:developer';
import 'package:flutter/services.dart';
import '../../../features/home_page/controller/home_repo.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../constant/exports_libraries.dart';
import 'app_shared_data.dart';

RxBool isUserLogin = false.obs;
bool isOpenBefore = true;
String userName = '';
int userType = -1;

String latConstant = '0.0';
String lngConstant = '0.0';

final unreadNotificationLocal = 0.obs;
final cartCountLocal = 0.obs;
final unreadChatsLocal = 0.obs;

Future<void> initializeAppPreferences() async {
  final prefs = await SharedPreferences.getInstance();
  isOpenBefore = prefs.getBool(AppSharedKeys.isOpenBeforeKey) ?? false;
  isUserLogin.value = prefs.getBool(AppSharedKeys.isUserLoggedInKey) ?? false;
}

class AppSharedKeys {
  static const String userToken = 'userToken';
  static const String userData = 'userData';
  static const String isUserLoggedInKey = 'isUserLoggedIn';
  static const String isOpenBeforeKey = 'isOpenBeforeKey';
  static const String fcmTokenKey = 'fcm_token';
  static const String isDarkModeKey = 'isDarkModeKey';
  static const String deliveryAddressUuid = 'deliveryAddressUuid';
  static const String lat = 'lat';
  static const String lng = 'lng';
  static const String placeName = 'name';
}

class AppNavigationType {
  static const String toNamed = 'toNamed';
  static const String offNamed = 'offNamed';
  static const String offAllNamed = 'offAllNamed';
}

class AppConstants {
  static const String id = 'id';
  static String userToken = '';
  static String userUUid = '';
  static const String image = 'image';
  static const String lat = 'lat';
  static const String lng = 'lng';
  static const String imageSource = 'imageSource';
  static String referenceType = 'referenceType';
  static String referenceUuid = 'referenceUuid';
  static const String placeName = 'placeName';
  static const String countryKey = 'countryKey';
  static const String register = 'register';
  static String coupon = 'coupon';
  static const String forgetPassword = 'forget_password';
  static const String updateMobile = 'update_mobile';
  static const String countryId = 'country_id';
  static const String code = 'code';
  static const String mobile = 'mobile';
  static String deposit = 'deposit';
  static String withdraw = 'withdraw';
  static const String verificationType = 'verification_type';
  static const String title = 'title';
  static String isEdit = 'state';
  static String addressUuid = 'addressUuid';
  static const String subTitle = 'subTitle';
  static const String type = 'type';
  static String infoType = 'infoType';
  static String termsConditions = 'termsConditions';
  static const String resetPassword = 'reset_password';
  static const String paymentSuccess = 'paymentSuccess';
  static const String sendActivation = 'sendActivation';
  static const String resendCode = 'resendCode';
  static const String success = 'success';
  static const String phoneNumber = 'phoneNumber';
  static const String serviceUuid = 'serviceUuid';
  static const String numOfPages = 'numOfPages';
  static const String resatAll = 'resatAll';
  static const String ok = 'ok';
  static String privacyPolicy = 'privacyPolicy';
  static String aboutApplication = 'aboutApplication';
  static String userName = 'userName';
  static String orderId = '';
  static String userImage = '';
  static String orderTitle = 'orderTitle';
  static String liveSupport = 'liveSupport';
  static String uuid = 'uuid';
  static String receiverImage = 'receiverImage';
  static String receiverName = 'receiverName';
  static String receiverVerify = 'receiverVerify';
  static String isDriver = '';
  static String orderUuid = '';
  static String typeReq = '';
  static const String paymentId = 'paymentId';
  static const String transactionId = 'transactionId';
  static const String publishableApiKey = 'publishableApiKey';
  static const String amount = 'amount';
  static String paymentUuid = 'paymentUuid';
  static String paymentType = 'paymentType';
  static const String description = 'description';
  static const String merchantId = 'merchantId';
  static String typeItemSelected = '';

  static int timerLastRequest = 0;
  static Timer? _timer;

  static void statusBar() {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.white, // لون خلفية شريط الحالة (غامق)
        statusBarIconBrightness: Brightness.dark, // أيقونات بيضاء في أندرويد
        statusBarBrightness: Brightness.dark, // أيقونات بيضاء في iOS
      ),
    );
  }

  static void startTimer() {
    _timer?.cancel();
    log('statrt timer after 60 seconds');

    if (isUserLogin == false) {
    } else {
      final HomeRepo _homeRepo = Get.find<HomeRepo>();
      timerLastRequest = 0;
      _timer = Timer.periodic(Duration(seconds: 1), (timer) {
        timerLastRequest++;
        if (timerLastRequest >= 60) {
          _homeRepo.online();
          log('Stopping timer after 60 seconds. request onlain');
          _timer?.cancel();
        }
      });
    }
  }

  static void setUnreadNotificationsCount(int? unreadNotificationsCount) {
    unreadNotificationLocal.value = unreadNotificationsCount!;
  }

  static void setCartCount(int? cartCountApi) {
    cartCountLocal.value = cartCountApi!;
  }

  static void setUnreadChatsCount(int? unreadChatsCountAPi) {
    unreadChatsLocal.value = unreadChatsCountAPi!;
  }
}

class NotificationTypes {
  static const String type = 'type';
  static const String referenceUuid = 'reference_uuid';

  // General
  static const String general = 'general';
  static const String requestToJoinDriverAccepted =
      'request_to_join_driver_accepted';
  static const String requestToJoinDriverRejected =
      'request_to_join_driver_rejected';
  static const String reportedProblemNew = 'reported_problem_new';
  static const String reportedProblemInProgress =
      'reported_problem_in_progress';
  static const String reportedProblemResolved = 'reported_problem_resolved';

  // Orders
  static const String newOrder = 'new_order';
  static const String orderCanceled = 'order_canceled';
  static const String orderInProgress = 'order_in_progress';
  static const String orderCompleted = 'order_completed';
  static const String orderDelivered = 'order_delivered';
  static const String orderStarted = 'order_started';

  // Offers
  static const String newOffer = 'new_offer';
  static const String offerExcluded = 'offer_excluded';

  //order_completed
  // Wallet
  static const String withdrawAccepted = 'wallet_withdrawal_accepted';
  static const String withdrawRejected = 'wallet_withdrawal_rejected';
  static const String walletWithdrawal = 'wallet_withdrawal';
  static const String walletDeposit = 'wallet_deposit';
  static const String depositOrder = 'deposit_order';
  static const String depositCanceledOrder = 'deposit_canceled_order';

  //chats  new_technical_support_message
  static const String newTechnicalSupportMessage =
      'new_technical_support_message';
}

class MessageTypes {
  static const String chatApiKey = 'kdgjxo6cgzq8ldqdqjhn';
  static const String chatCluster = '';
  static Future<String> get chatChannelName async {
    final user = await AppSharedData.getUserInfo();
    return "chat.${user?.uuid ?? 'guest'}";
  }

  static Future<String> get chatsChannelName async {
    final user = await AppSharedData.getUserInfo();
    return "chats.${user?.uuid ?? 'guest'}";
  }

  // static   String chatChannelName = "chat.e8e8d1f1-afc8-4b57-af8b-c2c585bb1a0b";
  static const String messageText = 'text';
  static const String messageImage = 'image';
  static const String messageVoice = 'voice';
}
