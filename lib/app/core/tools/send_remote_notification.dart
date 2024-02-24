import 'package:dio/dio.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:nike_app_vendors/app/core/tools/api_Services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../errors/dio_faliure.dart';
import 'local_notification_services.dart';

class RemoteNotificationService {
  ApiServices apiServices = ApiServices(dio: Dio());
  FirebaseMessaging messaging = FirebaseMessaging.instance;
  Future<void> requestNotificationPermission() async {
    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );
    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      if (kDebugMode) {
        print('User granted permission');
      }
    } else if (settings.authorizationStatus ==
        AuthorizationStatus.provisional) {
      if (kDebugMode) {
        print('User granted provisional permission');
      }
    } else if (settings.authorizationStatus == AuthorizationStatus.denied) {
      if (kDebugMode) {
        print('User declined or has denied permission');
      }
    } else {
      if (kDebugMode) {
        print('User declined or has not accepted permission');
      }
    }
  }

  Future<void> subscribeToTopic() async {
    await messaging.subscribeToTopic('products');
  }

  static Future<void> getTokenInSharedPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? fcmToken = await FirebaseMessaging.instance.getToken();
    if (fcmToken != null) {
      prefs.setString("fcmToken", fcmToken);
    }
  }

  static void remoteMessageToLocalNotification() {
    FirebaseMessaging.onMessage.listen((message) {
      LocalNotificationService.showNotification(message: message);
    });
  }

  Future<void> sendRemoteNotification(
      {required String title,
      required String body,
      required String image}) async {
    try {
      await apiServices.post(
        url: 'https://fcm.googleapis.com/fcm/send',
        data: {
          "to": "/topics/products",
          "notification": {"title": title, "body": body, "image": image},
        },
        options: Options(
          headers: {
            'Accept': '*/*',
            'Content-Type': 'application/json',
            'Authorization':
                'key=AAAAHMT5M7k:APA91bGxNt1JZqU1AsmU0CK21nPDKF6hcgTe4UgZcVzQDEcgdbVCJTlxg03SrBnXfz4fukIdzwEOuYn-mHBfRjC0gjHXQ_gSTbn07fx3KmDeXYSU51POwUFG_Zximes-LJKIYe3eAWoN'
          },
        ),
      );
    } on DioException catch (e) {
      ServerFaliure(e.toString());
    }
  }
}
