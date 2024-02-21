import 'package:dartz/dartz.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:nike_app_vendors/app/core/errors/faliure.dart';
import 'remote_notification_Repo.dart';

class RemoteNotificationRepoImpl extends RemoteNotificationRepo {
  FirebaseMessaging messaging = FirebaseMessaging.instance;

  @override
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
      print('User granted permission');
    } else if (settings.authorizationStatus ==
        AuthorizationStatus.provisional) {
      print('User granted provisional permission');
    } else {
      print('User declined or has not accepted permission');
    }
  }

  @override
  Future<Either<Faliures, void>> sendNotificationToAllUsers() {
    // TODO: implement sendNotificationToAllUsers
    throw UnimplementedError();
  }
}
