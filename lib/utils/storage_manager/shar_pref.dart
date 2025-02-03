import 'package:shared_preferences/shared_preferences.dart';

class SharePref {
  static Future<dynamic> storeList({required List<String> value}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setStringList('items', value);

    print(prefs.get("items"));
  }

  static Future<dynamic> getStoreList() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    print(prefs.get("items"));
    return prefs.get("items");
  }
}
