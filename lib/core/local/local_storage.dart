import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  static LocalStorage? _instance;
  static SharedPreferences? _preferences;

  LocalStorage.init() {
    _instance = this;
  }

  static LocalStorage get instance {
    _instance ??= LocalStorage.init();
    return _instance!;
  }

  Future<SharedPreferences> initSharedPreferences() async {
    return _preferences = await SharedPreferences.getInstance();
  }

  Future<void> setShowOnboarding({required bool isShowOnboarding}) async {
    await _preferences?.setBool('show_onboarding', isShowOnboarding);
  }

  bool getShowOnboarding() {
    return _preferences?.getBool('show_onboarding') ?? false;
  }
}
