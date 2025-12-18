// 🧩 CORE IMPORTS

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

@pragma('vm:entry-point')
Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  log('📩 [BG] FCM data: ${message.data}');
}

class NotificationService {
  static final NotificationService _instance = NotificationService._internal();

  factory NotificationService() => _instance;
  NotificationService._internal();

  final FirebaseMessaging _fm = FirebaseMessaging.instance;
  final FlutterLocalNotificationsPlugin _fln =
      FlutterLocalNotificationsPlugin();

  bool _initialHandled = false;

  String? _asString(dynamic v) => v == null ? null : v.toString().trim();

  String? _extractType(Map<String, dynamic> data) =>
      _asString(data[NotificationTypes.type] ?? data['type']);

  String? _extractReferenceUuid(Map<String, dynamic> data) => _asString(
    data[NotificationTypes.referenceUuid] ?? data['reference_uuid'],
  );

  String? _extractSenderUuid(Map<String, dynamic> data) =>
      _asString(data[NotificationTypes.uuid] ?? data['sender_uuid']);

  String? _extractReceiverImage(Map<String, dynamic> data) =>
      _asString(data[NotificationTypes.receiverImage] ?? data['image']);

  String? _extractReceiverName(Map<String, dynamic> data) =>
      _asString(data[NotificationTypes.receiverName] ?? data['title']);

  bool? _extractReceiverVerify(Map<String, dynamic> data) {
    final raw = data['is_verified'];
    if (raw == null) return null;
    final str = raw.toString().trim().toLowerCase();
    if (str == '1' || str == 'true') return true;
    if (str == '0' || str == 'false') return false;
    return null;
  }

  final OrderDataController _orderDataController = Get.find();

  // ================= INIT =================
  Future<void> init() async {
    final settings = await _fm.requestPermission(
      alert: true,
      badge: true,
      sound: true,
    );
    log('🔔 FCM permission: ${settings.authorizationStatus}');
    await _initializeLocalNotifications();
    await _handleLocalLaunchIfAny();
    await fetchAndStoreFCMToken();

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      final data = message.data;
      unreadNotificationLocal.value = 1;
      final prettyData = const JsonEncoder.withIndent('  ').convert(data);
      log('🟡 [FG] FCM from: ${message.from}');
      log('🟡 [FG] reference_uuid: ${message.data['reference_uuid']}');
      log('🟡 [FG] Notification Data:\n$prettyData');

      _handleForegroundNotification(data);
      showNotification(
        message.notification?.title ?? 'Notification',
        message.notification?.body ?? '',
        data,
      );
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      log('🟡 [BG→OPEN] data: ${message.data}');
      _handleClickFromMap(message.data);
    });

    FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);

    // هذا خاص بإشعار FCM لما التطبيق كان مغلق
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await _checkInitialMessage();
    });
  }

  // ================= LOCAL NOTIFICATIONS =================

  Future<void> _initializeLocalNotifications() async {
    const androidInit = AndroidInitializationSettings('@mipmap/ic_launcher');
    final iosInit = DarwinInitializationSettings(
      requestAlertPermission: true,
      requestSoundPermission: true,
      requestBadgePermission: true,
    );

    final initSettings = InitializationSettings(
      android: androidInit,
      iOS: iosInit,
    );

    await _fln.initialize(
      initSettings,
      onDidReceiveNotificationResponse: (NotificationResponse response) async {
        final payload = response.payload;
        if (payload == null || payload.isEmpty) return;
        try {
          final Map<String, dynamic> data = jsonDecode(payload);
          _handleClickFromMap(data);
        } catch (e) {
          log('❌ Local click payload parse error: $e');
        }
      },
      onDidReceiveBackgroundNotificationResponse: _notificationTapBackground,
    );
  }

  @pragma('vm:entry-point')
  static void _notificationTapBackground(NotificationResponse response) {}

  // ================= SHOW NOTIFICATION =================
  Future<void> showNotification(
    String title,
    String body,
    Map<String, dynamic> data,
  ) async {
    const android = AndroidNotificationDetails(
      'default_channel',
      'Default Notifications',
      importance: Importance.high,
      priority: Priority.high,
      playSound: true,
      sound: RawResourceAndroidNotificationSound('notification_sound'),
    );
    const ios = DarwinNotificationDetails(
      presentAlert: true,
      presentBadge: true,
      presentSound: true,
      sound: 'notification_sound.mp3',
    );
    const details = NotificationDetails(android: android, iOS: ios);

    await _fln.show(0, title, body, details, payload: jsonEncode(data));
  }

  // ================= FOREGROUND HANDLER =================
  void _handleForegroundNotification(Map<String, dynamic> data) {
    final type = data[NotificationTypes.type]?.toString() ?? '';
    final referenceUuid =
        data[NotificationTypes.referenceUuid]?.toString() ?? '';
    final uuid = data[NotificationTypes.uuid]?.toString() ?? '';
    final name =
        data[NotificationTypes.receiverName]?.toString() ??
        data['title']?.toString() ??
        '';
    final image =
        data[NotificationTypes.receiverImage]?.toString() ??
        data['image']?.toString() ??
        '';

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

  void _handleClickFromMap(Map<String, dynamic> data) {
    final type = _extractType(data) ?? '';
    if (type.isEmpty) {
      log('🔶 Click data without type');
      return;
    }
    final referenceUuid = _extractReferenceUuid(data) ?? '';

    final uuid = _extractSenderUuid(data) ?? '';
    final receiverImage = _extractReceiverImage(data) ?? '';
    final receiverName = _extractReceiverName(data) ?? '';
    final receiverVerify = _extractReceiverVerify(data) ?? false;

    Future.microtask(() {
      _onNotificationClicked(
        type,
        referenceUuid,
        uuid,
        receiverImage,
        receiverName,
        receiverVerify,
      );
    });
  }

  // 🧭 When user clicks notification
  void _onNotificationClicked(
    String type,
    String referenceUuid,
    String uuid,
    String receiverImage,
    String receiverName,
    bool receiverVerify,
  ) {
    log('👉 Notification clicked: type=$type');
    log('👉 referenceUuid=$referenceUuid');

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
            AppConstants.receiverImage: '${receiverImage}',
            AppConstants.receiverName: '${receiverName}',
            AppConstants.receiverVerify: receiverVerify,
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
      String? token = await _fm.getToken();
      await AppSharedData.setSecuredString(AppSharedKeys.fcmTokenKey, token!);
      log('FCM Token: $token');
    } catch (e) {
      log('Error fetching FCM Token: $e');
    }
  }

  Future<void> _checkInitialMessage() async {
    if (_initialHandled) return;
    final RemoteMessage? msg = await _fm.getInitialMessage();
    if (msg == null || msg.data.isEmpty) return;
    _initialHandled = true;
    log('🚀 Launched from FCM (terminated) → data: ${msg.data}');
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _handleClickFromMap(msg.data);
    });
  }

  Future<void> _handleLocalLaunchIfAny() async {
    final details = await _fln.getNotificationAppLaunchDetails();
    log('🟣 Local launch details: ${details?.didNotificationLaunchApp}');
    if (details?.didNotificationLaunchApp ?? false) {
      final payload = details!.notificationResponse?.payload;
      log('🟣 Local launch payload: $payload');
      if (payload != null && payload.isNotEmpty) {
        try {
          final Map<String, dynamic> data = jsonDecode(payload);
          WidgetsBinding.instance.addPostFrameCallback((_) {
            _handleClickFromMap(data);
          });
        } catch (e) {
          log('❌ Local launch payload parse error: $e');
        }
      }
    }
  }
}
