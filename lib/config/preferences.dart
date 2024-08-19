import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import '../model/user.dart';

class Preferences {
  static SharedPreferences? _preferences;

  static Future<void> init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  static SharedPreferences getSharedPreferences() {
    if (_preferences == null) {
      throw Exception("SharedPreferences not initialized. Call init() first.");
    }
    return _preferences!;
  }

  static Future<void> setString(String key, String value) async {
    await _preferences!.setString(key, value);
  }

  static String? getString(String key) {
    return _preferences!.getString(key);
  }

  static Future<void> setEnteringFirstTime(bool value) async {
    await _preferences!.setBool('geEnteringFirstTime', value);
    print(" pegou certo $value");
  }

  static bool getEnteringFirstTime() {
    return _preferences!.getBool("geEnteringFirstTime") ?? false;
  }

  static Future<void> setListNotifyDataCompare(List<UserModel> list) async {
    final json = jsonEncode(list);
    await setString('arrayNotifyCompare', json);
  }

  static List<UserModel>? getListNotifyDataCompare() {
    final json = getString('arrayNotifyCompare');
    if (json != null && json.isNotEmpty) {
      final list = jsonDecode(json) as List<dynamic>;
      return list.map((item) => UserModel.fromJson(item)).toList();
    }
    return null;
  }

  static Future<void> saveInstanceTokenFcm(String key, String value) async {
    await setString(key, value);
  }

  static String? getInstanceTokenFcm() {
    return getString('token');
  }

  static Future<void> storeInt(String key, int value) async {
    await _preferences!.setInt(key, value);
  }

  static int getInt(String key, int defaultValue) {
    return _preferences!.getInt(key) ?? defaultValue;
  }

  static Future<void> setUserData(UserModel? user) async {
    final json = user != null ? jsonEncode(user.toJson()) : '';
    await setString('getData', json);
  }

  static UserModel? getUserData() {
    final json = getString('getData');
    if (json != null && json.isNotEmpty) {
      return UserModel.fromJson(jsonDecode(json));
    }
    return null;
  }

  static Future<void> setLogin(bool enable) async {
    final preferences = await getSharedPreferences();
    await preferences.setBool('login', enable);
  }

  static Future<bool> getLogin() async {
    final preferences = await getSharedPreferences();
    return preferences.getBool('login') ?? false;
  }

  static Future<void> clearUserData() async {
    final preferences = await getSharedPreferences();
    await preferences.remove('getData');
    await preferences.remove('login');
    await preferences.remove('token');
    await preferences.remove('unreadNotificationsCount');
    await preferences.remove('hasSeenTutorial');
    await preferences.remove('correctWords');
    print("foi limpo tudo");
  }
  static Future<void> clearProfissionalUserData() async {
    final preferences = await getSharedPreferences();
    await preferences.remove('ProfissionalUser');
    await preferences.remove('login');
    await preferences.remove('token');
    await preferences.remove('unreadNotificationsCount');
    await preferences.remove('hasSeenTutorial');
    await preferences.remove('correctWords');
    print("foi limpo tudo");
  }

  static Future<void> setUnreadNotificationsCount(int count) async {
    await _preferences!.setInt('unreadNotificationsCount', count);
  }

  static int getUnreadNotificationsCount() {
    return _preferences!.getInt('unreadNotificationsCount') ?? 0;
  }

  static Future<void> setHasSeenTutorial(bool value) async {
    await _preferences!.setBool('hasSeenTutorial', value);
  }

  static bool getHasSeenTutorial() {
    return _preferences!.getBool('hasSeenTutorial') ?? false;

  }
  static Future<void> saveCorrectWords(List<String> words) async {
    final json = jsonEncode(words);
    await setString('correctWords', json);
  }

  static List<String> getCorrectWords() {
    final json = getString('correctWords');
    if (json != null && json.isNotEmpty) {
      final list = jsonDecode(json) as List<dynamic>;
      return list.map((item) => item.toString()).toList();
    }
    return [];
  }
  // Obtém o purchaseId salvo.
  static String getPurchaseId() {
    return _preferences!.getString("keyPurchaseId") ?? '';
  }

  // Define o purchaseId nas preferências.
  static Future<void> setPurchaseId(String purchaseId) async {
    await _preferences!.setString("_keyPurchaseId", purchaseId);
  }

  // Remove o purchaseId das preferências.
  static Future<void> removePurchaseId() async {
    await _preferences!.remove("_keyPurchaseId");
  }

  static const ENTERING_FIRST_TIME = 'EnteringFirstTime';
}
