import 'dart:io';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter/services.dart';

class NotificationService {
  static final NotificationService _instance = NotificationService._internal();

  factory NotificationService() => _instance;

  NotificationService._internal();

  static final FlutterLocalNotificationsPlugin _notifications =
      FlutterLocalNotificationsPlugin();

  static Future<void> initialize() async {
    const AndroidInitializationSettings androidSettings =
        AndroidInitializationSettings('@mipmap/ic_launcher');

    const DarwinInitializationSettings iosSettings =
        DarwinInitializationSettings(
          requestAlertPermission: true,
          requestBadgePermission: true,
          requestSoundPermission: true,
        );

    const InitializationSettings settings = InitializationSettings(
      android: androidSettings,
      iOS: iosSettings,
    );

    await _createNotificationChannel();
    await _notifications.initialize(settings);
  }

  static Future<void> _createNotificationChannel() async {
    const AndroidNotificationChannel channel = AndroidNotificationChannel(
      'order_channel',
      'Order Notifications',
      description: 'Notifications for order updates',
      importance: Importance.high,
      playSound: true,
    );

    await _notifications
        .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin
        >()
        ?.createNotificationChannel(channel);
  }

  static Future<bool> checkAndRequestPermissions() async {
    if (Platform.isAndroid) {
      final androidPlugin = _notifications
          .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin
          >();

      if (androidPlugin != null) {
        final bool? enabled = await androidPlugin.areNotificationsEnabled();

        if (enabled == false) {
          try {
            final bool? granted = await androidPlugin
                .requestNotificationsPermission();
            return granted ?? false;
          } on PlatformException {
            return false;
          }
        }
        return true;
      }
    }
    return true;
  }

  static Future<void> showOrderSuccessNotification({
    required int orderId,
    required double totalAmount,
  }) async {
    final hasPermission = await checkAndRequestPermissions();
    if (!hasPermission) {
      return;
    }

    const AndroidNotificationDetails androidDetails =
        AndroidNotificationDetails(
          'order_channel',
          'Order Notifications',
          channelDescription: 'Notifications for order updates',
          importance: Importance.high,
          priority: Priority.high,
          playSound: true,
        );

    const DarwinNotificationDetails iosDetails = DarwinNotificationDetails(
      presentAlert: true,
      presentBadge: true,
      presentSound: true,
    );

    const NotificationDetails details = NotificationDetails(
      android: androidDetails,
      iOS: iosDetails,
    );

    await _notifications.show(
      orderId,
      'Order Confirmed!',
      'Your order #$orderId for ${totalAmount.toStringAsFixed(2)} has been placed successfully.',
      details,
    );
  }
}
