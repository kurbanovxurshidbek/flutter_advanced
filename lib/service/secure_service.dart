import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureService {
  static storeApiKey(String api_key) async {
    const storage = FlutterSecureStorage();
    await storage.write(key: "api_key", value: api_key);
  }

  static Future<String?> loadApiKey() async {
    const storage = FlutterSecureStorage();
    String? api_key = await storage.read(key: "api_key");
    return api_key;
  }

  static Future<void> removeApiKey() async {
    const storage = FlutterSecureStorage();
    await storage.delete(key: "api_key");
  }
}
