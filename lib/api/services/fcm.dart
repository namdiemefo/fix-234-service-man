import 'dart:convert';
import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:service_man/api/models/fcm/push_notification_model.dart';

Future _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  print("Handling a background message: ${message?.messageId}");
  PushNotificationPayloadFromData payloadData =
  PushNotificationPayloadFromData.fromJson(
      jsonDecode(message.data["data"]));
  PushNotificationModel notification = PushNotificationModel(
    title: message.notification.title,
    body: message.notification.body,
    dataTitle: message.data["title"],
    dataBody: message.data['body'],
    notificationType: payloadData.notificationType,
  );

  if (notification != null) {
    print("message background is ${notification.body}");

    showSimpleNotification(
      Text(notification.title),
      leading: Container(),
      subtitle: Text(notification.body),
      background: Colors.cyan.shade700,
      duration: Duration(seconds: 2),
    );
  }
}

class PushNotificationService {

  static final PushNotificationService _instance =
  PushNotificationService._internal();

  PushNotificationService._internal() {}
  static PushNotificationService instance = _instance;

  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
  FlutterLocalNotificationsPlugin();
  String _fcmToken;

  String get fcmToken => _fcmToken;

  static const AndroidNotificationChannel channel = AndroidNotificationChannel(
    'mychannel', // id
    'High Importance Notifications', // title
    'This channel is used for important notifications.', // description
    importance: Importance.max,
  );

  // For handling notification when the app is in terminated state
  checkForInitialMessage() async {
    // await Firebase.initializeApp();
    //_fcmToken = await _firebaseMessaging.getToken();
    RemoteMessage initialMessage = await _firebaseMessaging.getInitialMessage();

    if (initialMessage != null) {
      PushNotificationModel notification = PushNotificationModel(
        title: initialMessage.notification?.title,
        body: initialMessage.notification?.body,
      );
      flutterLocalNotificationsPlugin
          .show(
          notification.hashCode,
          notification.title,
          notification.body,
          NotificationDetails(
            android: AndroidNotificationDetails(
                channel.id, channel.name, channel.description),
            iOS: IOSNotificationDetails(),
          ))
          .then((value) => print("value shown"))
          .onError((error, stackTrace) => print("error is $error"))
          .catchError(() => print("error thrown"));
      // showNotification(notification);
    }
  }

  void setUpPlatformNotifications() async {
    // set up background message handler
    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
    AndroidInitializationSettings androidInitializationSettings =
        AndroidInitializationSettings('@drawable/launcher_icon');
    IOSInitializationSettings iosInitializationSettings =
    IOSInitializationSettings();

    flutterLocalNotificationsPlugin.initialize(InitializationSettings(
        android: androidInitializationSettings,
        iOS: iosInitializationSettings));

    if (Platform.isAndroid) {
      await flutterLocalNotificationsPlugin
          .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin>()
          .createNotificationChannel(channel);
    }

    _fcmToken = await _firebaseMessaging.getToken();
    // print("token is $_fcmToken");

    NotificationSettings settings = await _firebaseMessaging.requestPermission(
      alert: true,
      badge: true,
      provisional: false,
      sound: true,
    );

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      checkForInitialMessage();


      // LISTEN IN THE FOREGROUND
      FirebaseMessaging.onMessage.listen((RemoteMessage message) {
        PushNotificationPayloadFromData payloadData =
        PushNotificationPayloadFromData.fromJson(
            jsonDecode(message.data["data"]));
        PushNotificationModel notification = PushNotificationModel(
          title: message.notification.title,
          body: message.notification.body,
          dataTitle: message.data["title"],
          dataBody: message.data['body'],
          notificationType: payloadData.notificationType,
        );

        if (notification != null) {
          //   print("message on message is ${message.messageId}");
          // log(message.data.toString());
          flutterLocalNotificationsPlugin
              .show(
              notification.notificationType,
              notification.title,
              notification.body,
              NotificationDetails(
                android: AndroidNotificationDetails(
                    channel.id, channel.name, channel.description),
                iOS: IOSNotificationDetails(),
              ))
              .then((value) => print("value shown"))
              .onError((error, stackTrace) => print("error is $error"))
              .catchError((error, stackTrace) => print("error thrown"));
          //showNotification(notification);
        }
      }).onData((message) async {
        PushNotificationPayloadFromData payloadData =
        PushNotificationPayloadFromData.fromJson(
            jsonDecode(message.data["data"]));

        PushNotificationModel notification = PushNotificationModel(
          title: message.notification.title,
          body: message.notification.body,
          dataTitle: message.data["title"],
          dataBody: message.data['body'],
          notificationType: payloadData.notificationType,
        );

        if (notification != null) {
          //   print("message on message is ${message.messageId}");
          // log(message.data.toString());
          await flutterLocalNotificationsPlugin
              .show(
              notification.notificationType,
              notification.title,
              notification.body,
              NotificationDetails(
                android: AndroidNotificationDetails(
                    channel.id, channel.name, channel.description),
                iOS: IOSNotificationDetails(),
              ))
              .then((value) => print("value shown"))
              .onError((error, stackTrace) => print("error is $error"))
              .catchError((error, stackTrace) => print("error thrown"));
          //showNotification(notification);
        }
      });

    }


  }


}