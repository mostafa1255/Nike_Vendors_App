import 'package:dio/dio.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:nike_app_vendors/app/core/tools/api_Services.dart';
import '../errors/dio_faliure.dart';
import '../tools/local_notification_services.dart';

class RemoteNotificationService {
  ApiServices apiServices = ApiServices(dio: Dio());

  Future<void> sendRemoteNotification(
      {required String title,
      required String body,
      required String image}) async {
    try {
      apiServices.post(
        url: 'https://fcm.googleapis.com/fcm/send',
        data: {
          "to":
              "feY5OROWSBOPoH1yH-s2hU:APA91bFXoCGOSsmxWYN-2iSGWzxVJSPxk30iMgou_SMuL1mJpnWp8XwXJPp_nBWIaWAP_B3ivgD814T72C9Wvq9ryf6E3cRaCieWZh8lLmYFjAbi0Mer5COBmkOMEo3kd2kQawDdNYUC",
          "notification": {"title": title, "body": body, "image": image}
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
      print("Notification sent");
    } on DioException catch (e) {
      ServerFaliure(e.toString());
    }
  }

  static Future<void> getToken() async {
    String? fcmToken = await FirebaseMessaging.instance.getToken();
    
  }

  static void remoteMessageToLocalNotification() {
    FirebaseMessaging.onMessage.listen((message) {
      LocalNotificationService.showNotification(message: message);
    });
  }
}
