import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

initInfo() {
  var androidInitialize =
      const AndroidInitializationSettings("@mipmap/ic_launcher");
  var IOSInitialize = const DarwinInitializationSettings();
  var initializationsSettings =
      InitializationSettings(android: androidInitialize, iOS: IOSInitialize);
  FlutterLocalNotificationsPlugin().initialize(initializationsSettings,
      onDidReceiveNotificationResponse: (details) async {
    try {
      if (details.payload != null && details.payload!.isNotEmpty) {
      } else {}
    } catch (e) {}
    return;
  });
  FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
    print(".............onMessage.............");
    print(
        "onMessage: ${message.notification?.title}/${message.notification?.body}}");

    BigTextStyleInformation bigTextStyleInformation = BigTextStyleInformation(
      message.notification!.body.toString(),
      htmlFormatBigText: true,
      contentTitle: message.notification!.title.toString(),
      htmlFormatContentTitle: true,
    );

    AndroidNotificationDetails androidPlatformChannelSpecifics =
        AndroidNotificationDetails(
      'dbfood',
      'dbfood',
      importance: Importance.high,
      styleInformation: bigTextStyleInformation,
      priority: Priority.high,
      playSound: true,
    );

    NotificationDetails platformChannelSpecifics = NotificationDetails(
        android: androidPlatformChannelSpecifics,
        iOS: const DarwinNotificationDetails());
    await FlutterLocalNotificationsPlugin().show(
      0,
      message.notification!.title,
      message.notification!.body,
      platformChannelSpecifics,
      payload: message.data['body'],
    );
  });
}

void requestPermission() async {
  FirebaseMessaging messaging = FirebaseMessaging.instance;

  NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true);

  if (settings.authorizationStatus == AuthorizationStatus.authorized) {
    print('User granted permission');
  } else if (settings.authorizationStatus == AuthorizationStatus.provisional) {
    print("User granted Provisional permission");
  } else {
    print("User declined or has not accepted permission");
  }
}
