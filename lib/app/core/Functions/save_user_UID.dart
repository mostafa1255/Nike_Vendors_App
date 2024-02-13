import 'package:shared_preferences/shared_preferences.dart';

class UserUID {
  static Future<void> saveUID(String uid) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("uid", uid);
  }

  static Future<String?> getUID() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("uid");
  }

  static Future<void> removeUID() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove("uid");
  }
}
