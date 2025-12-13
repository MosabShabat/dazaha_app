// 🧩 CORE IMPORTS

import 'package:firebase_core/firebase_core.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../constant/exports_libraries.dart';
import '../helpers/app_shared_data.dart';
import '../helpers/constants.dart';
import '../routes/routes.dart';

// 📦 FEATURES CONTROLLERS
import '../../features/choose_the_service/controller/order_data_controller.dart';
import '../../features/item_ad_details/controller/item_ad_details_controller.dart';
import '../../features/my_ads_details/controller/my_ads_details_controller.dart';
import '../../features/my_offer_ad_details/controller/my_offer_ad_details_controller.dart';
import '../../features/notifications/controller/notifications_controller.dart';
import '../../features/report_a_problem_chat_support/controller/chat_technical_support_controller.dart';
import '../../features/wallet/controller/wallet_controller.dart';

// 🧰 FIREBASE & NOTIFICATION PACKAGES
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

// ⚙️ DART PACKAGES
import 'dart:convert';
import 'dart:developer';

// 🔔 NOTIFICATION SERVICE IMPLEMENTATION
class NotificationService {
  static final NotificationService _instance = NotificationService._internal();

  factory NotificationService() => _instance;
  NotificationService._internal();

  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
  final FlutterLocalNotificationsPlugin _localNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  final OrderDataController _orderDataController = Get.find();

