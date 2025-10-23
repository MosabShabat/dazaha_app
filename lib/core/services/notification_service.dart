// import 'dart:convert';
import 'dart:convert';
import 'dart:developer';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:get/get.dart';
import '../../features/wallet/controller/wallet_controller.dart';
import '../constant/exports_libraries.dart';
import '../helpers/app_shared_data.dart';
import '../helpers/constants.dart';
import '../routes/routes.dart';

class NotificationService {
  //new changes
  static final NotificationService _instance = NotificationService._internal();

  factory NotificationService() {
    return _instance;
  }

  NotificationService._internal();

  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
  final FlutterLocalNotificationsPlugin _localNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  Future<void> init() async {
    await _requestPermission();
    await _initializeLocalNotifications();
    await fetchAndStoreFCMToken();
    FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      log('Foreground Notification: ${message.notification?.title}');
      unreadNotificationLocal.value = 1;
      log('Foreground Data: ${message.data}');
      _handleForegroundNotification(message.data);
      showNotification(
        message.notification?.title ?? 'No Title',
        message.notification?.body ?? 'No Body',
        message.data,
      );
    });

    await _checkInitialMessage();
  }

  Future<void> _requestPermission() async {
    NotificationSettings settings = await _firebaseMessaging.requestPermission(
      alert: true,
      badge: true,
      sound: true,
    );
    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      log('User granted permission.');
    } else {
      log('User denied or has not granted permission.');
    }
  }

  Future<void> _initializeLocalNotifications() async {
    const AndroidInitializationSettings androidInitializationSettings =
        AndroidInitializationSettings('@mipmap/ic_launcher');
    final DarwinInitializationSettings iosInitializationSettings =
        DarwinInitializationSettings(
          requestAlertPermission: true,
          requestSoundPermission: true,
          requestBadgePermission: true,
          notificationCategories: [],
        );

    final InitializationSettings initializationSettings =
        InitializationSettings(
          android: androidInitializationSettings,
          iOS: iosInitializationSettings,
        );

    await _localNotificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: (NotificationResponse response) async {
        if (response.payload != null) {
          print('Notification payload: ${response.payload}');
        }
      },
    );
  }

  Future<void> showNotification(
    String title,
    String body,
    Map<String, dynamic> data,
  ) async {
    const AndroidNotificationDetails androidDetails =
        AndroidNotificationDetails(
          'channel_id',
          'channel_name',
          importance: Importance.high,
          priority: Priority.high,
          sound: RawResourceAndroidNotificationSound('notification_sound'),
        );

    const DarwinNotificationDetails iosDetails = DarwinNotificationDetails(
      presentAlert: true,
      presentBadge: true,
      presentSound: true,
      sound: 'notification_sound.mp3',
    );

    const NotificationDetails notificationDetails = NotificationDetails(
      android: androidDetails,
      iOS: iosDetails,
    );

    await _localNotificationsPlugin.show(
      0,
      title,
      body,
      notificationDetails,
      payload: jsonEncode(data),
    );
  }

  void _handleForegroundNotification(Map<String, dynamic> data) {
    String? type = data[NotificationTypes.type];
    // String referenceUuid = data[NotificationTypes.referenceUuid];

    //   if (type == NotificationTypes.newPurchase &&
    //       Get.isRegistered<ChefPurchaseOrdersController>()) {
    //     ChefPurchaseOrdersController controller = Get.find();P
    //     controller.resetControllerState();
    //     controller.getPurchasesOrders();
    //   }
    // if (type == NotificationTypes.purchaseCaptainWay &&
    //     Get.isRegistered<PurchasesOrderDetailsController>()) {
    //   PurchasesOrderDetailsController controller = Get.find();
    //   controller.getPurchasesOrderDetails(referenceUuid);
    // }
    // if (type == NotificationTypes.purchaseCompleted &&
    //     Get.isRegistered<ChefPurchasesOrderDetailsController>()) {
    //   ChefPurchasesOrderDetailsController controller = Get.find();
    //   controller.getChefPurchasesDetails(referenceUuid);
    // }
    // if ((type == NotificationTypes.newOrder ||
    //         type == NotificationTypes.orderCanceled) &&
    //     Get.isRegistered<CookOtherOrdersController>()) {
    //   CookOtherOrdersController controller = Get.find();
    //   controller.getAddressData(false);
    // }
    // if (type == NotificationTypes.newOffer &&
    //     Get.isRegistered<CookMeOrderDetailsController>()) {
    //   CookMeOrderDetailsController controller = Get.find();
    //   controller.sortOffers(referenceUuid, AppConstants.distance);
    // }
    // if (type == NotificationTypes.orderProgress &&
    //     Get.isRegistered<ChefMyOffersController>()) {
    //   ChefMyOffersController controller = Get.find();
    //   controller.getAddressData();
    // }
    // if ((type == NotificationTypes.orderProgress ||
    //         type == NotificationTypes.orderCompleted) &&
    //     Get.isRegistered<ChefOfferAndPrivateDetailsController>()) {
    //   ChefOfferAndPrivateDetailsController controller = Get.find();
    //   controller.chefOfferDetials(referenceUuid);
    // }
    // if (type == NotificationTypes.orderCaptainWay &&
    //     Get.isRegistered<CookMeOrderDetailsController>()) {
    //   CookMeOrderDetailsController controller = Get.find();
    //   controller.userCookMeDetails(referenceUuid, AppConstants.distance);
    // }

    // if ((type == NotificationTypes.joinJhefAccepted ||
    //         type == NotificationTypes.joinJhefRejected) &&
    //     Get.isRegistered<UserAccountController>()) {
    //   Get.offAllNamed(Routes.navigationBarScreen);
    //   if (Get.isRegistered<HomeController>()) {
    //     HomeController controller = Get.find();
    //     controller.getLocation();
    //   }
    // }

    if ((type == NotificationTypes.withdrawAccepted ||
            type == NotificationTypes.withdrawRejected ||
            type == NotificationTypes.walletWithdrawal ||
            type == NotificationTypes.walletDeposit) &&
        Get.isRegistered<WalletController>()) {
      WalletController controller = Get.find();
      controller.resetControllerState();
      controller.getWallet();
    }

    //   if ((type == NotificationTypes.accountVerificationAccepte ||
    //           type == NotificationTypes.accountVerificationRejecte) &&
    //       Get.isRegistered<ChefAccountController>()) {
    //     ChefAccountController controller = Get.find();
    //     controller.profile();
    //   }
  }

  void _onNotificationClicked(String type, String referenceUuid) {
    log('Notification clicked: $type');
    log("Notification clicked: $referenceUuid");

    switch (type) {
      // case NotificationTypes.newPurchase:
      //   Get.toNamed(
      //     Routes.chefPurchasesOrderDetailsScreen,
      //     arguments: {AppConstants.uuid: referenceUuid},
      //   );
      //   break;
      // case NotificationTypes.purchaseCaptainWay:
      //   Get.toNamed(
      //     Routes.purchasesOrderDetailsScreen,
      //     arguments: {AppConstants.uuid: referenceUuid},
      //   );
      //   break;
      // case NotificationTypes.purchaseCompleted:
      //   Get.toNamed(
      //     Routes.chefPurchasesOrderDetailsScreen,
      //     arguments: {AppConstants.uuid: referenceUuid},
      //   );
      //   break;
      // case NotificationTypes.newOrder:
      // case NotificationTypes.orderCanceled:
      //   Get.toNamed(Routes.cookOtherOrdersScreen);
      //   break;
      // case NotificationTypes.newOffer:
      // case NotificationTypes.orderCaptainWay:
      //   Get.toNamed(
      //     Routes.cookMeOrderDetailsScreen,
      //     arguments: {AppConstants.uuid: referenceUuid},
      //   );
      //   break;
      // case NotificationTypes.orderProgress:
      // case NotificationTypes.orderCompleted:
      //   Get.toNamed(
      //     Routes.chefOfferAndPrivateDetailsScreen,
      //     arguments: {AppConstants.uuid: referenceUuid},
      //   );
      //   break;
      // case NotificationTypes.joinJhefAccepted:
      // case NotificationTypes.joinJhefRejected:
      //   Get.offAllNamed(Routes.navigationBarScreen);
      //   break;
      case NotificationTypes.withdrawAccepted:
      case NotificationTypes.withdrawRejected:
        Get.toNamed(Routes.walletScreen);
        break;
      // case NotificationTypes.accountVerificationAccepte:
      // case NotificationTypes.accountVerificationRejecte:
      //   Get.toNamed(Routes.navigationBarScreen);
      //   if (Get.isRegistered<HomeController>()) {
      //     HomeController controller = Get.find();
      //     controller.getLocation();
      //   }
      //   break;
      default:
        log('Unknown notification payload: $type');
    }
  }

  Future<void> fetchAndStoreFCMToken() async {
    try {
      String? token = await _firebaseMessaging.getToken();
      await AppSharedData.setSecuredString(AppSharedKeys.fcmTokenKey, token!);
      log('FCM Token: $token');
    } catch (e) {
      log('Error fetching FCM Token: $e');
    }
  }

  Future<void> _checkInitialMessage() async {
    RemoteMessage? initialMessage = await _firebaseMessaging
        .getInitialMessage();
    if (initialMessage != null && initialMessage.data.isNotEmpty) {
      log('App opened from terminated state with notification');
      String? type = initialMessage.data[NotificationTypes.type];
      String? referenceUuid =
          initialMessage.data[NotificationTypes.referenceUuid];

      _onNotificationClicked(type!, referenceUuid ?? '');
    }
  }
}

@pragma('vm:entry-point')
Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  log('Background Message: ${message.data}');
}
