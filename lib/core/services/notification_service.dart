// import 'dart:convert';
import 'dart:convert';
import 'dart:developer';
import '../../../../features/document/controller/document_controller.dart';
import '../../../../features/my_ads/controller/transportation_and_delivery_controller.dart';
import '../../../../features/notifications/controller/notifications_controller.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:get/get.dart';
import '../../features/choose_the_service/controller/order_data_controller.dart';
import '../../features/wallet/controller/wallet_controller.dart';
import '../constant/exports_libraries.dart';
import '../helpers/app_shared_data.dart';
import '../helpers/constants.dart';
import '../routes/routes.dart';

class NotificationService {
  //new changes
  static final NotificationService _instance = NotificationService._internal();
  OrderDataController _orderDataController = Get.find();
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
    String referenceUuid = data[NotificationTypes.referenceUuid];

    // General / Notifications

    if ((type == NotificationTypes.general ||
            type == NotificationTypes.requestToJoinDriverAccepted ||
            type == NotificationTypes.requestToJoinDriverRejected ||
            type == NotificationTypes.reportedProblemNew ||
            type == NotificationTypes.reportedProblemInProgress ||
            type == NotificationTypes.reportedProblemResolved) &&
        Get.isRegistered<NotificationsController>()) {
      NotificationsController controller = Get.find();
      controller.resetControllerState();
      controller.getNotifications();
    }
    // Offers
    if ((type == NotificationTypes.offerExcluded) &&
        Get.isRegistered<DocumentController>()) {
      DocumentController controller = Get.find();
      controller.resetControllerState();
      controller.getOffers();
      if (referenceUuid != '' && referenceUuid.isNotEmpty) {
        _orderDataController.setItemUuid('${referenceUuid}');
        Get.toNamed(Routes.myOfferAdDetailsScreen);
      } else {
        Get.offAllNamed(
          Routes.homeScreen,
          arguments: {'selectedIndex': 3}, // Order screen
        );
      }
    }
    // Orders
    if ((type == NotificationTypes.newOffer ||
            type == NotificationTypes.newOrder ||
            type == NotificationTypes.orderCanceled ||
            type == NotificationTypes.orderInProgress ||
            type == NotificationTypes.orderCompleted) &&
        Get.isRegistered<TransportationAndDeliveryController>()) {
      TransportationAndDeliveryController controller = Get.find();
      controller.resetControllerState();
      controller.getMyOrders();
      if (referenceUuid != '' && referenceUuid.isNotEmpty) {
        if (type == NotificationTypes.newOffer) {
          _orderDataController.setItemUuid('${referenceUuid}');
          Get.toNamed(Routes.myAdsDetailsScreen);
        } else {
          _orderDataController.setItemUuid('${referenceUuid}');
          Get.toNamed(Routes.itemAdDetailsScreen);
        }
      } else {
        Get.offAllNamed(
          Routes.homeScreen,
          arguments: {'selectedIndex': 1}, // Order screen
        );
      }
    }

    if ((type == NotificationTypes.depositOrder ||
            type == NotificationTypes.depositCanceledOrder ||
            type == NotificationTypes.withdrawAccepted ||
            type == NotificationTypes.withdrawRejected ||
            type == NotificationTypes.walletWithdrawal ||
            type == NotificationTypes.walletDeposit) &&
        Get.isRegistered<WalletController>()) {
      WalletController controller = Get.find();
      controller.resetControllerState();
      controller.getWallet();
    }
  }

  void _onNotificationClicked(String type, String referenceUuid) {
    log('Notification clicked: $type');
    log("Notification clicked: $referenceUuid");

    switch (type) {
      // General / Notifications
      case NotificationTypes.general:
      case NotificationTypes.requestToJoinDriverAccepted:
      case NotificationTypes.requestToJoinDriverRejected:
      case NotificationTypes.reportedProblemNew:
      case NotificationTypes.reportedProblemInProgress:
      case NotificationTypes.reportedProblemResolved:
        Get.toNamed(Routes.notificationsScreen);
        break;
      // Orders
      case NotificationTypes.newOrder:
      case NotificationTypes.orderCanceled:
      case NotificationTypes.orderInProgress:
      case NotificationTypes.orderCompleted:
        Get.offAllNamed(
          Routes.homeScreen,
          arguments: {'selectedIndex': 1}, // Order screen
        );
        break;
      // عروض Offer
      // Offers
      case NotificationTypes.newOffer:
      case NotificationTypes.offerExcluded:
        Get.offAllNamed(
          Routes.homeScreen,
          arguments: {'selectedIndex': 3}, // Offer screen
        );
        break;
      // Wallet
      case NotificationTypes.withdrawAccepted:
      case NotificationTypes.withdrawRejected:
      case NotificationTypes.walletWithdrawal:
      case NotificationTypes.walletDeposit:
      case NotificationTypes.depositOrder:
      case NotificationTypes.depositCanceledOrder:
        Get.toNamed(Routes.walletScreen);
        break;

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