  // ================= INIT =================
  Future<void> init() async {
    await _requestPermission();
    await _initializeLocalNotifications();
    await fetchAndStoreFCMToken();

    // Foreground
    FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
      log('Foreground Notification: ${message.notification?.title}');

      final messageId =
          message.data['id']?.toString() ?? DateTime.now().toIso8601String();
      // ✅ استخدم await لأن isDuplicate الآن async
      if (await LocalNotificationDeduplicator.isDuplicate(messageId)) {
        log('⛔ Duplicate ignored: $messageId');
        return;
      }

      // فقط إذا التطبيق في foreground
      unreadNotificationLocal.value = 1;
      _handleForegroundNotification(message.data);

      await showNotification(
        message.notification?.title ?? 'No Title',
        message.notification?.body ?? 'No Body',
        message.data,
      );
    });

    // Background
    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

    // Terminated
    _checkInitialMessage();
  }

  // Background handler: لا تعرض إشعار محلي، فقط log
  // Background handler: يتحقق من التكرار قبل التعامل
  @pragma('vm:entry-point')
  Future<void> _firebaseMessagingBackgroundHandler(
    RemoteMessage message,
  ) async {
    await Firebase.initializeApp();
    final messageId = message.data['id'];
    if (messageId == null ||
        await LocalNotificationDeduplicator.isDuplicate(messageId)) {
      log('⛔ Duplicate ignored in background or no ID: $messageId');
      return;
    }
    log('Background Message received: ${message.data}');

    // ⚠️ لا تعرض إشعار هنا إذا كان التطبيق مغلقًا (terminated)
    // await showNotification(...);
  }

  // Terminated check: نفس المنطق
  Future<void> _checkInitialMessage() async {
    RemoteMessage? initialMessage = await _firebaseMessaging
        .getInitialMessage();
    if (initialMessage != null && initialMessage.data.isNotEmpty) {
      final messageId = initialMessage.data['id'];
      if (messageId != null &&
          await LocalNotificationDeduplicator.isDuplicate(messageId)) {
        log('⛔ Duplicate ignored in terminated: $messageId');
        return;
      }

      log('App opened from terminated state with notification');
      String? type = initialMessage.data[NotificationTypes.type];
      String? referenceUuid =
          initialMessage.data[NotificationTypes.referenceUuid];
      String? uuid = initialMessage.data['sender_uuid'];
      String? name = initialMessage.data['title'];
      String? image = initialMessage.data['image'];
      _onNotificationClicked(type!, referenceUuid ?? '', uuid, name, image);
    }
  }

  // ================= PERMISSIONS =================
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

  // ================= LOCAL NOTIFICATIONS =================
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
          Map<String, dynamic> data = jsonDecode(response.payload!);
          String type = data[NotificationTypes.type];
          String referenceUuid = data[NotificationTypes.referenceUuid] ?? '';
          String? uuid = data['sender_uuid'];
          String? name = data['title'];
          String? image = data['image'];

          // استدعاء دالة الضغط
          _onNotificationClicked(type, referenceUuid, uuid, name, image);
        }
      },
    );
  }

  // ================= SHOW NOTIFICATION =================
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

  // ================= FOREGROUND HANDLER =================
  void _handleForegroundNotification(Map<String, dynamic> data) {
    String? type = data[NotificationTypes.type];
    String referenceUuid = data[NotificationTypes.referenceUuid];
    String? uuid = data['sender_uuid'];
    String? name = data['title'];
    String? image = data['image'];

    log('type : $type');
    log('referenceUuid : $referenceUuid');
    log('sender_uuid : $uuid');
    log('name : $name');
    log('image : $image');

    // Notifications
    if ((type == NotificationTypes.general ||
            type == NotificationTypes.requestToJoinDriverAccepted ||
            type == NotificationTypes.requestToJoinDriverRejected ||
            type == NotificationTypes.reportedProblemNew ||
            type == NotificationTypes.reportedProblemInProgress ||
            type == NotificationTypes.reportedProblemResolved) &&
        Get.isRegistered<NotificationsController>()) {
      Get.find<NotificationsController>()
        ..resetControllerState()
        ..getNotifications();
    }

    // Technical Support
    if (type == NotificationTypes.newTechnicalSupportMessage &&
        Get.isRegistered<ChatTechnicalSupportController>()) {
      Get.find<ChatTechnicalSupportController>().getMessages(
        'technical_support',
      );
    }

    if (type == NotificationTypes.newMessage &&
        Get.isRegistered<ChatTechnicalSupportController>()) {
      Get.find<ChatTechnicalSupportController>().getMessages('${uuid}');
    }

    //newMessage

    // Offers
    if (type == NotificationTypes.offerExcluded &&
        Get.isRegistered<MyOfferAdDetailsController>()) {
      Get.find<MyOfferAdDetailsController>().getOfferDetails();
      if (referenceUuid.isNotEmpty) {
        _orderDataController.setItemUuid(referenceUuid);
      }
    }

    // Orders
    if ((type == NotificationTypes.orderInProgress) &&
        Get.isRegistered<MyOfferAdDetailsController>()) {
      MyOfferAdDetailsController offerController = Get.find();
      offerController.getOfferDetails();
      if (referenceUuid.isNotEmpty) {
        _orderDataController.setItemUuid(referenceUuid);
      }
    }

    if (type == NotificationTypes.newOrder &&
        Get.isRegistered<ItemAdDetailsController>()) {
      Get.find<ItemAdDetailsController>().getOrderDetails();
    }

    if ((type == NotificationTypes.newOffer ||
            type == NotificationTypes.orderCompleted ||
            type == NotificationTypes.orderDelivered ||
            type == NotificationTypes.orderStarted ||
            type == NotificationTypes.orderCanceled) &&
        Get.isRegistered<MyAdsDetailsController>()) {
      MyAdsDetailsController controller = Get.find<MyAdsDetailsController>();
      controller.getMyOrderDetails();
      controller.getMyOrderOffers("created_at");
    }

    // Wallet
    if ((type == NotificationTypes.depositOrder ||
            type == NotificationTypes.depositCanceledOrder ||
            type == NotificationTypes.withdrawAccepted ||
            type == NotificationTypes.withdrawRejected ||
            type == NotificationTypes.walletWithdrawal ||
            type == NotificationTypes.walletDeposit) &&
        Get.isRegistered<WalletController>()) {
      Get.find<WalletController>()
        ..resetControllerState()
        ..getWallet();
    }
  }

  // 🧭 When user clicks notification
  void _onNotificationClicked(
    String type,
    String referenceUuid,
    String? uuid,
    String? name,
    String? image,
  ) {
    log('Notification clicked: $type');
    log('referenceUuid: $referenceUuid');

    switch (type) {
      case NotificationTypes.general:
      case NotificationTypes.requestToJoinDriverAccepted:
      case NotificationTypes.requestToJoinDriverRejected:
      case NotificationTypes.reportedProblemNew:
      case NotificationTypes.reportedProblemInProgress:
      case NotificationTypes.reportedProblemResolved:
        Get.toNamed(Routes.notificationsScreen);
        break;

      case NotificationTypes.newOrder:
        _orderDataController.setItemUuid(referenceUuid);
        Get.toNamed(Routes.itemAdDetailsScreen, arguments: {"isShow": true});
        break;

      case NotificationTypes.newOffer:
      case NotificationTypes.orderCanceled:
      case NotificationTypes.orderCompleted:
      case NotificationTypes.orderDelivered:
      case NotificationTypes.orderStarted:
        _orderDataController.setItemUuid(referenceUuid);
        Get.toNamed(Routes.myAdsDetailsScreen);
        break;

      case NotificationTypes.orderInProgress:
        if (referenceUuid.isNotEmpty) {
          _orderDataController.setOfferItemDetUuid(referenceUuid);
          // _orderDataController.setItemStatus(
          //   type == NotificationTypes.orderInProgress ||
          //           type == NotificationTypes.orderStarted ||
          //           type == NotificationTypes.orderDelivered
          //       ? 'in_progress'
          //       : 'completed',
          // );
          Get.toNamed(Routes.myOfferAdDetailsScreen);
        } else {
          Get.offAllNamed(Routes.homeScreen, arguments: {'selectedIndex': 1});
        }
        break;

      case NotificationTypes.offerExcluded:
        Get.toNamed(Routes.myOfferAdDetailsScreen);
        break;

      case NotificationTypes.depositOrder:
      case NotificationTypes.depositCanceledOrder:
      case NotificationTypes.withdrawAccepted:
      case NotificationTypes.withdrawRejected:
      case NotificationTypes.walletWithdrawal:
      case NotificationTypes.walletDeposit:
        Get.toNamed(Routes.walletScreen);
        break;

      case NotificationTypes.newTechnicalSupportMessage:
        Get.toNamed(
          Routes.reportAProblemChatSupportScreen,
          arguments: {
            AppConstants.liveSupport: true,
            AppConstants.uuid: 'technical_support',
            AppConstants.receiverImage: 'image_url',
            AppConstants.receiverName: 'Support Bot',
            AppConstants.receiverVerify: true,
          },
        );
        break;

      case NotificationTypes.newMessage:
        Get.toNamed(
          Routes.reportAProblemChatSupportScreen,
          arguments: {
            AppConstants.liveSupport: false,
            AppConstants.uuid: '${uuid}',
            AppConstants.receiverImage: '${image}',
            AppConstants.receiverName: '${name}',
            AppConstants.receiverVerify: true,
          },
        );
        break;

      default:
        log('Unknown notification payload: $type');
    }
  }

  // ================= TOKEN =================
  Future<void> fetchAndStoreFCMToken() async {
    try {
      String? token = await _firebaseMessaging.getToken();
      await AppSharedData.setSecuredString(AppSharedKeys.fcmTokenKey, token!);
      log('FCM Token: $token');
    } catch (e) {
      log('Error fetching FCM Token: $e');
    }
  }

  // Future<void> _checkInitialMessage() async {
  //   RemoteMessage? initialMessage = await _firebaseMessaging
  //       .getInitialMessage();
  //   if (initialMessage != null && initialMessage.data.isNotEmpty) {
  //     log('App opened from terminated state with notification');
  //     String? type = initialMessage.data[NotificationTypes.type];
  //     String? referenceUuid =
  //         initialMessage.data[NotificationTypes.referenceUuid];
  //     String? uuid = initialMessage.data['sender_uuid'];
  //     String? name = initialMessage.data['title'];
  //     String? image = initialMessage.data['image'];
  //     _onNotificationClicked(type!, referenceUuid ?? '', uuid, name, image);
  //   }
  // }

  // Future<void> _firebaseMessagingBackgroundHandler(
  //   RemoteMessage message,
  // ) async {
  //   print('Background Message: ${message.data}');
  // }
}

class LocalNotificationDeduplicator {
  static Future<bool> isDuplicate(String id) async {
    final prefs = await SharedPreferences.getInstance();
    final shownIds = prefs.getStringList('shown_notification_ids') ?? [];
    if (shownIds.contains(id)) return true;
    shownIds.add(id);
    if (shownIds.length > 100) shownIds.removeAt(0);
    await prefs.setStringList('shown_notification_ids', shownIds);
    return false;
  }
}
