import 'package:shoply_app/core/local/local_storage.dart';

class LocalStorageDependency {
  static Future<void> initLocalStorage() async {
    await LocalStorages.instance.initSharedPreferences();
  }
}
